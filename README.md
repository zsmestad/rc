My RC Files
===========

Vim
---

[Puppet Vim module][1] from [Puppetlabs][2]

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
```

[1]: https://github.com/puppetlabs/puppet/tree/master/ext/vim/
[2]: https://github.com/puppetlabs/
