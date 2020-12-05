# Minecraft Buildpack

This is a [Cloud Native Buildpack](https://buildpacks.io) for Minecraft. It produces a Docker image you can use to run a Minecraft server.

![Logo](./assets/logo_small.png)

Do not confuse it with the [Heroku Minecraft Buildpack](https://github.com/jkutner/heroku-buildpack-minecraft/), which uses an older Buildpack API.

## Usage

Install the [Pack CLI](https://buildpacks.io/docs/tools/pack/)

```
$ git clone
$ cd minecraft-buildpack
$ pack build mcapp --builder jkutner/minecraft-builder:18
```

Create a [free ngrok account](https://ngrok.com/) and copy your Auth token.

Then run the server with a command like:

```
$ docker run -e NGROK_API_TOKEN="<token>" -p 8080:8080 -it mcapp
```

Open a browser to `http://localhost:8080`, which will display the address of the server (really it's a proxy, but whatever):

```
Server available at: 0.tcp.ngrok.io:17003
```

Copy the `0.tcp.ngrok.io:17003` part. Then open Minecraft, and select "Multiplayer" and "Direct Connection". Paste the address as the "Server Address" and click "Join Server".

## Customizing

You can change your server properties by adding [standard Minecraft configuration files](https://minecraft.gamepedia.com/Server.properties) to the repo. For example, you can change operator privileges by creating an `ops.json` like this:

```json
[
  {
    "uuid": "1234567-1234-abab-1c1c-2i13uhiifwu",
    "name": "username",
    "level": 4
  }
]
```

Or you can can allow certain users by creating a `whitelist.json` like this:

```json
[
  {
    "uuid": "1234567-1234-abab-1c1c-2i13uhiifwu",
    "name": "username"
  }
]
```

Or you can customize the gameplay by creating a [`server.properties`](https://minecraft.gamepedia.com/Server.properties) like this:

```
gamemode=1
difficulty=1
pvp=false
```

## License

MIT