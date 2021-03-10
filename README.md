# Ruilisi dotfiles

## Get started
### Requirements
* `zsh`, `tmux`, `vim`, `ag` are installed and zsh is set as your login shell:
```sh
chsh -s $(which zsh)
```
* `Python 3` and `pynvim` as some layers(`denite`) can't be loaded if they are missing
```sh
python3 -m pip install --user --upgrade pynvim
```

### Install

```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/ruilisi/dotfiles/master/install.sh`"
```
Or
```sh
bash -c "`curl -fsSL https://git.ruilisi.com/ruilisi/dotfiles/raw/branch/master/install.sh`"
```

### Upgrade
```sh
cd ~/.yadr
git pull --rebase
rake update
```

## ZSH
- [Prezto - the zsh behind YADR's](http://github.com/sorin-ionescu/prezto)
- [How to add your own ZSH theme](doc/zsh/themes.md)
### Shortcuts

Shortcut    | Alias
:-----------|:--------
Ctrl-R      | Vim mode and bash style historical anti-query
ae          | Edit alias
ar          | Reload alias
ESC C-x C-e |Edit current command line in vim

### Commands
- `Replace`
  - `Replace s SOURCE_TEXT -d DESTINATION_TEXT -f FILE_REGEX_PATTERH --separator=SEPERATOR`
  - By default, `FILE_REGEX_PATTERN` is `.*`, SEPERATOR` is `;`
  - Example: `Replace -s "/api/rule" -d "/dashboard/api/rule" -f ".*.ts"`
- `secure_source` -source `~/.yadr/zsh/function.zsh` file, let `function.zsh` modify work immediately in current window
- `pp $1` -useage:`pp xx`, grep process by name
- `set_proxy` -set terminal proxy use http proxy
- `set_vagrant_proxy` -set terminal proxy use vagrant http proxy
- `set_ss_proxy` -set terminal proxy use socks proxy
- `unset_proxy` -cancel all proxy
- `post $1 $2` -curl POST with application/json
- `git-set-remote $1` -set project git remote url
- `gem_source_to_taobao` -set ruby gem source to taobao
- `docker_rm_all` -delete all docker images
- `Replace $1 $2` -replcae all text under current path
- `swap $1 $2` -`swap file1 file2`
- `init_db` -init rails project database
- `kexec` -execute k8s pod by regex pod name
- `klog` -show k8s pod log by regex pod name
- `git_tag_delete` -delete gtihub tag
- `git_tag_add` -add gtihub tag
- `dc` -alias of docker-compose

### [fasd](https://github.com/clvv/fasd)
The name fasd comes from the default suggested aliases f(files), a(files/directories), s(show/search/select), d(directories).

Some situations where you can type in the command on the left and fasd will "expand" your command into the right side.
```
  v def conf       =>     vim /some/awkward/path/to/type/default.conf
  j abc            =>     cd /hell/of/a/awkward/path/to/get/to/abcdef
  m movie          =>     mplayer /whatever/whatever/whatever/awesome_movie.mp4
  o eng paper      =>     xdg-open /you/dont/remember/where/english_paper.pdf
  vim `f rc lo`    =>     vim /etc/rc.local
  vim `f rc conf`  =>     vim /etc/rc.conf
```
Fasd comes with some useful aliases by default:

```sh
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
```
Fasd will smartly detect when to display a list of files or just the best
match. For instance, when you call fasd in a subshell with some search
parameters, fasd will only return the best match. This enables you to do:

```sh
mv update.html `d www`
cp `f mov` .
```

### Git customization:

YADR will take over your ~/.gitconfig, so if you want to store your git username and other settings, please put them in ~/.gitconfig.user

We recommend setting your user information in this file. In addition, you can set your environment variables appropriately in your ~/.secrets.

Shortcut | Alias
:--------|:--------
`ga`     |`git add`
`gb`     |`git branch`
`gbc` or `gnb`    |`git checkout -b`
`gbs`    |`git show-branch`
`gc`     |`git commit --verbose`
`gco`    |`git checkout`
`gcp`    |`git cherry-pick --ff`
`gd`     |`git diff`
`gf`     |`git fetch`
`gfc`    |`git clone`
`gfm`    |`git pull`
`gfr`    |`git pull --rebase`
`gl`     |`git log`
`gpc`    |`git push --set-upstream origin "$(git-branch-current 2> /dev/null)"`
`gr`     |`git rebase`
`gra`    |`git rebase --abort`
`grc`    |`git rebase --continue`
`grs`    |`git rebase --skip`
`gsd`    |`git stash drop`
`gsl`    |`git stash list`
`gsp`    |`git stash pop`
`gst`    |`git stash`

## Tmux
### Settings

`tmux.conf` provides some reasonable default settings for tmux on Mac OS, such as a powerful status bar and VIM keyboard bindings. You can modify the configuration in `~/.tmux.conf.user`.
### Shortcuts
Prefix is defined as `C-a`(`PRE` for short)
Shortcut  | Function
:---------|:--------
C-h(jkl)  |←(↓↑→)Move pane
PRE c     |Craete a new pane
PRE s     |Split panes up and down
PRE v     |Split panes left and right
PRE x     |Kill pane
PRE h(jkl)|←(↓↑→)Move dividing line
PRE ,     |Switch to Tmux command line mode
PRE d     |Exit Session
PRE D     |Exit Session
PRE 1     |Enter pane 1
> `C` is short for `Ctrl`

