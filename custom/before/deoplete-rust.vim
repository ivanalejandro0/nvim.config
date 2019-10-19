" NOTE: this plugin requires `racer`, check `./install-racer.sh`
" from: https://github.com/sebastianmarkow/deoplete-rust

" Using systemlist instead of system to trim \n
" see: https://vi.stackexchange.com/a/2874

let g:deoplete#sources#rust#racer_binary = systemlist("which racer")[0]
let g:deoplete#sources#rust#rust_source_path = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src/"
