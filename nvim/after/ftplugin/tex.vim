if !exists("g:vim_window_id")
    let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
    sleep 200m  
    silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
    redraw!
endfunction

augroup vimtex_event_focus
    au!
    au User VimtexEventView call s:TexFocusVim()
augroup END
