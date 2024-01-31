# other tool
把tmux的配置文件页放在这个目录，然后创建一个软连接到当前用户目录

改的~/.tmux.conf配置文件有如下两种方式可以令其生效：

restart tmux。
在tmux窗口中，先按下Ctrl+b指令前缀，然后按下系统指令:，进入到命令模式后输入source-file ~/.tmux.conf，回车后生效。
