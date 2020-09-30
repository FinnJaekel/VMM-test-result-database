FROM ubuntu:latest

MAINTAINER nobody@a.de
LABEL description="github actions test"

RUN apt update && apt install -y \
    sqlite3 

ADD run_action.sh /run_action.sh
ENTRYPOINT ["/bin/bash", "-x"]
CMD ["/run_action.sh"]
