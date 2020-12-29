.EXPORT_ALL_VARIABLES:

SHELL=/bin/bash -o pipefail

create-buildpacks:
	@cd server && pack package-buildpack jkutner/minecraft-server:latest
	@pack package-buildpack -c package.toml jkutner/minecraft:latest

create: create-buildpacks
	@pack create-builder jkutner/minecraft-builder:18 -c builder.toml --pull-policy never

publish:
	@docker push jkutner/minecraft:latest
	@docker push jkutner/minecraft-builder:18
