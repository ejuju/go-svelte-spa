FROM golang:1.18.3 as build-server
WORKDIR /usr/local/go/app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY ./* ./
ARG CGO_ENABLED=0
RUN go build -ldflags "-s -w" -o ./main .

FROM node:18.5.0 AS build-website
WORKDIR /src
COPY website .
RUN npm install
RUN npm run build

FROM scratch
WORKDIR /app
COPY --from=build-website /website_static_build/ ./website_static_build/
COPY --from=build-server /usr/local/go/app/main ./
EXPOSE 8080
ENTRYPOINT [ "/app/main" ]