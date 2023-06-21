FROM golang:1.20-alpine as go

WORKDIR /go/src/app

COPY . .

RUN go build -v -o /app main.go

FROM scratch

COPY --from=go /app /app

CMD ["/app"]

