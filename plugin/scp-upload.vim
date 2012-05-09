" Header.
" --------------------
" scp-upload.vim
" Maintainer:   https://github.com/ryoppy/vim-scp-upload
" Version:      1.0

" Command.
" --------------------
map <silent>scp <ESC>:call ScpUpload()<CR>

" Logic.
" --------------------
function! ScpUpload()

	if !exists("g:vim_scp_configs")
		echo "Please setting g:configs."
		return
	endif

	let configs = g:vim_scp_configs
	let self_path = expand("%:p")

	for key in keys(configs)
		let config = configs[key]
		let local_base_path = config['local_base_path']
		if self_path =~ "^" . local_base_path
			let target_config        = config
			let target_project       = key
			let target_relative_path = self_path[strlen(local_base_path):]
		endif
	endfor

	if !exists("target_project")
		echo "This file is not in projet. You maight have to set 'g:configs'"
		return
	endif

	let local_full_path  = target_config['local_base_path']  . target_relative_path
	let remote_full_path = target_config['remote_base_path'] . target_relative_path

	if self_path != local_full_path
		echo "self_path is not local_full_path. expect is same."
	endif

	echo "local_full_path : " . local_full_path
	echo "remote_full_path : " . remote_full_path

	let tc = target_config
	let cmd = printf('sh ~/bin/scp.sh %s %s %s %s %s %s', tc['host'], tc['user'], tc['pass'], tc['port'], local_full_path, remote_full_path)
	echo cmd

	let choice = confirm("Can I upload this file?", "&Yes\n&No", 2)
	if choice != 1
		echo "Cenceled."
		return
	endif

	execute '!' . cmd

endfunction
