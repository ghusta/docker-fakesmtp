ARG JAVA_IMAGE_TAG=17-jre
FROM eclipse-temurin:$JAVA_IMAGE_TAG

ARG APP_VERSION=2.6.2
RUN set -ex; \
    wget -q https://github.com/ghusta/FakeSMTP/releases/download/v${APP_VERSION}/fakeSMTP-${APP_VERSION}.jar -O fakeSMTP.jar; \
    mv fakeSMTP.jar /opt;

# Create a non-privileged user that the app will run under.
# See https://docs.docker.com/go/dockerfile-user-best-practices/
ARG UID=10001
RUN useradd --no-log-init --system --uid ${UID} fakesmtp \
    && usermod --append --groups mail fakesmtp
# User fakesmtp is added to system group mail to be able to write to /var/mail/
# See permissions : ls -ld /var/mail
USER fakesmtp

EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD ["java", "-jar", "/opt/fakeSMTP.jar", "--background", "--port", "25", "--output-dir", "/var/mail"]
