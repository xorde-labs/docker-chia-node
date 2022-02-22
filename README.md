# Containerized Chia Node

Features:
- Fork of official Chia node
- Includes madMAx plotter
- Includes official chia PoS plot validator

## Usage

### Pulling the image

```shell
docker pull ghcr.io/xorde-nodes/chia-node:main
```

### Running

#### Quick start simple setup

```shell
docker run -d --name chia-node \
	ghcr.io/xorde-nodes/chia-node:main
```

#### Node with external plots

Please replace `/slow-disk/chia-plots` with some path on a host server where you plan to keep chia plots

```shell
docker run -d --name chia-node \
    -v /{slow-disk}/chia-plots:/plots \
	ghcr.io/xorde-nodes/chia-node:main
```

#### Using madMAx plotter

1. Create RAM disk:

Please note that you will need to re-create it after each reboot.

```shell
mkdir -p /tmp/ram-disk
sudo mount -t tmpfs -o size=110G tmpfs /tmp/ram-disk/
```

2. Run chia-node docker container:

```shell
docker run -d --name chia-node \
    -v /{slow-disk}/chia-node/plots:/plots \
    -v /{fast-dist}/chia-node:/tmp/plots \
    -v /tmp/ram-disk:/tmp/ram-disk \
    -v chia-node-mainnet:/root/.chia/mainnet/ \
	ghcr.io/xorde-nodes/chia-node:main
```

3. Run chia plot:

```shell
docker exec -it chia-node chia_plot -n <plot-count> -r <thread-count> -t <tmpdir-1> -2 <tmpdir-2> -d <final-dir> -c <p2-singleton-address> -f <farmer-public-key> 
```

More info: https://github.com/madMAx43v3r/chia-plotter

### Using Chia plot verifier

```shell
### TODO
```

More info: https://github.com/Chia-Network/chiapos

### Troubleshooting

TODO
