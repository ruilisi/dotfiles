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

YADR会接管你的`~/.gitconfig`, 所以如果你想存储你的git用户名及其他设置, 请把他们放在`~/.gitconfig.user`

我们推荐在这个文件里设置你的用户信息是。另外，你可以将你的环境变量恰当地设置在你的 `~/.secrets`里。

  * `git l` 或 `gl`- 可用度更高的git log
  * `git b` 或 `gb`- 含有上一个commit摘要的分支列表
  * `git r` - 有关源列表的信息
  * `git t` 或 `gt`- 有关标签列表的信息
  * `git nb` 或 `gnb`- 正如checkoub -b，建立一个新的分支
  * `git cp` 或 `gcp`- cherry-pick -x (显示那些被cherrypick过的)
  * `git simple` - 一个更加简洁的构建changelogs的命令
  * `git recent-branches` - 帮助告诉你最近使用过的分支
  * `git unstage` / `guns` (从index上移除) 以及 `git uncommit` / `gunc` (撤销至上一个commit之前的时刻 - 如果代码已经push过，这个操作将会非常危险) 别名
  * 一些合情合理的默认设置, 例如优化合并分支信息, 只推送当前分支, 删除状态提示, 以及在diff过程中使用易于记忆的前缀: (i)ndex, (w)ork tree, (c)ommit and (o)bject
  * 微微优化了diff的颜色
  * `gdmb` (g)it (d)elete (m)erged (b)ranches - 删除所有已经合并到当前分支的分支

### RubyGems

.gemrc被包含了。 再也不用输入`gem install whatever --no-ri --no-rdoc`. `--no-ri --no-rdoc`，因为默认都做好哦了。

### Tmux 设置

`tmux.conf` 为Mac OS上的tmux提供了一些合情合理的默认设置，例如强大的状态条和VIM键盘绑定。
你可以在`~/.tmux.conf.user`修改配置。

### 让所有的东西都Vim风格化

已经提供好的inputrc和editrc将把你的很多命令行工具－例如mysql和irb－转变成vim风格的。并且editrc还包含了一个Ctrl-R反向历史搜索功能，这在irb、postgres命令行等等中非常实用。

### Github 问题: [ghi gem](https://github.com/stephencelis/ghi)

我们纳入了`ghi`命令。 试试 `ghi list`，然后在使用命令行管理issues中获得快了吧！


## Vim - 哪些被包含了呢？

 * [导航 - NERDTree, EasyMotion, CtrlP 以及更多](doc/vim/navigation.md)
 * [文本对象 - 操作ruby块, 以及更多](doc/vim/textobjects.md)
 * [操作代码 - rails支持, 注释, 代码片, 高亮](doc/vim/coding.md)
 * [工具 - 缩进, 粘贴缓冲区管理， 以及更多](doc/vim/utils.md)
 * [通常的并不添加新命令行的改进](doc/vim/enhancements.md)

下面列出了一些YADR提供的最有用的命令。这不是一个很全的列表。若想挖掘更多信息，每天联系其中几个，然后开始深入查看上面列表中提供的插件来学习更多。

#### 导航

 * `,z` - 到前一个缓冲区 (:bp)
 * `,x` - 到下一个缓冲区 (:bn)
 * `Cmd-j` 及 `Cmd-k` 用函数来上下粗略的移动(Linux中的`Alt`)
 * `Ctrl-o` - 之前的光标位置 - 这是一个标准的健映射，但很有用，所以这边给出来了
 * `Ctrl-i` - 对应于Ctrl-O(再一次, 这是标准的)

#### 搜索/代码导航

 * `,f` - 快速查找class的定义(exuberant ctags必须被安装过)
 * `,F` - 类似于`,f`，但是会用垂直分割的界面显示
 * `,gf` 或 `Ctrl-f` - 和vim中正常的gf一样 (进入文件), 但是在一个垂直分割的界面中 (碰到带有行数的，例如file.rb:123，一样能行)
 * `gF` - 标准的vim键映射, 为了完整性而列在这里 (带有行数也行)
 * `,k` - 搜索当前光标下的单词，然后将结果显示到quickfix窗口里
 * `,K` - Grep当前单词一直到下一个感叹号(在ruby foo!方法中很有用)
 * `Cmd-*` - 将所有当前单词出现的地方高亮(与正常的`*`一样，除了不移动)
 * `,hl` - 切换搜索高亮
 * `,gg` 或 `,ag` - 在命令行中grep，在双引号之间输入。 使用 Ag(Silver Searcher)。
 * 在使用`,gg`搜索过，你可以用`Ctrl-x` 和 `Ctrl-z`来浏览 (或者标准vim命令 `:cn` 和 `:cp`)
 * `,gd` - 当光标在函数名字上的时候，Grep定义 (检索'def [function name]')
 * `,gcf` - 在当前文件搜索对当前文件的索引
 * `//` - 清除搜索
 * `,,w` (别名 `,<esc>`) 或者 `,,b` (别名 `,<shift-esc>`) - EasyMotion, 一个让你有种vim统治者的工具，它能将所有屏幕上所有可以跳入的地方全部高亮。
 * `,mc` - 将该单词标记为多光标处理模式(就像sublime). 用 `Ctrl-n` (下一个), `Ctrl-p` (前一个), `Ctrl-x`(跳过) 来添加更多的光标, 然后就像正常用vim那样，例如修改单词。
 * `gK` - 打开cursor底下这个单词的文档。
 * Spacebar - Sneak - 在一行中通过输入两个字符来移动。就像是vim的`f`但更加精确。
 * `:Gsearch foo` - 全局搜索, 然后使用正常的`%s/search/replace/g`紧接着用`:Greplace`来在所有的文件中作替换操作。结束后，使用`:wall`来写入所有文件。


#### 文件导航

 * `,t` - CtrlP 模糊文件选择
 * `,b` - CtrlP 缓冲区选择 - 非常适用于想跳入一个你已经打开的文件
 * `Cmd-Shift-M` - 跳入方法- CtrlP 在当前缓冲区里作标签化搜索
 * `,jm` 跳入模型内。其他`,j`键映射: `,jc`控制器, `,jh`帮助集, 等等。
 * `Cmd-Shift-N` - NERDTree toggle (Linux中的`Alt`)
 * `Ctrl-\` - 在NERDTree中显示当前文件
 * `Cmd-Shift-P` - 清除CtrlP缓存

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
