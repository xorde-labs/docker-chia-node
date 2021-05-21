# Containerized Chia Node

Based on pure latest Alpine

## Usage

### Buidling

```shell
git clone https://github.com/xorde-nodes/chia-node.git
cd chia-node
sh make.sh
```

### Running

#### Quick start simple setup

```shell
docker run -d --name chia-node \
	xorde/chia-node:latest
```

#### Node with external plots

Please replace `/slow-disk/chia-plots` with some path on a host server where you plan to keep chia plots

```shell
docker run -d --name chia-node \
    -v /slow-disk/chia-plots:/plots \
	xorde/chia-node:latest
```

### Troubleshooting

#### Determine Chia node version

```shell
docker run --rm -t xorde/chia-node version
```

#### Get build information

```shell
docker run --rm -t xorde/chia-node build_info
```

#### Launch emergency shell

```shell
docker run -it --entrypoint /bin/sh xorde/chia-node
```

## Credits

Scripted and tested by Xander Tovski

Donations are welcome to:

Chia XCH: xch1eaulr64t7skcy6s44tn66pr3v7uqtql79tk0hrxh5wwypgfc9j4sv4q4wz
