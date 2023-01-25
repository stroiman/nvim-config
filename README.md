# Stroiman's neovim config

This is my neovim config. After having a vimconfig that had slowly evolved over
about 15 years, I decided to completely redo my neovim config from scratch.

## Inspirations

The setup here is heavily influenced by two youtube videos

[ThePrimeagen, 0 to LSP : Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

[TJ DeVries, Effective Neovim: Instant IDE](https://www.youtube.com/watch?v=stqUbv-5u2s)

Another source of inspiration is LVTHW - [Learn Vimscript the Hard
Way](https://learnvimscriptthehardway.stevelosh.com/), a source I read many
years ago.

## Shortcuts

Handy shortcuts, for configuring vim, inspired by LVTHW.
`<leader>ve` *v*imconfig *E*dit. Opens the vim configuration.
`<leader>vs` *v*imconfig *S*ource. Reruns the config scripts.
`<leader>vp` *v*imconfig *P*ackersync. Runs packersync.

## Plugins

Watching the two videos will give a good idea about what is setup here, so I
will not go into that in details. but I will describe the 'other' plugins I
use.

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

Our primary product supports two languages, Danish (da) and English (en).

I can quickly create a new language file, e.g. `:Eda settings-page` will open
`/i18n/da/settings-page.json` in a new buffer (no matter if the file exists or
not). `:Een` will jump to the corresponding English translation.

### [Unimpaired](https://github.com/tpope/vim-unimpaired) by Tim Pope.

A plugin I've used for a long time, it sets up some useful keymaps, e.g.
* `]q`/`[q` - Next/prev item in quickfix list.
* `]f`/`[f` - Next/prev file,

## Keyboard shortcuts

### Insert mode

* `jk` - Maps to `<esc>`. Much fast to type! And I never type "jk"* (LVTHW tip)

\* Except when documenting my vimscript

## Code completion

My personal preferences on how to work with completion and snippets divert from
the default configuration of most

When I type letters, numbers, dots, space, enter, parenthesis, brackets, etc. I
what the exact characters to appear on screen as I type them.

So I do NOT want completion to run on enter, space, dot, or anything like that.

I _almost_ never use the tab key though when coding, and the first editors I
used with code completion had tab as the trigger. So that's why I trigger code
completion with `<tab>`.

Many use tab key for jumping between insert points in snippet. I find This
confusing - and in earlier vim versions with vimscript, this was really
difficult to get working propertly. Therefore, I use the keys `<C-k>`/`<C-j>`
to jump forward/back between insert points in snippets.
