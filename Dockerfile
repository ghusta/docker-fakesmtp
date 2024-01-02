ARG JAVA_IMAGE_TAG=17-jre
FROM eclipse-temurin:$JAVA_IMAGE_TAG

ARG APP_VERSION=2.5.0
RUN set -ex; \
    wget -q https://github.com/ghusta/FakeSMTP/releases/download/v${APP_VERSION}/fakeSMTP-${APP_VERSION}.jar -O fakeSMTP.jar; \
    mv fakeSMTP.jar /opt;

EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD java -jar /opt/fakeSMTP.jar --start-server --background --port 25 --output-dir /var/mail
