# 自動補完を有効にする
autoload -Uz compinit ; compinit

# bashのcompletionを補完
autoload -Uz bashcompinit ; bashcompinit

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word

# コマンドミスを修正
setopt correct

# 補完の選択を楽にする
zstyle ':completion:*' menu select

# 補完候補をできるだけ詰めて表示する
setopt list_packed

# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true

# 補完候補に色つける
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# --prefix=/usr などの = 以降でも補完
setopt magic_equal_subst