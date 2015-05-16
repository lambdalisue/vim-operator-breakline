if exists('g:loaded_operator_breakline') && g:loaded_operator_breakline
  finish
endif
let g:loaded_operator_breakline = 1

let s:save_cpo = &cpo
set cpo&vim

call operator#user#define(
      \ 'breakline-manual',
      \ 'operator#breakline#op_breakline_manual')
call operator#user#define(
      \ 'breakline-textwidth',
      \ 'operator#breakline#op_breakline_textwidth')

let &cpo = s:save_cpo
" vim:set et ts=2 sts=2 sw=2 tw=0 fdm=marker:
