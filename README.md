## Macos 

## install

```bash
# zim plugin management
brew install --formula zimfw

brew install neovim lazygit fzf fastfetch  htop

```

## list

>  neovim fastfetch fzf eza lazygit htop 

## Arch linux setup

```bash

# base packages
sudo pacman base-devel git fzf neovim openssh eza fastfetch htop lazygit ripgrep starship tree wget zoxide zip unzip 

# yazi 
sudo pacman -S yazi ffmpeg p7zip jq poppler fd ripgrep fzf zoxide imagemagick

# yay 
export GOPROXY=https://goproxy.io,direct

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# firacode nerdfont
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip
sudo cp -r FiraCode  /usr/share/fonts
sudo fc-cache -f -v


# Emoji
yay -S ttf-linux-libertine ttf-inconsolata ttf-joypixels ttf-twemoji-color noto-fonts-emoji ttf-liberation ttf-droid
# Chinese
yay -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei adobe-source-han-mono-cn-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts

```


## Macos setup 

```bash

# yazi
brew install yazi ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font

```

