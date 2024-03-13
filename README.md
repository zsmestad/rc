# My RC Files

```bash
git clone --recursive https://github.com/zsmestad/rc .rc
./.rc/install
```

## CLI Tools

[Homebrew](https://brew.sh/)
[Rust](https://www.rust-lang.org/tools/install)

### Initial Installs

- `brew install fish tmux git neovim`

Start a new shell session after each

- `cargo install sccache`
- `cargo install mise starship`
- `mise install -g bun@1.0 fzf python@3.12 ruby@3.2 usage`

### Essentials

- `brew install cmake coreutils curl dylibbundler gnutls gpg2 htop jq lua-language-server meson pkg-config pkgconf restic rsync shellcheck shfmt socat tree watch`
- `cargo install bat cargo-update diffr du-dust fd-find inlyne just pueue rink ripgrep sd treefmt watchexec-cli xh zoxide`
- `bun install -g bash-language-server prettier yaml-language-server`
- `pip install ruff-lsp`

### Nice

- `cargo install czkawka_cli czkawka_gui gitoxide lipsum-cli`

### Non-work

- `brew install aria2 atomicparsley calibre chromaprint ffmpeg libav mediainfo mpv musicbrainz-picard mutagen opus opus-tools mkvtoolnix`
- `pip install yt-dlp beets[chroma,fetchart,lyrics]`

### May actually use some day

- `cargo install hurl jless rustic-rs zellij`
