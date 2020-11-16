# Ruilisi dotfiles


## Requirements
`zsh`, `tmux`, `vim`, `ag` are installed and zsh is set as your login shell:
```sh
chsh -s $(which zsh)
```

## Install

```sh
bash -c "`curl -fsSL https://raw.githubusercontent.com/ruilisi/dotfiles/master/install.sh`"
```

## Shortcuts

#### Tmux
Prefix is defined as `C-A`(`PRE` for short)

**Scroll Mode**

`PRE [`: Enter Scroll Mode
Shortcut | Function |
:-------:|:--------:|
`S-V`      | Select Text       |
`Enter`    | Copy Text         |
`]`        | Paste text copied from scroll mode |

#### Vim
* `<L>`: Short for `<localleader>`, which is `\` in our setup

**Defined by Us**

Shortcut | Function |
:-------:|:--------:|
`C-v`      | Enter visual mode |
`C-x C-v`  | Paste text from system clipboard |
`\<L\>tp`  |toggle paste|

**Defined by Vim**

Shortcut | Function |
:-------:|:--------:|
`o`        |insert a new line below|
`S-o`      |insert a new line above|
`0`        |go to the beginning of the line|
`$`        |go to the end of the line|
`v`        |enter character selection mode|
`x`        |delete selected content|
`V`        |enter line selection mode|
`y`       |copy selected content|
`p`        |paste copied content|
`Ctrl+u`   |page up|
`Ctrl+d`   |page down|
`:w`       |save file|
`:q`       |quit vim|
`:/ keyword`|search|
`n`        |go to the next content|
`S-N`      |go to the previous content|
`w`        |move forward one word|
`b`        |move back one word|
`gg`       |move to the top of the file|
`S-G`      |move to the bottom of the file|
`Ctrl+\`   |show(hide) the Buffers|
`[spc] c l`|(un)comment the selected line|
`%s key1/key2/g`|replace Key1 with Key2|

#### vim && markdown
* Install `prettier`: `yarn global add prettier` or `npm install --global prettier`
* Open vim and enter command: `:SPUPdate`

## Q&A

#### How to edit command line in vim
During editing command line, press `esc` to enter normal mode, then press `C-x C-e` to edit current command line in vim.

#### install iTerm Solarized Colors


YADR will install the Solarized color scheme into iTerm. You can choose Solarized Dark in Profiles => Colors => Load Presets.


#### swap the positions of caps-lock and escape by [Karabiner-Elements](https://pqrs.org/osx/karabiner/index.html).


Escape is the most commonly used key in vim. The old keyboard used to have the Escape as big as `tab`, the worst part of the Apple keyboard is that the `ESC` key is too small. However，we can swap the roles of `ESC` key and `Caps` key to solve these problems. If you keep tapping on the small target in the corners, you woll definitely reduce your efficiency drastically, and maybe you will cause small inijuries to your hands to repeated muscle force.


#### Set a system-level hotkey for iTerm (Keys=>Hotkey)


We recommend using `Cmd-Escape`, which is actually `Cmd-Capslock`(because the roles are interchanged).


#### Select "Use Lion-style full screen" in the General of iTerm.


After this setting, you will get a large screen that can be switched without having to go through the switching space.


#### Cancel Prefer native fullscreen in the Advanced Settings of MacVim.


Lion-style space switching will reduce all efficiency for no reason, just like iTerm.


## If you want to run on the terminal


- Make sure that your terminal has installed the Solarized color scheme!
- If you don't want to use a terminal with solarized color matching, then makr sure you did this: `let g:yadr_using_unsolarized_terminal = 1 `
# in ~/.vimrc.before

- if you want to use an alternavtive color scheme, such as Gruvbox, then do this in your `~/.vimrc.after`:

```
let g:yadr_disable_solarized_enhancements = 1
colorscheme base16-twilight
```




### Upgrade


Upgrade is very simple.


```bash
cd ~/.yadr
git pull --rebase
rake update
```


## What has been included and how do I configure it?

Keep reading to learn more about what YADR has to offer you!


### [Homebrew](http://mxcl.github.com/homebrew/)


Homebrew is a missing OSX package management system, and it will be installed automatically.

We automatically installed some commonly used packages, such as ctags, git, macvim, hub, and RipGrep (‘rg’). Note that our auto-completion plugin requires MacVim to support Lua. The installer knows how to install it, but if you have installed it before, you need to manually delete your previous MacVim.


### ZSH

Think of Zsh as a more awesome Bash, but without much learning costs. It will do automatic spelling correction, grammar highlighting, and more for the command line you write. We have also added many enhancements:


- Vim mode and bash style historical anti-query: `Ctrl-R`
- Insert the result of the previous command: `Ctrl-x,Ctrl-l`
- Fuzzy match-if you type the wrong folder name, tab completion will correct it.
- [fasd](https://github.com/clvv/fasd) ubtegration - Entering `z` will help you semi-automatically match the recently used folders. Tab completion is also tuen on.
- [Prezto - the zsh behind YADR's](http://github.com/sorin-ionescu/prezto)
- [How to add your own ZSH theme](doc/zsh/themes.md)



### Alias

Most of the things we use every day can be done with two to three character aliases. Please modify them yourself:


```
ae # alias edit
ar # alias reload
```


### Git customization:

YADR will take over your ~/.gitconfig, so if you want to store your git username and other settings, please put them in ~/.gitconfig.user

We recommend setting your user information in this file. In addition, you can set your environment variables appropriately in your ~/.secrets.

- `git l` or `gl`- More effective git log
- `git b` or `gb`- A list of branches containing the summary of the previous commit
- `git r` - Information about the source list
- `git t` or `gt`- Information about the tag list
- `git nb` or `gnb`- Just like checkoub -b, create a new branch
- `git cp` or `gcp`- cherry-pick -x (Show those branches which have been cherrypicked)
- `git simple` - A more concise command to build changelogs
- `git recent-branches` - Show you about the branches you have used recently
- `git unstage` / `guns` (remove from index) and `git uncommit` / `gunc` (Revoke to the moment before the last commit-if the code has been pushed, this operation will be very dangerous) Alias
- Some reasonable default settings, such as optimizing merged branch information, pushing only the current branch, deleting status prompts, and using easy-to-remember prefixes in the diff process: (i)ndex, (w)ork tree, (c)ommit and (o)bject
- Slightly optimized the color of diff
- `gdmb` (g)it (d)elete (m)erged (b)ranches - Delete all branches that have been merged into the current branch
- `Gdiff` Display changes



##### vim-gitgutter


- `]h` next hunk(change point)
- `[h` previous hunk
- `<Leader>ha` Put the hunk into the state area to save
- `<Leader>hr` Revoke the hunk



### RubyGems


.gemrc is included. No need to enter `gem install whatever --no-ri --no-rdoc`. `--no-ri --no-rdoc` anymore, because it's all done by default.


### Settings of Tmux

`tmux.conf` provides some reasonable default settings for tmux on Mac OS, such as a powerful status bar and VIM keyboard bindings. You can modify the configuration in `~/.tmux.conf.user`.


### Make everything Vim stylized

The provided inputrc and editrc will transform many of your command-line tools-such as mysql and irb-into vim style. And editrc also contains a Ctrl-R reverse history search function, which is very useful in irb, postgres command line, etc.


### Github problems: [ghi gem](https://github.com/stephencelis/ghi)

We included the `ghi` command. Try `ghi list`, and have fun in managing issues using the command line!


## Vim - Which ones are included?


- [navigation - NERDTree, EasyMotion, CtrlP and more](doc/vim/navigation.md)
- [text object - Manipulate Ruby blocks, and more](doc/vim/textobjects.md)
- [modify the code - support of rails, commit, code block, highlight](doc/vim/coding.md)
- [tools - Indentation, paste buffer management, and more](doc/vim/utils.md)
- [usually do not add new command line improvements](doc/vim/enhancements.md)


Some of the most useful commands provided by YADR are listed below. This is not a comprehensive list. If you want to dig out more information, contact a few of them every day, and then start to look at the plugins provided in the above list to learn more.


#### Tmux


- `h`(jkl): ←(↓↑→)move pane
- `c-a c`: Create a new pane
- `c-a s`: Split panes up and down
- `c-a v`: Split panes left and right
- `c-a x`: Kill pane
- `c-a H`(JKL): ←(↓↑→)Move dividing line
- `c-a ,`: Switch to Tmux command line mode
- `c-a d`: Exit Session
- `c-a D`: Choose to exit Session
- `c-a 1`(23456789): Enter pane 1(23456789)



#### 导航


- `,z` - 到前一个缓冲区 (:bp)
- `,x` - 到下一个缓冲区 (:bn)
- `Cmd-j` 及 `Cmd-k` 用函数来上下粗略的移动(Linux中的`Alt`)
- `Ctrl-o` - 之前的光标位置 - 这是一个标准的健映射，但很有用，所以这边给出来了
- `Ctrl-i` - 对应于Ctrl-O(再一次, 这是标准的)



#### 搜索/代码导航


- `,f` - 快速查找class的定义(exuberant ctags必须被安装过)
- `,F` - 类似于`,f`，但是会用垂直分割的界面显示
- `,gf` 或 `Ctrl-f` - 和vim中正常的gf一样 (进入文件), 但是在一个垂直分割的界面中 (碰到带有行数的，例如file.rb:123，一样能行)
- `gF` - 标准的vim键映射, 为了完整性而列在这里 (带有行数也行)
- `,k` - 搜索当前光标下的单词，然后将结果显示到quickfix窗口里
- `,K` - Grep当前单词一直到下一个感叹号(在ruby foo!方法中很有用)
- `Cmd-*` - 将所有当前单词出现的地方高亮(与正常的`*`一样，除了不移动)
- `,hl` - 切换搜索高亮
- `,gg` 或 `,ag` - 在命令行中grep，在双引号之间输入。 使用RipGrep。
- 在使用`,gg`搜索过，你可以用`Ctrl-x` 和 `Ctrl-z`来浏览 (或者标准vim命令 `:cn` 和 `:cp`)
- `,gd` - 当光标在函数名字上的时候，Grep定义 (检索'def [function name]')
- `,gcf` - 在当前文件搜索对当前文件的索引
- `//` - 清除搜索
- `,,w` (别名 `,<esc>`) 或者 `,,b` (别名 `,<shift-esc>`) - EasyMotion, 一个让你有种vim统治者的工具，它能将所有屏幕上所有可以跳入的地方全部高亮。
- `,mc` - 将该单词标记为多光标处理模式(就像sublime). 用 `Ctrl-n` (下一个), `Ctrl-p` (前一个), `Ctrl-x`(跳过) 来添加更多的光标, 然后就像正常用vim那样，例如修改单词。
- `gK` - 打开cursor底下这个单词的文档。
- Spacebar - Sneak - 在一行中通过输入两个字符来移动。就像是vim的`f`但更加精确。
- `:Gsearch foo` - 全局搜索, 然后使用正常的`%s/search/replace/g`紧接着用`:Greplace`来在所有的文件中作替换操作。结束后，使用`:wall`来写入所有文件。



#### 文件导航


- `,t` - CtrlP 模糊文件选择
- `,b` - CtrlP 缓冲区选择 - 非常适用于想跳入一个你已经打开的文件
- `Cmd-Shift-M` - 跳入方法- CtrlP 在当前缓冲区里作标签化搜索
- `,jm` 跳入模型内。其他`,j`键映射: `,jc`控制器, `,jh`帮助集, 等等。
- `Cmd-Shift-N` - NERDTree toggle (Linux中的`Alt`)
- `Ctrl-\` - 在NERDTree中显示当前文件
- `Cmd-Shift-P` - 清除CtrlP缓存



#### 常用编辑命令更好的按键方法


- 自动补全: Ctrl-空格。snipmate代码片段: Tab。
- 将一个单词用这些符号包裹住: `,#` `,"` `,'` `,]` `,)` `,}`。# 是为了 #{ruby字符串插入}。 在Visual模式下也能运行 (谢谢 @cj)。 正常地，他们通过类似`ysw#`这样的来做到。
- 改变包裹标签里的内容: `Cmd-'`, `Cmd-"`, `Cmd-]`, `Cmd-)`, 等等。你不需要在包裹标签里面。(Linux中的`Alt`)
- 进入上一个编辑位置`,.` (和`'.`一样) 因为撇号对于小指来说非常困难。
- `,ci`来改变任何以一个引号对/括符对等等



#### 选项窗口, 窗口, 分割栏


- 使用 `Cmd-1` 到 `Cmd-9` 来切换到任何一个特定的选项窗口(就像iTerm和Chrome) - 选项窗口必须被设置为显示号码(Linux中的`Alt`)
- `Ctrl-h,l,j,k` - 来移动到左、右、下、上的分割栏中。这在vim和分割栏一起的时候依然有效，感谢`vim-tmux-navigator`。
- `Q` - 只能窗口强杀。用`wincmd c`关闭窗口，如果同一个缓冲区有多个对应窗口, 或者当这是最后一个对应窗口时杀掉缓冲区`bwipeout`。
- `vv` - 垂直分割 (`Ctrl-w,v`)
- `ss` - 水平分割 (`Ctrl-w,s`)
- `,qo` - 打开quickfix窗口 (grep的输出就会到这个窗口里)
- `,qc` - 关闭quickfix



#### 工具


- `Ctrl-p` 使用 `p` 来粘贴以及用 `Ctrl-p` 来循环选择之前的可粘贴内容。 由YankRing提供。
- `,yr` - 查看yankring) - 你之前复制的内容列表。当然你可以粘贴后键入`ctrl-p` 来循环查看之前的复制内容。
- `crs`, `crc`, `cru`通过abolish.vim来迫使采用snake_case, camelCase, 和 UPPERCASE。 `:help abolish`可以查看更多内容。
- `:NR` - NarrowRgn - 在选择的文本上使用这个命令来创建一个就用这些文本生成的分割显示区域。试一试，然后用:wq来返回。
- `,ig` - 切换缩进可视化样式
- `,cf` - 复制当前文件的文件名(全路径)到系统(不是vi)的粘贴缓冲区
- `,cn` - 同上，但仅为文件名
- `,yw` - 从一个单词内部的任何一个地方拉取这个单词(所以你不需要到单词的起始位置)
- `,ow` - 用当前拉取区域的内容(即复制的内容)覆盖当前光标所在单词 - 你可以在当前单词的任何地方。为你省去可视选择的过程。
- `,ocf` - 打开所有改过的文件(从@garybernhardt偷过来的)。将所有git中改过的文件全部分割显示出来。
- `,w` - 删除尾部空白字符
- `sj` - 将一行例如一个一行散列{:foo => {:bar => :baz}}分割为多行的散列(j = 向下)
- `sk` - 撤销裂开的链接(k = 向上)
- `,he` - Html 字符转义
- `,hu` - Html 字符反转
- `,hp` - Html 预览 (用Safari打开)
- `Cmd-Shift-A` - 对其 (输入一个字符/表达式来对其, 在可视化模式或者它本身情况下都能工作) (Linux里的`Alt`)
- `:ColorToggle` - 打开#abc123颜色高亮(css中有效)
- `:Gitv` - Git记录的浏览器
- `,hi` - 显示当前的高亮组。如果你不喜欢什么东西的颜色, 先用这个, 然后在你的vimrc.after中`hi! link [groupname] [anothergroupname]`来重新映射颜色。你可以通过使用`:hi`来查看所有可用的颜色。
- `,gt` - Go Tidy - 清理你的html代码 (在可视选择情况下可用)
- `:Wrap` - 包裹长行(例如在编辑markdown时)
- `Cmd-/` - 切换注释 (通常情况下gcc中从tComment来) (Linux中是`Alt`)
- `gcp` (注释一段)



