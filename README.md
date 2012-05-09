scp-upload.vim
============

編集中のファイルをscpでアップロードすることができます。
送信先のサーバー情報は変数に定義できます。複数登録可能です。

INSTALL
----
    cd ~/.vim/bundle
    git clone git://github.com/ryoppy/vim-scp-upload.git
    mkdir -p ~/bin
    mv ./vim-scp-upload/scp.sh ~/bin

Usage
----
    <leader>scp

Description
----
以下のように設定ファイルを書いてください。
Please write following like.

    let g:vim_scp_configs = {
    \	'sample_server_1' : {
    \		'local_base_path'  : '/Users/name/sample/',
    \		'remote_base_path' : '/var/www/sample/',
    \		'user' : 'username',
    \		'pass' : 'password',
    \		'host' : 'ip addess or domain name',
    \		'port' : '22'
    \	},
    \	'sample_server_2' : {
    \		'local_base_path'  : '/Users/development',
    \		'remote_base_path' : '/var/www/development/trunk/',
    \		'user' : 'username',
    \		'pass' : 'password',
    \		'host' : 'ip addess or domain name',
    \		'port' : '22'
    \	}
    \}

sample1
 > Edit file : /Users/name/sample/file.php
 > Upload to : /var/www/sample/file.php

sample2
 > Edit file : /Users/name/sample/lib/dao/file.php
 > Upload to : /var/www/sample/lib/dao/file.php

Alias
----
別のコマンドがいい場合。
If you want to another command, write following like.

Ctrl+u
    nnoremap <C-U> <ESC>:call ScpUpload()<CR>
