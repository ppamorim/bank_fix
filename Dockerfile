FROM ubuntu:18.04

WORKDIR /app

RUN apt-get -qq update && \
    apt-get install -y apktool && \
    apt-get install -y zipalign

COPY . .

RUN ./fix.sh app

RUN ls