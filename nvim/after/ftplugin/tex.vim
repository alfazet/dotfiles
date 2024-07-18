if !exists("g:vim_window_id")
    let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
    sleep 200m  
    silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
    redraw!
endfunction

function! TexNewFig() abort
    let l:name = ""
    call inputsave()
    let l:name = input("Figure name: ")
    call inputrestore()
    if match(l:name, "\s\+") != -1 || strlen(l:name) == 0 
        return
    endif
    let l:name = substitute(l:name, " ", "-", "g")
    let l:name = substitute(l:name, "\t", "-", "g")
    let l:buf_path = expand("%:p:h") . "/"
    silent execute "!inkman " . l:buf_path . " figures create " . l:name
endfunction

function! TexEditFig() abort
    let l:buf_path = expand("%:p:h") . "/"
    silent execute "!inkman " . l:buf_path . " figures edit "
endfunction

nnoremap <leader>af <Cmd>call TexNewFig()<CR>
nnoremap <leader>ef <Cmd>call TexEditFig()<CR>

augroup vimtex_event_focus
    au!
    au User VimtexEventView call s:TexFocusVim()
augroup END
