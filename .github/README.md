
# revanth94/dotfiles

This is where I keep all of my dotfiles

## Software I use
- Operating System: MacOs
- Terminal: iTerm2
- Shell: zsh
- Browser: Firefox

### Setup

This arrangement helps me manage my dotfiles without linking. 
Came across this method in this [video](https://youtu.be/LI_Tv5dJkkk)

Clone dotfiles
```
git clone --bare git@github.com:revanth94/dotfiles.git $HOME/.dotfiles
```

Set Up alias
```
alias df2="/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME
df2 config --local status.showUntrackedFiles no
```



#### Vim Setup
Install vim
```
brew install vim
```

.vimrc inspired from this [article](https://medium.com/@edominguez.se/vim-101-a-comprehensive-guide-to-using-vim-like-an-ide-1-3-vimrc-d484cc41fc2)



