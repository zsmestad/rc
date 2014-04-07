My RC Files
===========

Zsh
---

Get git-prompt (https):

    git clone https://github.com/olivierverdier/zsh-git-prompt.git zsh/git-prompt

Vim
---

Included [Puppet Vim module][1] from [Puppetlabs][2]

Get vundle (https):

   git clone https://github.com/gmarik/vundle.git vim/bundle/vundle


Git
---

Here is a usable .gitconfig. See global ignore in repo.

```gitconfig
[user]
  name = <user>
  email = <email>
[core]
  excludesfile = ~/.gitignore_global
[diff]
  tool = vimdiff
[merge]
  tool = vimdiff
[push]
  default = matching
[gitreview]
  username = <gerrit username>
[alias]
  lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit
```

[1]: https://github.com/puppetlabs/puppet/tree/master/ext/vim/
[2]: https://github.com/puppetlabs/
