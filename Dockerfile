FROM alpine:latest

RUN set -x && \
    apk --no-cache add curl tzdata && \
    mkdir -p /cron/log

ADD start.sh /
ADD cron /cron
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
