FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CARGO_HOME=/root/.cargo
ENV RUSTUP_HOME=/root/.rustup
ENV PATH=/root/.cargo/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        curl \
        ca-certificates \
        pkg-config \
        openssh-server \
        sudo \
        gdb \
        clang \
        libclang-dev \
        libacl1-dev \
        libcap-dev \
        libb64-dev \
        bison \
        python3 \
        python3-dev \
        python3-pip \
        python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --default-toolchain stable --profile minimal \
    && rustup component add rustfmt clippy \
    && ln -s /root/.cargo/bin/cargo    /usr/local/bin/cargo \
    && ln -s /root/.cargo/bin/rustc    /usr/local/bin/rustc \
    && ln -s /root/.cargo/bin/rustup   /usr/local/bin/rustup \
    && ln -s /root/.cargo/bin/rustfmt  /usr/local/bin/rustfmt \
    && ln -s /root/.cargo/bin/cargo-clippy /usr/local/bin/cargo-clippy \
    && ln -s /root/.cargo/bin/clippy-driver /usr/local/bin/clippy-driver

RUN mkdir -p /var/run/sshd /root/.ssh \
    && chmod 700 /root/.ssh \
    && sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config \
    && sed -i 's/^#\?StrictModes.*/StrictModes no/' /etc/ssh/sshd_config \
    && grep -q '^StrictModes' /etc/ssh/sshd_config || echo 'StrictModes no' >> /etc/ssh/sshd_config

WORKDIR /workspace
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]
