FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -O Xray-linux-64.zip  https://github.com/XTLS/Xray-core/releases/download/v1.5.4/Xray-linux-64.zip  && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*

ADD kaishi.sh /kaishi.sh
RUN chmod +x /kaishi.sh

CMD /kaishi.sh
