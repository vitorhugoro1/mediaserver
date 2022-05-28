
update: update-images recreate

update-images:
	docker compose pull

recreate:
	docker compose up -d --force-recreate --build