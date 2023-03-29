FROM alpine:3.15.3

LABEL maintainer="yaozheng.wyz"
LABEL email="wyaozheng@gmail.com"
LABEL version="v1.0.0"

COPY bin/chat-server /chat-server/
COPY config.yaml /chat-server/
WORKDIR /chat-server
CMD ./chat-server