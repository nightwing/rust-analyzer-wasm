# <meta http-equiv="Content-Security-Policy" content="default-src 'self'">

# prepare
which cargo || curl https://sh.rustup.rs -sSf | sh
rustup set profile minimal
rustup toolchain install nightly-2021-11-02 --component rustfmt --component rust-src
rustup override set nightly-2021-11-02
rustup target add --toolchain nightly-2021-11-02 wasm32-unknown-unknown

which wasm-pack || curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh


cd rust-pack
cargo run
cd ../ra-wasm
wasm-pack build --target web --profiling
cd ../www
yarn
yarn start