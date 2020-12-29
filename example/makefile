.EXPORT_ALL_VARIABLES:

SHELL=/bin/bash -o pipefail
minecraft_version=1.16.4
heroku_app=sushi
image_repo=registry.heroku.com/$(heroku_app)

build:
	@pack build $(image_repo)/web -e MINECRAFT_VERSION="$(minecraft_version)" -e MINECRAFT_DIST="spigot" --builder jkutner/minecraft-builder:18
	@docker build --build-arg app=$(heroku_app) -t $(image_repo)/bash .

release: build
	@docker push $(image_repo)/web
	@docker push $(image_repo)/bash
	@heroku container:release web bash -a $(heroku_app)

inspect:
	@docker inspect $(image_repo)/web

bash:
	@docker run -it $(image_repo)/bash

run:
	@docker run -it -e NGROK_API_TOKEN="$(NGROK_API_TOKEN)" -e JAVA_TOOL_OPTIONS="-Xmx2g" -p 8080:8080 $(image_repo)/web
