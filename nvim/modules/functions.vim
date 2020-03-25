" ------------------------------------------------------------ Functions
function! BuildQuickfixList(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function! CreateCenteredFloatingWindow(col_pad, row_pad)
    let width = min([&columns - 4, max([80, &columns - a:col_pad])])
    let height = min([&lines - 4, max([20, &lines - a:row_pad])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
          wincmd v
      else
          wincmd s
      endif
    exec "wincmd ".a:key
    endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Find out if we are in a git repo
" Based on https://github.com/junegunn/fzf.vim/blob/master/autoload/fzf/vim.vim#L500
function! Is_git_repo() abort
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? 0 : 1
endfunction

" Execute the fzf.vim "GFiles" command, or the "Files" command, if we're not
" in a git repo.
function! FilesOrGFiles() abort
  if Is_git_repo()
    exec 'GFiles'
  else
    exec 'Files'
  endif
endfunction
