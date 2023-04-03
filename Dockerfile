FROM nginx:stable-alpine

RUN apk --no-cache add bash socat

ADD openai.conf /etc/nginx/conf.d/openai.conf

ADD 00-services.sh /docker-entrypoint.d/00-services.sh
RUN chmod +x /docker-entrypoint.d/00-services.sh

ENV PROXY_HOST=
ENV PROXY_PORT=
