# dockerairupnp

AirUpnp in Docker

## Usage

## Usage

```bash
# with default arguments
docker run -d --net host --name airupnp seancheung/airupnp
# with custom arguments
docker run -d --net host --name airupnp -v /path/to/config.xml:/etc/config.xml seancheung/airupnp -l 1000:2000 -Z -x /etc/config.xml
```

Check [AirConnect](https://github.com/philippe44/AirConnect) for all available arguments.

## Tags

| tag    | description    |
| ------ | -------------- |
| latest | latest version |
| x.y.z  | vx.y.z         |

## Custom build Args

| Name    | description        |
| ------- | ------------------ |
| VERSION | AirConnect version |

Available platforms: linux/amd64,linux/arm64,linux/arm/v7
