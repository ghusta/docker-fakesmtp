FROM openjdk:15-alpine

# See also usage of openjdk:15-alpine tools at https://jpetazzo.github.io/2020/03/01/quest-minimal-docker-images-part-2/
RUN set -ex; \
    apk update; \
    apk add wget unzip; \
    wget -q http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip; \
    unzip fakeSMTP-latest.zip -d /opt; \
    rm fakeSMTP-latest.zip;

EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD java -jar /opt/fakeSMTP-2.0.jar --start-server --background --port 25 --output-dir /var/mail
