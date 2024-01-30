let g:vimwiki_hl_headers = 1
" let g:vimwiki_folding = 'expr'
let s:webwikipath = '~/website/'
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,div,script,a,nav'

au FileType vimwiki setlocal ts=2 sts=2 sw=2 et tw=80

let g:vimwiki_list = [
      \ {'path': '~/Documents/Knowledge graphs/Professional',
      \  'diary_rel_path': 'journals/',
      \  'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/Documents/Obsidian/Professional Vault',
      \  'diary_rel_path': 'journals/',
      \  'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/Documents/Logseq/',
      \  'diary_rel_path': 'journals/',
      \  'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/Documents/Logseq personal/',
      \  'diary_rel_path': 'journals/',
      \  'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/vimwiki/prof/', 'diary_rel_path': '',
      \ 'template_path':  '~/vimwiki/prof/templates',
      \ 'path_html': '~/vimwiki/prof/html',
      \ 'template_default': 'def_template',
      \ 'template_ext': '.html',
      \ 'list_margin': 1
      \ },
      \ {
        \ 'path': s:webwikipath,
        \ 'template_path':  s:webwikipath . 'templates',
        \ 'path_html': s:webwikipath . 'html',
        \ 'template_default': 'def_template',
        \ 'template_ext': '.html'
        \ },
        \ {'path': '~/vimwiki/personal/', 'diary_rel_path': ''},
        \ {'path': '~/vimwiki/games/', 'diary_rel_path': ''}
        \]