#### Rails & Ruby


- `,vv` 和 `,cc` 来在view和controller中切换 - 他们是:Rcontroller和:Rview对应的映射。探索一下:R家族的命令可以了解更多rails.vim的乐趣!
- `,rs` 和 `,rl` 来在iTerm中运行rspec 或者一个 spec 行 (查看iTerm窗口来获得信息)
- `,ss` 和 `,sl` 来达到一样的事情，通过使用`spring rspec`，一个能将你的Rails specs变得速度更快，通过缓存Rails env (必须有spring gem安装过)
- vim-ruby-refactoring - 试一试 `,rem`, `,rel` 来抽取方法或者let声明
- `Ctrl-s` - 打开相关的spec到分割窗口中。与rails.vim中的:A 和 :AV相似，但是能够注意到fast_spec目录以及输入起来速度更快
- `:Bopen [gem name]` 来导航进 gem (@tpope/vim-bundler)
- `,gcp` - Grep当前的Partial来找到指向当前view partial的所有参考。
- `,orb` - 到ruby块上一层。带你从嵌套的块中到达上一个层 (对rspec非常有用)



#### Vim Dev


- `,vc` - (Vim 命令) 复制光标下的命令然后运行它。对于测试vimrc中单行的改变非常有用。
- `,vr` - (Vim 重新记载) 将当前文件当成vim文件来进行源加载。



