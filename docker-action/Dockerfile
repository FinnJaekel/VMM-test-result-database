FROM ubuntu:latest

MAINTAINER nobody@a.de
LABEL description="github actions test"

RUN apt update && apt install -y \
    sqlite3 

RUN cd ..

RUN cat createdb.sql *.txt | sqlite3 testdb.db

RUN git add testdb.db && git commit -m "new DB" && git push 

ADD run_action.sh /run_action.sh
ENTRYPOINT ["/bin/bash", "-x"]
CMD ["/run_action.sh"]
