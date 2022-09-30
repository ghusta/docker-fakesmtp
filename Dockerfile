FROM eclipse-temurin:11-jre

ARG VERSION=2.2
RUN set -ex; \
    wget -q https://github.com/ghusta/FakeSMTP/releases/download/v${VERSION}/fakeSMTP-${VERSION}.jar -O fakeSMTP.jar; \
    mv fakeSMTP.jar /opt;

EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD java -jar /opt/fakeSMTP.jar --start-server --background --port 25 --output-dir /var/mail
