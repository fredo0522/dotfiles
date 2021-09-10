# System configurations
This configuration are set for my GNU/Linux operating systems, this is really intended for my own use. There is a [setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) script to configure the files, to see the options of the setup run `./setup.sh --help` (the setup don't install all dependencies need it).

## Features
* i3 gaps config.
    * Bettterlockscreen config file (alternative for i3lock).
    * Polybar config.
* Ranger configurations (terminal file manager).
* Zathura (PDF reader) config.
* Vim/Neovim config files.
* Tmux config.
* Latexmk compiler config.
* Dots on prompt (`● \u25CF`) for information of current version control folder (use `git remote update` for pull option information to appear).
* Rofi configurations.
* Files to ignore for [The silver searcher](https://github.com/ggreer/the_silver_searcher) command (`ag`). If it's is install, vim will used for searching files with fzf-vim.

## Google Drive
* For cloud storage I use [drive](https://github.com/odeke-em/drive) ([AUR repo](https://aur.archlinux.org/packages/drive-bin)).

### Bash
* Current version control branch name.
    * Red dot indicates unstaged changes.
    * Magenta dot indicates push to the current remote repo.
    * Yellow dot indicates pull to the current remote repo.

### Zsh
* Extended right-hand size prompt which auto-hides when necessary to make room for long commands and contains:
    * If you set vi keys on normal mode `<<<` will appear and in insert mode `•••`.
    * Duration of previous command in adaptive units (seconds, minutes, hours or days) depending on duration.
    * Current version control branch name.
        * Green dot indicates staged changes.
        * Red dot indicates unstaged changes.
        * Blue dot indicates untracked files.
        * Magenta dot indicates push to the current remote repo.
        * Yellow dot indicates pull to the current remote repo.

### Theme
* Current terminal: [Alacritty](https://github.com/alacritty/alacritty).
* Terminal theme: [base16_classic-dark](https://github.com/chriskempson/base16-shell).
* Terminal font: [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode).

### Select Theme
* On bash run `base16_` and then hit <kbd>Tab</kbd> to see all the themes available.

## Dependencies
* Fonts you have to download and copy the next fonts on `~/.local/share/fonts` and then `fc-cache -fv` to update your font cache:
    * [Iosevka](https://github.com/be5invis/Iosevka/tree/master) or installed with the [AUR repo](https://aur.archlinux.org/packages/ttf-iosevka/).
    * [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) ([setup.sh](https://github.com/fredo0522/Dotfiles/blob/master/setup.sh) installed by itself).
    * [Material Design Desktop](https://github.com/Templarian/MaterialDesign-Font).
* Zsh
    * [Oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* i3 gaps
    * [Rofi](https://github.com/davatorium/rofi).
    * [bitwarden-rofi](https://github.com/mattydebie/bitwarden-rofi).
    * [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen).
    * [polybar](https://github.com/polybar/polybar).
* Ranger
    * Atool (extract files with <kbd>Shift + x</kbd> on ranger).
* Tmux
    * Xclip `pacman -S xclip`(copy on clipboard from tmux paste mode).
* Latex (if you want the vimtex workflow to work)
    * `apt-get install texlive-full` for Debian-based distros.
    * `pacman -S texlive-most texlive-lang` for Arch-based distros.
    * Inkscape for making figures: `pacman -S inkscape`.
    * [inkscape-figures](https://github.com/gillescastel/inkscape-figures), it works on Vim with <kbd>Ctrl + f</kbd> keys.

# Inspired
* Wincent [dotfiles](https://github.com/wincent/wincent); Most of the technical things seen in this repository comes from his configuration.
* Gilles Castel's [blog](https://castel.dev/); Most of the latex configuration, from inkscape configuration to almost all of the snippets.
* The Alacritty theme and some of the Neovim configurations comes from [TheRealKizu](https://github.com/TheRealKizu/dotfiles) and [Neovim repo](https://github.com/TheRealKizu/neodots).
* Other Neovim lua configuration comes from [NvChad](https://github.com/NvChad/NvChad).

