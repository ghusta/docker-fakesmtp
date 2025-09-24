# docker-fakesmtp

[![Docker pulls](https://img.shields.io/docker/pulls/ghusta/fakesmtp.svg?logo=Docker)](https://hub.docker.com/r/ghusta/fakesmtp)
[![GitHub release](https://img.shields.io/github/v/release/ghusta/docker-fakesmtp?sort=semver&logo=GitHub)](https://github.com/ghusta/docker-fakesmtp/releases)

Another docker image for FakeSMTP (https://github.com/Nilhcem/FakeSMTP)

# Overview
[FakeSMTP](https://github.com/Nilhcem/FakeSMTP) is a Free Fake SMTP Server with GUI for testing emails in applications easily. It is written in Java.

# Docker 
## Dockerfile
See original [there](https://github.com/Nilhcem/FakeSMTP/blob/master/Dockerfile).

## Usage
This allows you to run a SMTP server for testing applications which send mail. Each mail is written to a file in `/var/mail`

Starting a container :

    docker run -d -p 2525:25 -v /tmp/fakemail:/var/mail ghusta/fakesmtp:2.7

See also docker usage on the [original project](https://github.com/Nilhcem/FakeSMTP#usage-on-docker).

## Refactoring
I use **eclipse-temurin** **~openjdk~** as base image, as **java** image is now _deprecated_ (see https://hub.docker.com/_/java/).
Furthermore, I use the JRE version, as JDK is not necessary (image _eclipse-temurin:17-jre_ for example).

### Available OpenJDK Docker images

Not all versions or alternatives (jdk, jre, slim, etc.) are available.

See which ones there : [Update to version X on base os Y](https://github.com/docker-library/openjdk/issues/272).

At the moment, OpenJDK 17, 21, 25 Docker images are based on the versions published here : https://adoptium.net/temurin/releases/ .
