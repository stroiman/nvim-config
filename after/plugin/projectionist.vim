let g:projectionist_heuristics = {}

let g:projectionist_heuristics['App.js'] = {
      \ '*.jsx': { 'command': 'src', 'alternate': '{}.test.js' },
      \ '*.js': { 'command': 'src', 'alternate': '{}.test.js' },
      \ '*.test.js': { 'command': 'test', 'alternate': ['{}.jsx', '{}.js'] }
      \ }

" Typescript settings {{{1

let g:projectionist_heuristics['tsconfig.json'] = {
      \ 'src/*.ts': { 'command': 'src', 'alternate': ['test/unit/{}.test.ts', 'test/integration/{}.test.ts'] },
      \ 'src/*.tsx': { 'command': 'srcx', 'alternate': 'src/{}.test.tsx' },
      \ 'src/*.test.tsx': { 'command': 'testx', 'alternate': 'src/{}.tsx' },
      \ 'test/unit/*.test.ts': { 'command': 'unit', 'alternate': 'src/{}.ts' },
      \ 'test/integration/*.test.ts': { 'command': 'ttest', 'alternate': 'src/{}.ts' },
      \ 'src/i18n/da/*.json': { 'command': 'da', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json'
      \ ] },
      \ 'src/i18n/se/*.json': { 'command': 'se', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json'
      \ ] },
      \ 'src/i18n/en/*.json': { 'command': 'en', 'alternate':[
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json'
      \ ] },
      \ 'src/i18n/de/*.json': { 'command': 'de', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json'
      \ ] }
      \ }
