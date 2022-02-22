# Containerized Chia Node

Features:
- Fork of official Chia node
- Includes madMAx plotter
- Includes official chia PoS plot validator

## Usage

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
    -v /slow-disk/chia-plots:/plots \
	ghcr.io/xorde-nodes/chia-node:latest
```

#### Using madMAx plotter

Enable RAM disk:

```shell
sudo mount -t tmpfs -o size=110G tmpfs /mnt/ram/
```

While having chia-node docker container running:

```shell
docker run --rm -t ghcr.io/xorde-nodes/chia-node chia_plot -n <plot-count> -r <thread-count> -t <tmpdir-1> -2 <tmpdir-2> -d <final-dir> -c <p2-singleton-address> -f <farmer-public-key> 
```

More info: https://github.com/madMAx43v3r/chia-plotter

### Using Chia plot verifier

```shell

```

More info: https://github.com/Chia-Network/chiapos

### Troubleshooting

TODO

## Credits

Scripted and tested by Xander Tovski

Donations are welcome to:

Chia XCH: xch1eaulr64t7skcy6s44tn66pr3v7uqtql79tk0hrxh5wwypgfc9j4sv4q4wz
