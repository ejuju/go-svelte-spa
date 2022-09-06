FROM golang:1.19 as build-go-server
WORKDIR /usr/local/go/app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
ARG CGO_ENABLED=0
RUN go build -ldflags "-s -w" -o ./main .

FROM node:18.5.0 AS build-website
WORKDIR /src
COPY website .
RUN npm install
RUN npm run build

FROM gcr.io/distroless/static
WORKDIR /app
CMD ["mkdir", "website/dist"]
COPY --from=build-website /src/dist/ ./website/dist
COPY --from=build-go-server /usr/local/go/app/main ./
ENTRYPOINT [ "/app/main" ]