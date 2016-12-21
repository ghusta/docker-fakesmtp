FROM openjdk:8-jre

RUN wget -q http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-1.13.zip && unzip fakeSMTP-1.13.zip -d /opt && rm fakeSMTP-1.13.zip
EXPOSE 25
VOLUME ["/var/mail"]

CMD java -jar /opt/fakeSMTP-1.13.jar -s -b -o /var/mail