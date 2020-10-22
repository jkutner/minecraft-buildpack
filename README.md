# Minecraft Buildpack

This is a [Cloud Native Buildpack](https://buildpacks.io) for Minecraft. It produces a Docker image you can use to run a Minecraft server.

Do not confuse it with the [Heroku Minecraft Buildpack](https://github.com/jkutner/heroku-buildpack-minecraft/), which uses an older Buildpack API.

## Usage

Install the [Pack CLI](https://buildpacks.io/docs/tools/pack/)

```
$ git clone
$ cd minecraft-buildpack
$ pack package-buildpack jkutner/minecraft -c package.toml
$ pack build mcapp --buildpack jkutner/minecraft
```

Create a [free ngrok account](https://ngrok.com/) and copy your Auth token.

Then run the server with a command like:

```
$ docker run -e NGROK_API_TOKEN="<token>" -p 8080:8080 -it mcapp minecraft
```

Open a browser to `http://localhost:8080`, which will display the address of the server (really it's a proxy, but whatever):

```
Server available at: 0.tcp.ngrok.io:17003
```