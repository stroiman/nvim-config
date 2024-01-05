let g:projectionist_heuristics = {}

let g:projectionist_heuristics['App.js'] = {
      \ '*.jsx': { 'command': 'src', 'alternate': '{}.test.js' },
      \ '*.js': { 'command': 'src', 'alternate': '{}.test.js' },
      \ '*.test.js': { 'command': 'test', 'alternate': ['{}.jsx', '{}.js'] }
      \ }

" Typescript settings {{{1

" DORA UI Settings
let g:projectionist_heuristics['tsconfig.json&public/index.html'] = {
      \ 'src/*.ts': { 'command': 'src', 'alternate': 'src/{}.test.ts' },
      \ 'src/ducks/*.ts': { 'command': 'duck', 'alternate': 'src/{}.test.ts' },
      \ 'src/*.tsx': { 'command': 'srcx', 'alternate': 'src/{}.test.tsx' },
      \ 'src/*.test.ts': { 
      \   'command': 'test',
      \   'alternate': 'src/{}.ts'
      \ },
      \ 'src/ducks/*.test.ts': { 
      \   'command': 'ducktest',
      \   'alternate': 'src/ducks/{}.ts' ,
      \   'template': [
      \     'import * as actions from "."',
      \     'import * as selectors from "./selectors"',
      \     ''
      \   ]
      \ },
      \ 'src/*.test.tsx': { 'command': 'testx', 'alternate': 'src/{}.tsx' },
      \ 'src/i18n/da/*.json': { 'command': 'da', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/se/*.json': { 'command': 'se', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/en/*.json': { 'command': 'en', 'alternate':[
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/de/*.json': { 'command': 'de', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/it/*.json': { 'command': 'it', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/ro/*.json': { 'command': 'ro', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] },
      \ 'src/i18n/ru/*.json': { 'command': 'ru', 'alternate': [
      \     'src/i18n/en/{}.json', 'src/i18n/de/{}.json', 'src/i18n/da/{}.json', 'src/i18n/se/{}.json',
      \     'src/i18n/it/{}.json', 'src/i18n/ru/{}.json', 'src/i18n/ro/{}.json', 
      \ ] }
      \ }

" DORA Backend settings
let g:projectionist_heuristics['tsconfig.json&knexfile.js'] = {
      \ 'src/*.ts': { 'command': 'src', 'alternate': ['test/unit/{}.test.ts', 'test/integration/{}.test.ts'] },
      \ 'test/unit/*.test.ts': { 'command': 'unit', 'alternate': 'src/{}.ts' },
      \ 'test/integration/*.test.ts': { 'command': 'ttest', 'alternate': 'src/{}.ts' }
      \ }