Press `PRE [` to enter Scroll Mode

Shortcut | Function |
:--------|:---------|
`Shift-V`| Select Text|
`Enter`  | Copy Text  |
`]`      | Paste text copied from scroll mode |


## Vim & Spacevim
* `<L>`: Short for `<localleader>`, which is `\` in our setup

**Defined by Us**

### Vim Basic
Refer [here](doc/vim-basic.md)

### General Shortcuts
Shortcut | Function
:-------:|:--------:
C-v      | Enter visual mode
C-x C-v  | Paste text from system clipboard
<L>tp    | Toggle paste
SPC f v d| Open configuration file
SPC g .  | Enter version control transient-state
SPC l p  | Preview markdown

### markdown
* Install `prettier`: `yarn global add prettier` or `npm install --global prettier`
* Open vim and enter command: `:SPUPdate`

### Option window, window, split bar
- `Ctrl-h,l,j,k` - use to move to left、right、top、bottom commpartment. This is still valid when vim and the split bar are together, thanks to `vim-tmux-navigator`。
- `Q` - Enter Ex mode
- `vv` - Vertical separation (`Ctrl-w,v`)
- `ss` - Horizontal separation (`Ctrl-w,s`)
- `,qo` - Open quickfix window (The output of grep will go to this window)
- `,qc` - close quickfix

#### Rails & Ruby


- `,vv` & `,cc` to switch between view and controller-they are the mappings corresponding to :Rcontroller and :Rview. Explore: R family commands can learn more about the fun of rails.vim!
- `,rs` & `,rl` to run rspec or a spec line in iTerm (check the iTerm window for information).
- `,tt` Add `now: true`tag to a block of the spec file, and then test the block by `rspec --tag=now`.
- `,ss` & `,sl` To achieve the same thing, by using `spring rspec`, one can make your Rails specs faster, by caching `Rails env` (must have spring gem installed).


#### Vim Dev
- `,vc` - (Vim command) Copy the command under the cursor and run it. Very useful for testing single-line changes in vimrc.
- `,vr` - (Vim re-documented) Use the current file as a vim file to load the source.

#### SpaceVim Interface elements:
The interface elements of SpaceVim start with [SPC] t or [SPC] T. You can view the second-level instructions by pressing the [SPC] key in the vim window. In the same way, press the required second-level instructions and then you can check the three Level instructions to view.

- `SPC t h s` - Show/hide syntax highlighting
- `SPC t n` - Show/hide line number
- `SPC t h h` - Highlight current line
- `SPC T m` - Show/hide the menu bar (no difference is seen)
- `SPC T t` - Show/hide the toolbar (don’t see the difference)
- `SPC [1-9]` - Jump to the specified window
- `SPC f t` - Open file tree
- `SPC p f` - find files in current project
- `SPC f y` - show and copy current file absolute path in the cmdline
- `SPC f S` - save all files
- `SPC f o` - Find current file in file tree
- `SPC f D` - delete a file and the associated buffer with confirmation
- `SPC f p` - search word in current project
- `SPC p /` - fuzzy search for text in current project
- `SPC c l` - toggle comment lines
- `SPC c p` - toggle comment paragraphs

#### Switch Tab:
When multiple files are opened, the files will be listed in the tab bar in the form of Tabs, and you can switch to the Tab with the corresponding serial number via `\[1-9]`.

- `\1` - Open tag 1
- `\2` - Open tag 2
- `\3` - Open tag 3
- `\4` - Open tag 4
- `\5` - Open tag 5
- `\6` - Open tag 6
- `\7` - Open tag 7
- `\8` - Open tag 8
- `\9` - Open tag 9




## iTerm

### iTerm Solarized Colors

YADR will install the Solarized color scheme into iTerm. You can choose Solarized Dark in Profiles => Colors => Load Presets.


## [Homebrew](http://mxcl.github.com/homebrew/)


Homebrew is a missing OSX package management system, and it will be installed automatically.

We automatically installed some commonly used packages, such as ctags, git, macvim, hub, and RipGrep (‘rg’). Note that our auto-completion plugin requires MacVim to support Lua. The installer knows how to install it, but if you have installed it before, you need to manually delete your previous MacVim.



## Language support
#### Typescript
fix `SpaceVim Unknown function: TSOnBufEnter`
* References
  * https://github.com/SpaceVim/SpaceVim/issues/1800
  * https://github.com/SpaceVim/SpaceVim/issues/3221
* Resolution steps
  * Delete cache   rm -rf ~/.cache/vimfiles/.cache
  * Open vim  run `:CheckHealth` check the current vim status, and fix any errors.
  * Reopen vim and run `:UpdateRemotePlugins`
  * If it still doesn't work, add `call dein#reinstall(['nvim-typescript'])` to `~/.local/share/nvim/rplugin.vim`, reopen vim and wait for the `nvim-typescript` plugin to install

## Troubleshoot
Refer more at https://github.com/skwp/dotfiles

