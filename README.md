# learn Vim

[introduction](#introduction)

[launch / exit Vim](#launch--exit-vim)

[modes](#modes)

[commands](#commands)

[.vimrc](#vimrc)

[resources](#resources)

[debugging](#debugging)

[C# .NET setup](#c-net-setup)

[node.js setup](#nodejs-setup)

#

### introduction

In this document, I'll share with you how I learned Vim, listing common commands and tips to help get you started.

Vim is a text editor that runs in a CLI. You can't use a mouse with Vim. All navigation and operations are performed with keyboard shortcuts. It's used by programmers because of how quickly practiced users can navigate files and because of how customizable it is. You should know the basics of using a command prompt before following this document.

(FYI, I use Neovim, but that shouldn't change any of the instructions/commands below.)

### launch / exit Vim
- type `vim` into your terminal of choice (or `nvim` in my case)
- to open a file type `vim [path to file]`
- to exit Vim, type `:q` and hit enter
- to save changes: `:w`
- if you want to save and quit: `:wq`
- if you want to discard changes: `:q!`

### modes

- normal: When you launch Vim, you'll be in normal mode, which is when you can use all the fancy key-bindings (keyboard shortcuts) that make Vim so special. You can tell you're in normal mode because the cursor will be fat.
- insert: To actually type text, hit `i` or `a` and then start typing. (As an exercise, try and figure out the difference between i and a.) Use escape to get back into normal mode.
- visual: Visual mode happens when you hit `v` in normal mode. You can use the arrow keys (or h, j, k, l) to select text. You'll need this for copying/pasting and bulk deleting, etc.
- command: When you hit `:` in normal mode you can type commands, like `w` to save or `q` to quit or `term` to open up a terminal window.

### commands

Now it's time to learn some handy commands that you can use in normal mode. Being good at these is what makes Vim folks so fast at writing code. These are basic commands, roughly in the order I learned them.

| learn these first   |                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------ |
| h, j, k, l          | move around in the file (right, down, up, left)                                      |
| i                   | enter insert mode                                                                    |
| esc                 | go back into normal mode                                                             |
| v                   | enter visual mode so you can select text                                             |
| shift-v             | select text line-by-line                                                             |
| u                   | undo                                                                                 |
| ctrl-r              | redo                                                                                 |
| y                   | copy                                                                                 |
| p, P                | paste below/above the current line                                                   |
| :w                  | save the current file                                                                |
| :q                  | close the current window                                                             |

| core commands       | description                                                                          |
| ------------------- | ------------------------------------------------------------------------------------ |
| i                   | enter insert mode                                                                    |
| I                   | enter insert mode at the beginning of the current line                               |
| a                   | enter insert mode after the cursor                                                   |
| A                   | enter insert mode at the end of the current line                                     |
| o, O                | open a new line below/above the current line and enter insert mode                   |
| esc                 | go back into normal mode                                                             |
| v                   | enter visual mode so you can select text                                             |
| shift-v             | select text line-by-line                                                             |
| u                   | undo                                                                                 |
| ctrl-r              | redo                                                                                 |
| x                   | delete the character under the cursor                                                |
| dd                  | delete current line                                                                  |
| dw                  | delete current word                                                                  |
| y                   | copy                                                                                 |
| yy                  | copy current line                                                                    |
| p, P                | paste below/above the current line                                                   |
| "\*y                | copy selected text to system clipboard (so you can paste outside of the terminal)    |
| "\*p                | paste from system clipboard                                                          |
| ggVG                | select all                                                                           |
| :w                  | save the current file                                                                |
| :q                  | close the current window                                                             |

| moving around       |                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------ |
| h, j, k, l          | move around in the file (right, down, up, left)                                      |
| {, }                | move up/down the file by paragraphs                                                  |
| 0, $                | move to the beginning/end of a line                                                  |
| gg, G               | move to top of file, bottom of file                                                  |
| *                   | jump to the next occurance of whatever is under the cursor                           |
| #                   | jump to the previous occurance of whatever is under the cursor                       |
| :/[search term]     | search file (you can use Regex)                                                      |
| n, N                | while searching, go to next/previous occurance                                       |

| window stuff        |                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------ |
| zz                  | center the screen around the current line                                            |
| crtl-ww             | switch windows (for when you have multiple panels open)                              |
| gt, gT              | switch tabs (forward/back)                                                           |
| :term               | open a terminal window (replaces current window)                                     |
| :vsplit term://zsh  | open a (in my case) zsh terminal to the right of the current window                  |
| :tabnew term://zsh  | open a (in my case) zsh terminal in a new tab                                        |
| :noh                | "no highlight", clears highlighting on search results                                |

| my-config specific  |                                                                                      |
| ------------------- | ------------------------------------------------------------------------------------ |
| ctrl-x              | open up NERDTree                                                                     |
| ctrl-y              | select an intellisense option from the list                                          |
| cmd-/               | comment/uncomment selected code                                                      |
| Zl                  | correct the spelling of the word under the cursor                                    |
| ZL                  | display a list of spelling suggestions for the word under the cursor                 |
| \fp                 | find files in specified path                                                         |
| \ff                 | find files in `cwd`                                                                  |
| \fb                 | open file browser                                                                    |
| s                   | open up file in vertical split mode with NERDTree                                    |
| t                   | open up file in a new tab with NERDTree                                              |

See this [Vim cheat sheet](https://vim.rtorr.com/) for more.

### .vimrc

The weirdest thing about Vim for most people is that it runs in a terminal. It's boring and ugly! That's why people customize the heck out of their Vim windows. My setup literally looks like my VSCode window, except that it's faster to launch and faster to code in. You customize Vim by editing the .vimrc file that lives in your home directory. If it's not there, simply create a file with the name .vimrc. I'll include [my config file](https://github.com/ruthrootz/learn-vim/blob/main/init.vim) in this repo so you can get a taste. (For Neovim the config file is called `init.vim` and lives in `~/.config/nvim/`.) Having this config file makes it incredibly easy to set up your environment on a different computer.

`Plug` is a plugin manager, so that's the first thing I installed, then I used plug to install a bunch of plugins, and the last section of the file is where I set various settings, some that are built into Vim and some that are for the plugins. There are also a few custom keybindings in there. Run :PlugInstall to install the plugins.

Advice for MacOS users: To get [NERDTree](https://github.com/preservim/nerdtree) to work with the [devicons](https://github.com/ryanoasis/vim-devicons) plugin, I had to install a ["nerd font"](https://www.nerdfonts.com/) onto my computer. For MacOS all you have to do is download the nerd font of your choice, install it (which will add it to Font Book) and then make sure your terminal app uses that font for non-unicode characters. (You can't use MacOS's default Terminal app if you want cool colors, fyi, since Terminal doesn't allow more than a handful of different colors. I use iTerm2.)

One extra thing I did: I remapped my caps lock key to be my escape key so it's easier/faster to exit insert/visual mode.

#

### resources

Fantastic [video series by ThePrimeagen](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) for learning Vim movements, going from beginner to expert.

For more info on customizing, see [this article](https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd). It's the one I followed to get Vim to look like this:

#

![my Neovim setup](screenshot.png)

#

### debugging

I'm using [vimspector](https://github.com/puremourning/vimspector) for debugging. I'm still getting things set up by following [this doc](https://puremourning.github.io/vimspector-web/)...

After installing the plugin, I got an error that went something like, `Vimspector Unavailable: requires Vim compiled with python (3.6.0+) support.` To solve this issue, I had to install python3 on my machine and then install [this Python package](https://pypi.org/project/neovim/) as specified in [this doc](https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#a-brief-overview-of-neovim--python).

#

### C# .NET setup
.....

### node.js setup
.....
