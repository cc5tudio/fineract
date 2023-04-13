destroy-db:
	docker rm -f mariadb-10.9

create-db:
	docker run --name mariadb-10.9 -p 3306:3306 -e MARIADB_ROOT_PASSWORD=mysql -d mariadb:10.9

run:
	./gradlew createDB -PdbName=fineract_tenants
	./gradlew createDB -PdbName=fineract_default
	./fineract/gradlew bootRun

build-jar:
	./gradlew clean bootJar

download-jdbc:
	wget https://downloads.mariadb.com/Connectors/java/connector-java-2.7.5/mariadb-java-client-2.7.5.jar

run-all:
	./gradlew :fineract-provider:jibDockerBuild -x test
	docker-compose -f docker-compose.yml -f docker-compose-community-app.yml up -d

stop:
	docker-compose down

