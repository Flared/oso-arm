FROM --platform=linux/arm64 python:3.9-buster

RUN apt update \
    && apt install -y \
           curl \
           jq

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
