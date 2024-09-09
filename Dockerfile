FROM golang:1.21.4

WORKDIR /app

COPY . .

RUN go mod tidy

RUN git tag v1.0.1

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main main.go parcel.go

CMD ["/main"]
