FROM ubuntu:latest

MAINTAINER nobody@a.de
LABEL description="github actions test"

RUN apt update && apt install -y \
    sqlite3

RUN cat createdb.sql *.txt | sqlite3 testdb.db

