# Build Stage
FROM rust:1.76 AS builder
WORKDIR /usr/src/

#create new temporary project to install deps
RUN USER=root cargo new studyscraper --bin
WORKDIR /usr/src/studyscraper
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY . .
RUN cargo install --path .
CMD ["studyscraper"]