#### SpaceVim界面元素：
SpaceVim的界面元素以[SPC] t或[SPC] T开头，可以通过在vim窗口内按下[SPC]键查看二级指令，同理，再按下所需要的二级指令后可以再对三级指令进行查看。

- `SPC t h s` - 显示/隐藏语法高亮
- `SPC t n` - 显示/隐藏行号
- `SPC t h h` - 高亮当前行
- `SPC T m` - 显示/隐藏菜单栏（没看出区别）
- `SPC T t` - 显示/隐藏工具栏（没看出区别）
- `SPC [1-9]` - 跳到指定的窗口



#### 切换Tab：
当打开多个文件后，文件会以Tab的形式罗列在标签栏中，可以通过`\[1-9]`切换至对应序号的Tab。

- `\1` - 打开标签1
- `\2` - 打开标签2
- `\3` - 打开标签3
- `\4` - 打开标签4
- `\5` - 打开标签5
- `\6` - 打开标签6
- `\7` - 打开标签7
- `\8` - 打开标签8
- `\9` - 打开标签9



#### 文件树：
文件树用于显示当前打开文件所在位置的文件目录
`SPC f t/<F3>` - 打开文件树


#### 文件树内快捷键：

- `i` - 垂直分割一个新的窗口，并跳转
- `gi` - 垂直分割一个新的窗口，不跳转
- `s` - 水平分割一个新的窗口，并跳转
- `gs` - 水平分割一个新的窗口，不跳转
- `t` - 在新tab中打开一个新的窗口，并跳转
- `T` - 在新tab中打开一个新的窗口，不跳转
- `o` - 打开当前选中的文件或目录，并跳转
- `go` - 打开当前选中的文件或目录，不跳转



