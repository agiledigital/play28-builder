#
# Play 2.8 Build Image
# Docker image with libraries and tools as required for building Play 2.8 rojects using SBT 
#

FROM openjdk:11.0.11-jdk-buster

LABEL Description="Docker image with libraries and tools as required for building Play 2.8 projects using SBT " Vendor="Agile Digital" Version="0.1"

RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list \
    && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list \
    && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add \
    && apt-get update \
    && apt-get -y install --no-install-recommends bash libsodium-dev curl sbt

ENV HOME /home/jenkins

RUN touch /.dockerenv 


WORKDIR /home/jenkins

USER root