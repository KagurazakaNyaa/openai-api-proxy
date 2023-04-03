FROM alpine/socat:latest

RUN apk --no-cache add stunnel bash

ADD openai.conf /etc/stunnel/openai.conf

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV PROXY_HOST=
ENV PROXY_PORT=

ENTRYPOINT [ "/docker-entrypoint.sh" ]