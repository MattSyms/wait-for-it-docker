FROM alpine

RUN apk update && \
    apk add bash && \
    wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /usr/local/bin/wait-for-it && \
    chmod +x /usr/local/bin/wait-for-it && \
    ln -s /usr/local/bin/wait-for-it /usr/local/bin/w

ENTRYPOINT ["wait-for-it"]
