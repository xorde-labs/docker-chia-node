# Containerized Chia Node

Features:
- Fork of official Chia node
- Includes madMAx plotter
- Includes official chia PoS plot validator

## Usage

### Pulling the image

```shell
docker pull ghcr.io/xorde-nodes/chia-node:latest
```

### Running

#### Quick start simple setup

```shell
docker run -d --name chia-node \
	ghcr.io/xorde-nodes/chia-node:latest
```

#### Node with external plots

Please replace `/slow-disk/chia-plots` with some path on a host server where you plan to keep chia plots

```shell
docker run -d --name chia-node \
    -v /{slow-disk}/chia-plots:/plots \
	ghcr.io/xorde-nodes/chia-node:latest
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
	ghcr.io/xorde-nodes/chia-node:latest
```

3. Run chia plot:

Minimal run:

```shell
docker exec -it chia-node chia_plot \
  -n <plot-count> \
  -t /tmp/plots/ \
  -2 /tmp/ram-disk \
  -d /plots/ \
  -c <pool-contract-address> \
  -f <farmer-public-key> 
```

- Plot count: use `-1` for plotting indefinitely, plot size is roughly 100Gb, so you can calculate how many plots your storage can handle.
- Pool contract address can be found with `chia plotnft show` in "Pool contract address" value
- Farmer public key can be found with `chia keys show` in "Farmer public key" value

More info: https://github.com/madMAx43v3r/chia-plotter

### Using Chia plot verifier

```shell
### TODO
```

More info: https://github.com/Chia-Network/chiapos

### Troubleshooting

TODO