#### vim光标操作：

- `k` - 向上移动光标
- `j` - 向下移动光标
- `h` - 向做移动光标
- `l` - 向右移动光标
- `gg` - 页面顶部
- `G` - 页面底部
- `[Ctrl] g` - 显示当前光标位置
- `[Num] G` - 光标移动到指定行
- `0` - 光标移动到行首
- `[Num] w` - 光标移动到指定单词数的开头
- `[Num] e` - 光标移动到指定单词数的末尾



#### vim模式切换：
`[Esc]` - 退出当前模式
`i` - 插入模式
`v` - 选择模式
`R` - 替换模式


#### 文档操作：

- `q` - 退出
- `w` - 保存
- `wq` - 保存并退出
- `q!` - 强制退出



#### 文本编辑：

- `y` - 复制选中区域
- `yy` - 复制一整行
- `p` - 粘贴


- `o` - 下方插入一行
- `O` - 上方插入一行
- `A` - 行尾插入
- `a` - 光标右侧插入
- `i` - 光标左侧插入
- `u` - 撤销操作
- `U` - 按行撤销操作
- `[Ctrl] R` - 重做
- `x` - 删除选中的内容
- `dw` - 删除单词
- `d$` - 删除至行尾
- `dd` - 删除整行
- `d[num]w` - 删除指定数量的单词
- `r` - 替换一个字符
- `:s/A/B` - 该行首个A替换成B
- `:s/A/B/g` - 该行所有A替换成B
- `:[num1,num2]s/A/B/g` - 将指定行的A替换成B
- `:%s/A/B/g` - 将指当前tab内的所有A替换成B



