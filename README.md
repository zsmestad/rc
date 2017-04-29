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

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

[0]: https://github.com/olivierverdier/zsh-git-prompt
[1]: https://github.com/junegunn/vim-plug
