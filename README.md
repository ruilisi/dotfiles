     _     _           _
    | |   | |         | |
    | |___| |_____  __| | ____
    |_____  (____ |/ _  |/ ___)
     _____| / ___ ( (_| | |
    (_______\_____|\____|_|

    # Yet Another Dotfile Repo v1.1
    # Now with Prezto and Vundle!

[![加入聊天https://gitter.im/hophacker/dotfiles](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/hophacker/dotfiles?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

#### sh -c "\`curl -fsSL https://raw.githubusercontent.com/hophacker/dotfiles/master/install.sh \`"

**Always be sure to run `rake update` after pulling to ensure plugins are updated**

## 什么是YADR?

**YADR 是一个具有偏向性的dotfile源，它会让开心到心里在唱歌**

  * 吸收了所有最好的dotfile源的精华，vim和zsh的插件被紧密连贯地粘合在一起。
  * 超过90种vim插件被放在一起为您服务，每个插件都经过研究并被配置到最佳状态，且常常拥有最合理的快捷键 。
  * 许多zsh插件完美地基于Prezto, 且在此之上叠加了一些优质特性。
  * 一切的一切都被vim化: irb, postgres命令行等等.

## 邮件列表

如果你有问题或者疑问又想听听我们的建议，请加入[Google Group](https://groups.google.com/forum/#!forum/yadr-users)

如果是PR或者bug汇报，请一定使用Github。

## 截图

![screenshot](http://i.imgur.com/3C1Ze.png)

## 安装

开始先运行:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/hophacker/dotfiles/master/install.sh`"
```

**注意:** YADR会自动安装它的所有子模块。如果你需要在安装每个模块前确认一下, 使用:

```bash
sh -c "`curl -fsSL https://raw.githubusercontent.com/hophacker/dotfiles/master/install.sh`" -s ask
```

## 等等，还没完。这一步不能少:

#### 安装 iTerm Solarized Colors
YADR 会往iTerm里安装Solarized配色方案。进入Profiles => Colors => Load Presets，可以选择Solarized Dark。

#### 用[Seil](https://pqrs.org/osx/karabiner/seil.html.en)来交换caps-lock和escape的位置。
escape键是vim里最常用的键。老式键盘曾拥有Tab一样大的键，Apple键盘最差的地方就是拥有极小的Esc键。但是，
通过交换Esc键和Caps键的位置可以修复这些问题。如果总是不停地敲击角落上的小目标，你肯定会大幅降低自己的效率，说不定还会让你的手因屡次肌肉用力产生小的创伤。

#### 为iTerm设置一个系统级别的热键 (Keys=>Hotkey)
推荐Cmd-Escape, 实际上就是Cmd-Capslock(因为键的位置互换了)。

#### 在iTerm的General里, 取选 "Use Lion-style full screen"
这可以给你一个可以切换却无需通过切换空间的大屏。

#### 在MacVim的Advanced Settings里, 取消Prefer native fullscreen
和iTerm一样。Lion风格的空间切换会毫无理由地让一切效率降低下来。

## 如果你想在终端上运行

* 确定你的终端已经安装了Solarized配色方案！
* 如果你不想用solarized配色的终端, 那就确认你这么做哦了:

      let g:yadr_using_unsolarized_terminal = 1
      # in ~/.vimrc.before

* 如果你想用一个替代的配色方案，譬如Gruvbox, 那就在你的`~/.vimrc.after` 这么做:

      let g:yadr_disable_solarized_enhancements = 1
      colorscheme base16-twilight

### 升级

升级非常简单。

```bash
cd ~/.yadr
git pull --rebase
rake update
```

## 哪些东西被包括了，如何配置？

继续阅读，了解更多YADR给你提供的！

### [Homebrew](http://mxcl.github.com/homebrew/)

Homebrew是_缺失了的OSX包管理系统_，它会被自动安装。

我们自动安装了一些常用的包，例如ctags, git, macvim, hub, 以及silver searcher ('ag')。
注意我们的自动补全插件需要MacVim支持Lua。安装器知道如何安装，但如果你以前安装过，你需要手动删除你以前的MacVim。

### ZSH

把Zsh想象成一个更加牛逼的Bash，却又无需太多学习成本。它会为你写的命令行作自动拼写矫正，语法高亮，以及更多。
我们并且还增加了很多增强性能:

* Vim模式和bash风格的历史反查询: `Ctrl-R`
* 插入上一行命令的结果: `Ctrl-x,Ctrl-l`
* 模糊匹配 - 如果你打错了文件夹名，tab补全会修正它。
* [fasd](https://github.com/clvv/fasd) 集成 - 输入 `z` 会帮你半自动匹配最近用过的文件夹。Tab补全也开启了。
* [Prezto - YADR's背后的zsh](http://github.com/sorin-ionescu/prezto)
* [如何添加你自己的ZSH主题](doc/zsh/themes.md)

### 别名

大部分我们每天用的东西都可以用两到三个字符的别名完成。请自行修改他们:

    ae # alias 编辑
    ar # alias 重载


### Git定制化:

YADR will take over your `~/.gitconfig`, so if you want to store your usernames, please put them into `~/.gitconfig.user`

It is recommended to use this file to set your user info. Alternately, you can set the appropriate environment variables in your `~/.secrets`.

  * `git l` or `gl`- a much more usable git log
  * `git b` or `gb`- a list of branches with summary of last commit
  * `git r` - a list of remotes with info
  * `git t` or `gt`- a list of tags with info
  * `git nb` or `gnb`- a (n)ew (b)ranch - like checkout -b
  * `git cp` or `gcp`- cherry-pick -x (showing what was cherrypicked)
  * `git simple` - a clean format for creating changelogs
  * `git recent-branches` - if you forgot what you've been working on
  * `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc` (revert to the time prior to the last commit - dangerous if already pushed) aliases
  * Some sensible default configs, such as improving merge messages, push only pushes the current branch, removing status hints, and using mnemonic prefixes in diff: (i)ndex, (w)ork tree, (c)ommit and (o)bject
  * Slightly improved colors for diff
  * `gdmb` (g)it (d)elete (m)erged (b)ranches - Deletes all branches already merged on current branch

### RubyGems

A .gemrc is included. Never again type `gem install whatever --no-ri --no-rdoc`. `--no-ri --no-rdoc` is done by default.

### Tmux configuration

`tmux.conf` provides some sane defaults for tmux on Mac OS like a powerful status bar and vim keybindings.
You can customize the configuration in `~/.tmux.conf.user`.

### Vimization of everything

The provided inputrc and editrc will turn your various command line tools like mysql and irb into vim prompts. There's
also an included Ctrl-R reverse history search feature in editrc, very useful in irb, postgres command line, and etc.

### Github Issues: [ghi gem](https://github.com/stephencelis/ghi)

We include the `ghi` command. Try `ghi list` and have fun managing issues from command line!


## Vim - What's included?

 * [Navigation - NERDTree, EasyMotion, CtrlP and more](doc/vim/navigation.md)
 * [Text Objects - manipulate ruby blocks, and more](doc/vim/textobjects.md)
 * [Code manipulation - rails support, comments, snippets, highlighting](doc/vim/coding.md)
 * [Utils - indents, paste buffer management, lots more](doc/vim/utils.md)
 * [General enhancements that don't add new commands](doc/vim/enhancements.md)

A list of some of the most useful commands that YADR provides in vim are
included below. This is not a comprehensive list. To get deeper knowledge,
practice a few of these every day, and then start looking into the lists
of plugins above to learn more.

#### Navigation

 * `,z` - go to previous buffer (:bp)
 * `,x` - go to next buffer (:bn)
 * `Cmd-j` and `Cmd-k` to move up and down roughly by functions (`Alt` in Linux)
 * `Ctrl-o` - Old cursor position - this is a standard mapping but very useful, so included here
 * `Ctrl-i` - opposite of Ctrl-O (again, this is standard)

#### Search/Code Navigation

 * `,f` - instantly Find definition of class (must have exuberant ctags installed)
 * `,F` - same as `,f` but in a vertical split
 * `,gf` or `Ctrl-f` - same as vim normal gf (go to file), but in a vertical split (works with file.rb:123 line numbers also)
 * `gF` - standard vim mapping, here for completeness (go to file at line number)
 * `,k` - Search the current word under the cursor and show results in quickfix window
 * `,K` - Grep the current word up to next exclamation point (useful for ruby foo! methods)
 * `Cmd-*` - highlight all occurrences of current word (similar to regular `*` except doesn't move)
 * `,hl` - toggle search highlight on and off
 * `,gg` or `,ag` - Grep command line, type between quotes. Uses Ag Silver Searcher.
 * After searching with `,gg` you can navigate the results with `Ctrl-x` and `Ctrl-z` (or standard vim `:cn` and `:cp`)
 * `,gd` - Grep def (greps for 'def [function name]') when cursor is over the function name
 * `,gcf` - Grep Current File to find references to the current file
 * `//` - clear the search
 * `,,w` (alias `,<esc>`) or `,,b` (alias `,<shift-esc>`) - EasyMotion, a vimperator style tool that highlights jump-points on the screen and lets you type to get there.
 * `,mc` - mark this word for MultiCursor (like sublime). Use `Ctrl-n` (next), `Ctrl-p` (prev), `Ctrl-x`(skip) to add more cursors, then do normal vim things like edit the word.
 * `gK` - Opens the documentation for the word under the cursor.
 * Spacebar - Sneak - type two characters to move there in a line. Kind of like vim's `f` but more accurate.
 * `:Gsearch foo` - global search, then do your normal `%s/search/replace/g` and follow up with `:Greplace` to replace across all files. When done use `:wall` to write all the files.


#### File Navigation

 * `,t` - CtrlP fuzzy file selector
 * `,b` - CtrlP buffer selector - great for jumping to a file you already have open
 * `Cmd-Shift-M` - jump to method - CtrlP tag search within current buffer
 * `,jm` jump to models. Other `,j` mappings: `,jc` for controllers, `,jh` for helpers, etc. If you think of a concept and a letter, we've got you covered.
 * `Cmd-Shift-N` - NERDTree toggle (`Alt` in Linux)
 * `Ctrl-\` - Show current file in NERDTree
 * `Cmd-Shift-P` - Clear CtrlP cache

#### Better keystrokes for common editing commands

 * Ctrl-Space to autocomplete. Tab for snipmate snippets.
 * `,#` `,"` `,'` `,]` `,)` `,}` to surround a word in these common wrappers. the # does #{ruby interpolation}. works in visual mode (thanks @cj). Normally these are done with something like `ysw#`
 * `Cmd-'`, `Cmd-"`, `Cmd-]`, `Cmd-)`, etc to change content inside those surrounding marks. You don't have to be inside them (`Alt` in Linux)
 * `,.` to go to last edit location (same as `'.`) because the apostrophe is hard on the pinky
 * `,ci` to change inside any set of quotes/brackets/etc

#### Tabs, Windows, Splits

 * Use `Cmd-1` thru `Cmd-9` to switch to a specific tab number (like iTerm and Chrome) - and tabs have been set up to show numbers (`Alt` in Linux)
 * `Ctrl-h,l,j,k` - to move left, right, down, up between splits. This also works between vim and tmux splits thanks to `vim-tmux-navigator`.
 * `Q` - Intelligent Window Killer. Close window `wincmd c` if there are multiple windows to same buffer, or kill the buffer `bwipeout` if this is the last window into it.
 * `vv` - vertical split (`Ctrl-w,v`)
 * `ss` - horizontal split (`Ctrl-w,s`)
 * `,qo` - open quickfix window (this is where output from Grep goes)
 * `,qc` - close quickfix

#### Utility

 * `Ctrl-p` after pasting - Use `p` to paste and `Ctrl-p` to cycle through previous pastes. Provided by YankRing.
 * `,yr` - view the yankring - a list of your previous copy commands. also you can paste and hit `ctrl-p` for cycling through previous copy commands
 * `crs`, `crc`, `cru` via abolish.vim, coerce to snake_case, camelCase, and UPPERCASE. There are more `:help abolish`
 * `:NR` - NarrowRgn - use this on a bit of selected text to create a new split with just that text. Do some work on it, then :wq it to get the results back.
 * `,ig` - toggle visual indentation guides
 * `,cf` - Copy Filename of current file (full path) into system (not vi) paste buffer
 * `,cn` - Copy Filename of current file (name only, no path)
 * `,yw` - yank a word from anywhere within the word (so you don't have to go to the beginning of it)
 * `,ow` - overwrite a word with whatever is in your yank buffer - you can be anywhere on the word. saves having to visually select it
 * `,ocf` - open changed files (stolen from @garybernhardt). open all files with git changes in splits
 * `,w` - strip trailing whitespaces
 * `sj` - split a line such as a hash {:foo => {:bar => :baz}} into a multiline hash (j = down)
 * `sk` - unsplit a link (k = up)
 * `,he` - Html Escape
 * `,hu` - Html Unescape
 * `,hp` - Html Preview (open in Safari)
 * `Cmd-Shift-A` - align things (type a character/expression to align by, works in visual mode or by itself) (`Alt` in Linux)
 * `:ColorToggle` - turn on #abc123 color highlighting (useful for css)
 * `:Gitv` - Git log browsers
 * `,hi` - show current Highlight group. if you don't like the color of something, use this, then use `hi! link [groupname] [anothergroupname]` in your vimrc.after to remap the color. You can see available colors using `:hi`
 * `,gt` - Go Tidy - tidy up your html code (works on a visual selection)
 * `:Wrap` - wrap long lines (e.g. when editing markdown files)
 * `Cmd-/` - toggle comments (usually gcc from tComment) (`Alt` in Linux)
 * `gcp` (comment a paragraph)

#### Rails & Ruby

 * `,vv` and `,cc` to switch between view and controller - these are maps to :Rcontroller and :Rview. Explore the :R<Tab> family of commands for more fun from rails.vim!
 * `,rs` and `,rl` to run rspec or a spec line in iTerm (check iTerm window for results)
 * `,ss` and `,sl` for the same using `spring rspec` which makes your Rails specs faster by caching the Rails env (must have spring gem installed)
 * vim-ruby-refactoring - try `,rem`, `,rel` to extract methods or let statements
 * `Ctrl-s` - Open related spec in a split. Similar to :A and :AV from rails.vim but is also aware of the fast_spec dir and faster to type
 * `:Bopen [gem name]` to navigate to a gem (@tpope/vim-bundler)
 * `,gcp` - Grep Current Partial to find references to the current view partial
 * `,orb` - outer ruby block. takes you one level up from nested blocks (great for rspec)

#### Vim Dev

 * `,vc` - (Vim Command) copies the command under your cursor and executes it in vim. Great for testing single line changes to vimrc.
 * `,vr` - (Vim Reload) source current file as a vim file

## Extending and overriding YADR settings

* [Debugging vim keymappings](doc/vim/keymaps.md)
* [Overriding vim settings with ~/.vimrc.after and friends](doc/vim/override.md)
* [Adding your own vim plugins](doc/vim/manage_plugins.md)

## Misc

* [Credits & Thanks](doc/credits.md)
* [Other recommended OSX productivity tools](doc/osx_tools.md)
* [Yan's Blog](http://yanpritzker.com)

### OSX Hacks

The osx file is a bash script that sets up sensible defaults for devs and power users
under osx. Read through it before running it. To use:

    bin/osx

These hacks are Lion-centric. May not work for other OS'es. My favorite mods include:

  * Ultra fast key repeat rate (now you can scroll super quick using j/k)
  * No disk image verification (downloaded files open quicker)
  * Display the ~/Library folder in finder (hidden in Lion)

### Macvim troubles with Lua?
```
brew uninstall macvim
brew remove macvim
brew cleanup
brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit
```

### Terminal Vim troubles with Lua?
Installing terminal vim (with lua) with an RVM managed Ruby can cause the neocomplete plugin to segfault. Try uninstalling vim, then installing with system ruby:

```
brew uninstall vim
rvm system do brew install vim --with-lua
```


### [Pry](http://pry.github.com/)

Pry offers a much better out of the box IRB experience with colors, tab completion, and lots of other tricks. You can also use it
as an actual debugger by installing [pry-nav](https://github.com/nixme/pry-nav).

[Learn more about YADR's pry customizations and how to install](doc/pry.md)
