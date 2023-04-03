FROM ubuntu:focal AS builder

SHELL ["/bin/bash", "-c"]
WORKDIR /home
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y gcc g++ m4 perl python3 python3-dev bash \
    make mawk git pkg-config cmake wget llvm-12-dev llvm-12 llvm-12-tools clang-12 \
    libclang-12-dev libclang-cpp12-dev libedit-dev && apt clean

# Chapel
FROM builder AS chapel
SHELL ["/bin/bash", "-c"]
WORKDIR /home/
RUN wget https://github.com/chapel-lang/chapel/releases/download/1.30.0/chapel-1.30.0.tar.gz && \
    tar -xzf chapel-1.30.0.tar.gz && rm chapel-1.30.0.tar.gz
WORKDIR /home/chapel-1.30.0
RUN source util/quickstart/setchplenv.bash && ./configure --chpl-home=/home/chapel-1.30.0/bin/chapel && \
    make -j20 && source util/quickstart/setchplenv.bash && make install -j20