if exists("g:scratch_loaded")
    finish
endif
let g:scratch_loaded = 1

if !exists("g:scratches_dir")
    let g:scratches_dir = '~/.vim/vim-scratches'
endif

function! s:OpenScratch(mode, open_command)
    let l:ext = input("File Ext: ")
    if l:ext == ''
        let l:ext=expand("%:e")
    endif
    if a:mode == 'v'
        let l:save_a=@a
        norm! gv"ay
    endif
    exec a:open_command.' '.g:scratches_dir.'/scratch.'.l:ext

    if a:mode == 'v'
        norm! "ap
        let @a=l:save_a
    endif
endfunction

" TODO|DONE: Generate all mappings for different opening modes
" TODO: Generate all functions for different opening modes

function! s:SetupMappings()
    let l:dict = {'e':'edit', 't':'tab drop', 's':'split', 'v':'vsplit'}
    for l:key in keys(l:dict)
        exec "nnoremap <Plug>(open-scratch-".l:key.") :call <SID>OpenScratch('n', '".l:dict[l:key]."')<cr>"
        exec "vnoremap <Plug>(open-scratch-visual-".l:key.") :call <SID>OpenScratch('v', '".l:dict[l:key]."')<cr>"
    endfor
endfunction
call <SID>SetupMappings()
