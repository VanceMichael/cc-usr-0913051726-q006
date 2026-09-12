FROM golang:1.23 AS build
WORKDIR /src
COPY go.mod .
RUN go mod download
COPY . .
RUN go mod tidy && go test ./... && go build -o /bin/service .
FROM debian:bookworm-slim
COPY --from=build /bin/service /service
EXPOSE 8080
ENTRYPOINT ["/service"]
