# vim-scratch
A quick way to create scratch files for any filetype as you work.

## Installation & Configuration

Using vim plug add the following to your `.vimrc` or `init.nvim`

```vim
Plug 'aareman/vim-scratch'
```

Then run
```vim
:PlugInstall<cr>
```

To configure the plugin please specify a `vim-scratch` directory in your config file
```vim
let g:scratches_dir = path/to/scratches
```
You can set it to whatever you want. The default it `~/.vim/vim-scratches`. **You must have the directory created or vim will throw an error**⚠

## How to use

### Normal Mode

In normal mode trigger the mapping and vim will prompt you for a file extension (ie. `js`) enter it and press `<cr>` vim will open a scratch file called `scratch.<EXT>` in the directory. You can do it for any file extension, the key idea is that all your syntax plugins, REPLs, etc. will be accessible from that new file.

If you don't enter a filetype (ie. you press `<cr>` without entering an extension, the plugin will open a file of the current file's extension)

You can only have one file per extension, but they will be shared between projects. In the future there may be a feature to have project local scratches as well as more than one per filetype... 🚀

### Visual Mode

Same as normal mode, but it will automatically paste a copy of your selection into the new file appending it to the buffer.

This plugin provides key mappings for

## Keymappings

```vim
" e = open in current buffer
" s = open in horizontal split
" v = open in vertical split
" t = open in tab (will use tabdrop so if you have 
"     it open already it will jump to that tab instead)

"Normal Mode Mappings
<Plug>(open-scratch-e)
<Plug>(open-scratch-s)
<Plug>(open-scratch-v)
<Plug>(open-scratch-t)

" Visual Mode Mappings
<Plug>(open-scratch-visual-e)
<Plug>(open-scratch-visual-s)
<Plug>(open-scratch-visual-v)
<Plug>(open-scratch-visual-t)
```

