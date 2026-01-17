# Neovim Setup Tutorial

This tutorial is aimed to make it work through all my devices (such as my laptop or fresh re-install). I'll divide it in 2 different parts, in order to not make my system broke. This setup heavily relies on [LazyVim](https://www.lazyvim.org/installation) setup.

Currently, it worked on:
* Pop_OS! 22.04

## Dependencies 

### Dependencies more independent of nvim

Install xclip to enable clipboard synced w/ yank
```
$ sudo apt install xclip
```

Creates alacritty directory and setup for themes and download from [here](https://github.com/Rildian/dotfiles)
```
$ mv <where this file was downloaded> ~/.config/
```

Download [Nerd Font](https://www.nerdfonts.com/font-downloads) (i've chosen the 0xProto Nerd Font)

Install node and npm (unfortunately) by using nvm
```
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash # node version manager
```

Given the nvm installed, now install node and npm
```
$ nvm install 20
$ nvm use 20
```

### Plugins

I've installed:
* [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) depends on: [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) and the nerd font above.
* [Telescope](https://github.com/nvim-telescope/telescope.nvim) depends on: ripgrep (sudo apt) and [plenary](https://github.com/nvim-lua/plenary.nvim) 

## Part 1

Set the `options.lua` as the same as this repo.

Set the `globals.lua` as the same as this repo.

Set the `init.lua` as the same as this repo.

Set the `autocmds.lua` as the same as this repo.

After installing the Nerd Font:
```
$ nvim ~/.config/alacritty/alacritty.toml 
```
And paste as the same as this repo.

Then, install the nvim-tree + nvim-web-devicons and telescope.

## Part 2

In this section, we're going to download the formatter and LSP.

Open your nvim and type:
```:LazyExtras```, search for the languages you want, press "x" to enable those you want, then quit.

Open nvim again and type:
```:Mason``` 

You'll open a screen w/ different categories: the LSP, DAP (Debuggers), Linters and Formatters. For each category to those languages: Python, C#, Bash, Java, C/C++ and Cmake, I recommend:

**LSP**:
* omnisharp -> C#
* bash language server -> bash
* clangd -> C/C++
* pyright -> python
* dockerls -> Docker
* jdtls -> Java
* neocmakelsp -> Cmake

**DAP**:
* debugpy -> Python
* netcoredbg -> C#
* codelldb -> C/C++
* java-debug-adapter -> Java
* bash-debug-adapter -> Bash

**Linter**:
* ruff -> Python
* shellcheck -> Bash
* hadolint -> Docker
* cpplint -> C/C++
* checkstyle -> Java

**Formatters**:
* black (or isort for imports) -> Python
* csharpier -> C#
* clang-format -> C/C++
* google-java-format -> Java
* shfmt -> Bash
* prettier (via prettier package) -> Docker
* gersemi (or cmakelang) -> CMake
