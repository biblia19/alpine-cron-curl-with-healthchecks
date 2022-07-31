FROM alpine:latest

RUN set -x && \
    apk --no-cache add curl tzdata && \
        mkdir -p /cron/log

ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
CMD [""]
