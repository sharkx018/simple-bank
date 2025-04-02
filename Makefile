postgres:
	docker run --name postgres17 -e POSTGRES_PASSWORD=root123 -d -p 5432:5432 postgres:17-alpine

createdb:
	docker exec -it postgres17 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres17 dropdb simple_bank --username=postgres

migrateup:
	migrate -path db/migration -database "postgresql://postgres:root123@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:root123@localhost:5432/simple_bank?sslmode=disable"  -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc