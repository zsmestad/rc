My RC Files
===========

```bash
git clone --recursive https://github.com/zsmestad/rc
```

Zsh
---

[Git-prompt][0] is now included as a submodule under a different directory to avoid conflicts.

Neovim
---

Included [Plug.vim][1] in repo, which seems to work best. I'm mainly using Neovim over Vim now, so most updates will be to `init.vim`.

rbenv
---

Mac:

```
brew install rbenv ruby-build
```

Linux:

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

pyenv
---

Mac:

```
brew install pyenv
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install $version
```

Linux:

```
git clone https://github.com/pyenv/pyenv ~/.pyenv
dnf/apt/brew install bzip2-devel sqlite-devel # Probably more
pyenv install --list
pyenv install 3.x && pyenv install 2.x
pyenv global 3.x 2.x # Dunno if I need 2.x anymore
pip3 install beets discogs_client requests pylast pyacoustid youtube-dl
```

[0]: https://github.com/olivierverdier/zsh-git-prompt
[1]: https://github.com/junegunn/vim-plug
