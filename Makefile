DOCKER-RUN = docker compose run -e TERM --rm --entrypoint=""
BUNDLE-EXEC = bundle exec

DATABASE_URL         = postgresql://postgres:dummy@db:5434
ESPACE_MEMBRE_DB_URL = postgresql://postgres:dummy@espace-membre-db:5433

.PHONY: db

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

die:
	docker compose down --remove-orphans --volumes

sh:
	$(DOCKER-RUN) web bash

cl:
	$(DOCKER-RUN) web bin/rails c

# runs a PSQL console to explore the DB
db:
	$(DOCKER-RUN) -e PAGER= db psql $(DATABASE_URL)

# runs a PSQL console to explore the EMDB
emdb:
	$(DOCKER-RUN) -e PAGER= db psql $(ESPACE_MEMBRE_DB_URL)

import-emdb-backup:
	$(SCALINGO_EMDB) --addon postgresql backups-download --output tmp/latest_backup.tar.gz
	$(DOCKER-RUN) -e EMDB_BACKUP_FILE=tmp/latest_backup.tar.gz web bash script/import_emdb_backup.sh
