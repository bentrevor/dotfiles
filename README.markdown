The `install.sh` script will create symlinks to the dotfiles in the
repo.  It expects the repo to be cloned to `~/.dotfiles`.  If the file
already exists, it creates a backup with a timestamp.

The default number of cores to use with bundler is 1, but the ideal
number is [1 fewer than the number of cores on the machine](http://archlever.blogspot.com/2013/09/lies-damned-lies-and-truths-backed-by.html).
This can be changed by passing in a `--bundler-jobs <n>` option.

This doesn't include my [zsh](https://github.com/bentrevor/zshfiles), [vim](https://github.com/bentrevor/vimfiles), or [emacs](https://github.com/bentrevor/.emacs.d) dotfiles.
