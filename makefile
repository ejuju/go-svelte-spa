dev:
	make dev-website & make dev-backend

dev-backend:
	cd backend && CGO_ENABLED=0 go run .

dev-website:
	cd website && npm run dev

check-server:
	cd backend && \
	go mod tidy && \
	go mod verify ./... && \
	go vet ./... && \
	go test ./... -race -timeout=60s

check-website:
	cd website && npm run check

build:
	docker build . -f containerfile -t localhost/gosvelte --progress plain

run:
	docker run -p 8080:8080 localhost/gosvelte