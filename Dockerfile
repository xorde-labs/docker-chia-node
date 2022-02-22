FROM python:3.9 as builder_chiaplot
WORKDIR /tmp/builder

### Install build tools:
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y libsodium-dev cmake g++ git build-essential

### Build chiapos CLU:
RUN git clone https://github.com/Chia-Network/chiapos.git
RUN cd chiapos && mkdir build && cd build && cmake .. && make -j8 && pwd && ls -al .

### Build chia_plot CLU:
RUN git clone https://github.com/madMAx43v3r/chia-plotter.git
RUN cd chia-plotter && git submodule update --init && ./make_devel.sh && ./build/chia_plot --help && pwd && ls -al ./build

### Use official Chia image as base and copy there chia_plot and chiapos:
FROM ghcr.io/chia-network/chia:latest

### Copy chiapos binaries:
COPY --from=builder_chiaplot /tmp/builder/chiapos/build/ProofOfSpace /chia-blockchain/chiapos/
COPY --from=builder_chiaplot /tmp/builder/chiapos/build/RunTests /chia-blockchain/chiapos/
COPY --from=builder_chiaplot /tmp/builder/chiapos/build/chiapos.cpython-39-x86_64-linux-gnu.so /chia-blockchain/chiapos/

### Copy chia_plot binaries:
COPY --from=builder_chiaplot /tmp/builder/chia-plotter/build/chia_plot /usr/bin/
COPY --from=builder_chiaplot /tmp/builder/chia-plotter/build/chia_plot_k34 /usr/bin/
