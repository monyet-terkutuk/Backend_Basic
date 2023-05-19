docker pull postgres:15-alpine

docker run --name postgres15 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres:15-alpine

docker exec -it postgres15 psql -U root
# kode di atas mencoba mengakses perintah sql klo di mysql (mysql -u root)

select now();

\q
# digunakan untuk keluar dari exec (gantinya exit)

docker logs postgres15

migrate create -ext sql -dir database/migrations -seq init_schema

migrate -path database/migrations -database "postgresql://root:root@localhost:5432/simple_bank?sslmode=disable" -verbose up