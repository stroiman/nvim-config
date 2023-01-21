# Stroiman's neovim config

This is my neovim config. After having a vimconfig that had slowly evolved over
about 15 years, I decided to completely redo my neovim config from scratch.

The work here is heavily influenced by two youtube videos

[ThePrimeagen, 0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

[TJ DeVries, Effective Neovim: Instance IDO](https://www.youtube.com/watch?v=stqUbv-5u2s)

## Plugins

Watching the two videos will give 

### [Projectionist](https://github.com/tpope/vim-projectionist) by Tim Pope.

This plugin allows you to setup relationships between files. I have two primary
use cases for this.

* Quickly jump between a source file and a related test file.
* Quickly jump between different language files.

#### Jump between test and implementation

E.g. when editing `/src/api/ping.ts`, I can hit `:A` to open
`/test/unit/api/ping.test.ts`. `:AS` will open a new split, and `:AV` will open
a vertical split. `:A` jumps back to implementation

#### Jump between language files

I can quickly create a new language file, e.g. `:Eda settings-page` will open
`/i18n/da/settings-page.json` in a new buffer (no matter if the file exists or
not). `:Een` will jump to the corresponding English translation.

