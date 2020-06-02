FROM ubuntu:20.04

WORKDIR /app

RUN apt update -qq && \
    apt install -y \
    openjdk-11-jdk-headless \
    apktool \
    zipalign

COPY *.sh ./

ENTRYPOINT ["./fix.sh"]
