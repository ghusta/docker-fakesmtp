# docker-fakesmtp
Another docker image for FakeSMTP (https://github.com/Nilhcem/FakeSMTP)

# Overview
[FakeSMTP](https://github.com/Nilhcem/FakeSMTP) is a Free Fake SMTP Server with GUI for testing emails in applications easily. It is written in Java.

# Docker 
## Dockerfile
See original [there](https://github.com/Nilhcem/FakeSMTP/blob/master/Dockerfile).

## Usage
This allows you to run a SMTP server for testing applications which send mail. Each mail is written to a file in `/var/mail`
Starting a container :

    docker run -d -p 2525:25 -v /tmp/fakemail:/var/mail ghusta/fakesmtp:2.0

See also docker usage on the [original project](https://github.com/Nilhcem/FakeSMTP#usage-on-docker).

## Refactoring
I use **openjdk** as base image, as **java** image is now _deprecated_ (see https://hub.docker.com/_/java/).
Furthermore, I use the JRE version, as JDK is not necessary (image _openjdk:8-jre_ for example).
