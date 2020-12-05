.EXPORT_ALL_VARIABLES:

SHELL=/bin/bash -o pipefail

create-buildpack:
	@pack package-buildpack -c package.toml jkutner/minecraft-cnb:latest

create: create-buildpack
	@pack create-builder jkutner/minecraft-builder:18 -c builder.toml --pull-policy never

publish:
	@docker push jkutner/minecraft-cnb:latest
	@docker push jkutner/minecraft-builder:18