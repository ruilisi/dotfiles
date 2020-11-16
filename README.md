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

#### 安装 iTerm Solarized Colors


YADR 会往iTerm里安装Solarized配色方案。进入Profiles => Colors => Load Presets，可以选择Solarized Dark。


#### 用[Karabiner-Elements](https://pqrs.org/osx/karabiner/index.html)来交换caps-lock和escape的位置。


escape键是vim里最常用的键。老式键盘曾拥有Tab一样大的键，Apple键盘最差的地方就是拥有极小的Esc键。但是，
通过交换Esc键和Caps键的位置可以修复这些问题。如果总是不停地敲击角落上的小目标，你肯定会大幅降低自己的效率，说不定还会让你的手因屡次肌肉用力产生小的创伤。


#### 为iTerm设置一个系统级别的热键 (Keys=>Hotkey)


推荐Cmd-Escape, 实际上就是Cmd-Capslock(因为键的位置互换了)。


#### 在iTerm的General里, 取选 "Use Lion-style full screen"


这可以给你一个可以切换却无需通过切换空间的大屏。


#### 在MacVim的Advanced Settings里, 取消Prefer native fullscreen


和iTerm一样。Lion风格的空间切换会毫无理由地让一切效率降低下来。


## 如果你想在终端上运行


- 确定你的终端已经安装了Solarized配色方案！
- 如果你不想用solarized配色的终端, 那就确认你这么做哦了:```
let g:yadr_using_unsolarized_terminal = 1
# in ~/.vimrc.before
```

- 如果你想用一个替代的配色方案，譬如Gruvbox, 那就在你的`~/.vimrc.after` 这么做:```
let g:yadr_disable_solarized_enhancements = 1
colorscheme base16-twilight
```




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


我们自动安装了一些常用的包，例如ctags, git, macvim, hub, 以及RipGrep ('rg')。
注意我们的自动补全插件需要MacVim支持Lua。安装器知道如何安装，但如果你以前安装过，你需要手动删除你以前的MacVim。


### ZSH


把Zsh想象成一个更加牛逼的Bash，却又无需太多学习成本。它会为你写的命令行作自动拼写矫正，语法高亮，以及更多。
我们并且还增加了很多增强性能:


