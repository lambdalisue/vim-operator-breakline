function! s:breakline(n, motion_wiseness) abort
  if a:n > 0
    let v = operator#user#visual_command_from_wise_name(a:motion_wiseness)
    silent execute printf('silent normal! `[%s`]"', v)
    silent execute printf(":'<,'>s/.\\{%s}\\zs/\\r/g", a:n)
  endif
endfunction

function! s:breakline_manual(motion_wiseness) abort
  redraw
  let n = input('Please input the number of characters allowed in a single line: ', 80)
  if empty(n)
    redraw
    echohl WarningMsg
    echo 'The operation has canceled by user.'
    echohl None
  else
    call s:breakline(n, a:motion_wiseness)
  endif
endfunction

function! s:breakline_textwidth(motion_wiseness) abort
  call s:breakline(&textwidth, a:motion_wiseness)
endfunction

function! operator#breakline#op_breakline_manual(motion_wiseness) abort
  call s:breakline_manual(a:motion_wiseness)
endfunction

function! operator#breakline#op_breakline_textwidth(motion_wiseness) abort
  call s:breakline_textwidth(a:motion_wiseness)
endfunction
