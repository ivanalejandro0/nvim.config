#!/usr/bin/env sh

# from: https://github.com/racer-rust/racer
set -x
rustup toolchain add nightly
cargo +nightly install racer
rustup component add rust-src