- Vim模式和bash风格的历史反查询: `Ctrl-R`
- 插入上一行命令的结果: `Ctrl-x,Ctrl-l`
- 模糊匹配 - 如果你打错了文件夹名，tab补全会修正它。
- [fasd](https://github.com/clvv/fasd) 集成 - 输入 `z` 会帮你半自动匹配最近用过的文件夹。Tab补全也开启了。
- [Prezto - YADR's背后的zsh](http://github.com/sorin-ionescu/prezto)
- [如何添加你自己的ZSH主题](doc/zsh/themes.md)



### 别名


大部分我们每天用的东西都可以用两到三个字符的别名完成。请自行修改他们:


```
ae # alias 编辑
ar # alias 重载
```


### Git定制化:


YADR会接管你的`~/.gitconfig`, 所以如果你想存储你的git用户名及其他设置, 请把他们放在`~/.gitconfig.user`


我们推荐在这个文件里设置你的用户信息是。另外，你可以将你的环境变量恰当地设置在你的 `~/.secrets`里。


- `git l` 或 `gl`- 可用度更高的git log
- `git b` 或 `gb`- 含有上一个commit摘要的分支列表
- `git r` - 有关源列表的信息
- `git t` 或 `gt`- 有关标签列表的信息
- `git nb` 或 `gnb`- 正如checkoub -b，建立一个新的分支
- `git cp` 或 `gcp`- cherry-pick -x (显示那些被cherrypick过的)
- `git simple` - 一个更加简洁的构建changelogs的命令
- `git recent-branches` - 帮助告诉你最近使用过的分支
- `git unstage` / `guns` (从index上移除) 以及 `git uncommit` / `gunc` (撤销至上一个commit之前的时刻 - 如果代码已经push过，这个操作将会非常危险) 别名
- 一些合情合理的默认设置, 例如优化合并分支信息, 只推送当前分支, 删除状态提示, 以及在diff过程中使用易于记忆的前缀: (i)ndex, (w)ork tree, (c)ommit and (o)bject
- 微微优化了diff的颜色
- `gdmb` (g)it (d)elete (m)erged (b)ranches - 删除所有已经合并到当前分支的分支
- `Gdiff`显示代码前后更改



##### vim-gitgutter


- `]h` 下一个hunk(更改点)
- `[h` 上一个hunk
- `<Leader>ha` 将该hunk放进state区域保存
- `<Leader>hr` 撤销该hunk



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


- [导航 - NERDTree, EasyMotion, CtrlP 以及更多](doc/vim/navigation.md)
- [文本对象 - 操作ruby块, 以及更多](doc/vim/textobjects.md)
- [操作代码 - rails支持, 注释, 代码片, 高亮](doc/vim/coding.md)
- [工具 - 缩进, 粘贴缓冲区管理， 以及更多](doc/vim/utils.md)
- [通常的并不添加新命令行的改进](doc/vim/enhancements.md)



下面列出了一些YADR提供的最有用的命令。这不是一个很全的列表。若想挖掘更多信息，每天联系其中几个，然后开始深入查看上面列表中提供的插件来学习更多。


#### Tmux


- `h`(jkl): 左(下上右)移窗格
- `c-a c`: 创建一个新的窗区
- `c-a s`: 上下分割窗格
- `c-a v`: 左右分割窗格
- `c-a x`: 删除窗格
- `c-a H`(JKL): 左(下上右)移分割线
- `c-a ,`: 输入Tmux命令行模式
- `c-a d`: 退出Session
- `c-a D`: 选择退出Session
- `c-a 1`(23456789): 进入窗区1(23456789)



#### 导航





#### 搜索/代码导航






#### 文件导航






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
- `,tt` 给spec文件的某个block添加`now: true`tag, 然后可以通过`rspec --tag=now`来测试该block
- `,ss` 和 `,sl` 来达到一样的事情，通过使用`spring rspec`，一个能将你的Rails specs变得速度更快，通过缓存Rails env (必须有spring gem安装过)
- vim-ruby-refactoring - 试一试 `,rem`, `,rel` 来抽取方法或者let声明
- `Ctrl-s` - 打开相关的spec到分割窗口中。与rails.vim中的:A 和 :AV相似，但是能够注意到fast_spec目录以及输入起来速度更快
- `:Bopen [gem name]` 来导航进 gem (@tpope/vim-bundler)
- `,gcp` - Grep当前的Partial来找到指向当前view partial的所有参考。
- `,orb` - 到ruby块上一层。带你从嵌套的块中到达上一个层 (对rspec非常有用)



#### Vim Dev


- `,vc` - (Vim 命令) 复制光标下的命令然后运行它。对于测试vimrc中单行的改变非常有用。
- `,vr` - (Vim 重新记载) 将当前文件当成vim文件来进行源加载。




#### zsh function


- ##### tips: $number is the argument
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




#### some alias define



- you can find detail in `~/.yadr/zsh/aliases.zsh`




#### SpaceVim界面元素：
SpaceVim的界面元素以[SPC] t或[SPC] T开头，可以通过在vim窗口内按下[SPC]键查看二级指令，同理，再按下所需要的二级指令后可以再对三级指令进行查看。

- `SPC t h s` - 显示/隐藏语法高亮
- `SPC t n` - 显示/隐藏行号
- `SPC t h h` - 高亮当前行
- `SPC T m` - 显示/隐藏菜单栏（没看出区别）
- `SPC T t` - 显示/隐藏工具栏（没看出区别）
- `SPC [1-9]` - 跳到指定的窗口
- `SPC f t` - Open file tree
- `SPC p f` - find files in current project
- `SPC f y` - show and copy current file absolute path in the cmdline
- `SPC f S` - save all files
- `SPC f o` - Find current file in file tree
- `SPC f D` - delete a file and the associated buffer with confirmation
- `SPC f p` - search word in current project
- `SPC p /` - fuzzy search for text in current project



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
