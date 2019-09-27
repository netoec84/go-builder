FROM alpine as consulbuilder
RUN apk add --no-cache curl && \
    curl https://releases.hashicorp.com/envconsul/0.8.0/envconsul_0.8.0_linux_amd64.zip -O && \
    unzip envconsul_0.8.0_linux_amd64.zip -d /bin && \
    rm envconsul_0.8.0_linux_amd64.zip

FROM golang:1.12.9-alpine3.10 as builder
COPY --from=consulbuilder /bin/envconsul /bin/envconsul
RUN apk update && \
  apk add git && \
  apk add gcc && \
  apk add g++ && \
  apk add libc-dev

ENV GO111MODULE=on

WORKDIR /src