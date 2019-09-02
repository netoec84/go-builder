FROM golang:1.12.9-alpine3.10 as builder
RUN apk update && \
  apk add git && \
  apk add gcc && \
  apk add g++ && \
  apk add libc-dev

ENV GO111MODULE=on

WORKDIR /src
