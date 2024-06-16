FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o siemgo

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/siemgo .

CMD ["./siemgo"]
