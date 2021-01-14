FROM golang:1.15 AS builder

ENV CGO_ENABLED=0

COPY ./go.mod /go/src/github.com/hsmtkk/oauth2-proxy/go.mod
COPY ./go.sum /go/src/github.com/hsmtkk/oauth2-proxy/go.sum
COPY ./http.go /go/src/github.com/hsmtkk/oauth2-proxy/http.go

WORKDIR /go/src/github.com/hsmtkk/oauth2-proxy

RUN go build -o ./http.bin

FROM alpine:3.12.3

COPY --from=builder /go/src/github.com/hsmtkk/oauth2-proxy/http.bin /http.bin

ENTRYPOINT ["/http.bin"]
