FROM alpine:latest
RUN apk add --no-cache curl
RUN mkdir /app
COPY config.txt /app/config.txt
