" if exists("g:scratch_loaded")
"     finish
" endif
" let g:scratch_loaded = 1

if !exists("g:scratches_dir")
    let g:scratches_dir = '~/.vim/vim-scratches'
endif

function! OpenScratch(mode)
    let l:ext = input("File Ext: ")
    if l:ext == ''
        let l:ext=expand("%:e")
    endif
    if a:mode == 'v'
        let l:save_a=@a
        norm! gv"ay
    endif
    exec 'tab drop '.g:scratches_dir.'/scratch.'.l:ext

    if a:mode == 'v'
        norm! "ap
        let @a=l:save_a
    endif
endfunction

" TODO: Generate all functions for different opening modes

nnoremap  <Plug>(OpenScratch) :call OpenScratch('n')<cr>
vnoremap  <Plug>(OpenScratchVisual) :call OpenScratch('v')<cr>
