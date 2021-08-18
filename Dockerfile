FROM golang as builder


WORKDIR /go/src

COPY go.mod .
COPY *.go .

RUN go build -o hello


FROM scratch
WORKDIR /app
COPY --from=builder /go/src/hello .

CMD [ "/app/hello" ]