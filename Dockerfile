FROM openjdk:8-jre-slim

#No wget command in openjdk slim
RUN apt-get update && apt-get install -y wget unzip && apt-get autoremove -y && apt-get clean
RUN wget -q http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip && unzip fakeSMTP-latest.zip -d /opt && rm fakeSMTP-latest.zip
EXPOSE 25
VOLUME ["/var/mail"]

# Start the STMP server without a GUI (background)
CMD java -jar /opt/fakeSMTP-2.0.jar --start-server --background --port 25 --output-dir /var/mail
