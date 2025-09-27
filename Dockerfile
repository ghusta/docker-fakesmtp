ARG JAVA_IMAGE_TAG=17-jre
FROM eclipse-temurin:$JAVA_IMAGE_TAG

ARG APP_VERSION=2.8.0
# ca-certificates needed
ADD https://github.com/ghusta/FakeSMTP/releases/download/v${APP_VERSION}/fakeSMTP-${APP_VERSION}.jar /opt/fakeSMTP.jar

EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD ["java", "-jar", "/opt/fakeSMTP.jar", "--background", "--port", "25", "--output-dir", "/var/mail"]
