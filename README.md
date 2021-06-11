# My RC Files

```bash
git clone --recursive https://github.com/zsmestad/rc
```

## Neovim

Included [Plug.vim][0] in repo, which seems to work best. I'm mainly using Neovim over Vim now, so most updates will be to `init.vim`.

## rbenv

### Mac

```
brew install rbenv ruby-build
```

### Linux

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## pyenv

### Mac

```bash
brew install pyenv openssl readline sqlite3 xz zlib
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install $version
```

### Linux

```bash
# Ubuntu
sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

git clone https://github.com/pyenv/pyenv ~/.pyenv
pyenv install --list
pyenv install 3.x
pyenv global 3.x
pip3 install beets discogs_client requests pylast pyacoustid youtube-dl
```

[0]: https://github.com/junegunn/vim-plug