文档查询：

- `:/A` - 文档内查找A
- `:/A` - 文档内查找A，忽略大小写
- `n` - 下一个
- `N` - 上一个
- `:nohlsearch` - 取消高亮
- `:set hls is` - 高亮显示查询结果
- `:set ic` - 忽略大小写
##
## 扩展或者重载YADR设置


- [调试vim映射](doc/vim/keymaps.md)
- [通过~/.vimrc.after或者类似文件来重载vim设置](doc/vim/override.md)
- [添加你自己的vim插件](doc/vim/manage_plugins.md)



## 杂项


- [特别表扬和感谢](doc/credits.md)
- [其他推荐的提高OSX生产力的工具](doc/osx_tools.md)
- [Yan's Blog](http://yanpritzker.com)



### OSX Hacks


osx文件是一个为开发者或者高能用户进行合理默认设置的bash脚本。在运行它之前先读一下。使用:


```
bin/osx
```


这些特殊技巧是以Lion为中心的。不一定在其他OS上也能行。我最喜欢的模块包括:


- 极快的重复击键速度(现在你可以通过j/k实现快速滚动)
- 无磁盘镜像验证(下载的文件打开速度更快)
- 在finder中显示~/Library文件夹下的内容(在Lion中隐藏的)



### Macvim遇到Lua的麻烦了?


```
brew uninstall macvim
brew remove macvim
brew cleanup
brew install macvim --custom-icons --with-override-system-vim --with-lua --with-luajit
```


### 终端Vim碰到Lua的麻烦？


通过RVM管理的Ruby来安装一个终端Vim(和lua一起)会导致neocomplete插件发生segfault。尝试卸载vim，然后使用系统ruby来卸载vim:


```
brew uninstall vim
rvm system do brew install vim --with-lua
```


### [Pry](http://pry.github.com/)


Pry提供了一个更好的使用了颜色、tab补全及其他更多小技巧开包即用的IRB。你还可以通过安装[pry-nav](https://github.com/nixme/pry-nav)把它当做一个真正的调试器。


[了解更多YADR's pry定制化以及如何安装](doc/pry.md)

## 语言支持
#### Typescript
fix SpaceVim Unknown function: TSOnBufEnter
* 主要参考
  * https://github.com/SpaceVim/SpaceVim/issues/1800
  * https://github.com/SpaceVim/SpaceVim/issues/3221
* 解决步骤
  * 删除cache   rm -rf ~/.cache/vimfiles/.cache
  * 打开vim  运行`:CheckHealth` 查看当前vim状态，有啥报错修复啥
  * 重新打开vim 再运行`:UpdateRemotePlugins`
  * 如果还不行，在`~/.local/share/nvim/rplugin.vim` 添加`call dein#reinstall(['nvim-typescript'])`,重新打开vim等待`nvim-typescript`插件安装
