local g = vim.g
local opt = vim.opt

vim.cmd([[filetype plugin indent on]])

--
-- General options
--
g.mapleader       = " " -- Map leader is <Space>
opt.background    = "dark"
opt.cmdheight     = 1 -- More space for displaying messages
opt.cursorline    = true -- Current line highlight
opt.laststatus    = 0 -- Don't show statusline
opt.virtualedit   = "block" -- edit lines in v-block with no characters
opt.ignorecase    = true -- ignore case on '/', '?', '*', '#'
opt.smartcase     = true -- override ignore case if there is an uppercase
opt.termguicolors = true -- Use all the color palette 
opt.signcolumn    = "yes" -- show signcolumn and the number is the max signs to show
opt.mouse         = "a" -- Mouse support for neovim
opt.number        = true -- Line number
opt.hidden        = true -- Change between buffers even if I don't save the current one
opt.updatetime    = 300 -- ms to wait for trigger an event
opt.timeoutlen    = 500 -- By default timeoutlen is 1000 ms
opt.joinspaces    = false -- don't auto insert two spaces after punctuation
opt.wildmode      = { "list", "longest:full", "full" }
opt.wildignore    = { 'node_modules/*', '.git/*', '*.o', '*.pdf', '*.so', '*.rej' } -- files to ignore
opt.spelllang     = { 'en_us', 'es' } -- spell check on this languages
opt.spellsuggest  = { "best", 9 } -- best spell candidates and quantity
opt.complete = { ".", "w", "b", "u", "t", "i", "kspell" }
opt.completeopt   = { -- Options for insert mode completion.
  'menu', -- Use the pop-up menu.
  'menuone', -- Use the pop-up menu also when there is only one match.
  'noselect', -- Do not select a match if the menu appears
}

-- Viewport
opt.scrolloff     = 3 -- start scrolling 3 lines before edge of the rows viewport
opt.sidescrolloff = 3 -- start scrolling 3 lines before edge of the columns viewport
opt.splitbelow    = true -- open horizontal splits below current window
opt.splitright    = true -- open vertical splits to the right current window

-- Tabs (\t) and indentation
opt.smartindent   = true -- Makes indenting smart
opt.smarttab      = true -- Makes tabbing smarter, it will realize if you have 2 vs 4
opt.expandtab     = true -- Converts tabs to spaces
opt.autoindent    = true -- Good auto indent
opt.shiftwidth    = 2 -- Change the number of space characters inserted for indentation
opt.tabstop       = 2 -- insert 2 spaces for a tab

-- Abreviations
opt.shortmess:append('I') -- no splash screen
opt.shortmess:append('a') -- Abreviations eg. `[RO]` instead of `[readonly]`
opt.shortmess:append('c') -- avoid show extra message in completion
opt.shortmess:append('f') -- Use "(3 of 5)" instead of "(file 3 of 5)"
opt.shortmess:append('m') -- Use "[+]" instead of "[Modified]".
opt.shortmess:append('r') -- Use "[RO]" instead of "[readonly]".
opt.shortmess:append('w') -- Use "[w]", "[a]" instead of "written", "appended".
opt.diffopt:append('vertical') -- Show diffs in vertical splits

-- Folds
opt.diffopt:append('foldcolumn:0') -- don't show foldcolumn in diff view
opt.foldmethod  = "indent"
opt.foldenable = false

--
-- Characters
--
opt.joinspaces  = false -- don't autoinsert two spaces after '.', '?', '!' for join command
opt.linebreak   = true -- wrap long lines at characters in 'breakat'
opt.breakindent = true -- Indent wrap text
opt.showbreak   = '↳ ' -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3)
opt.list        = true -- show whitespace and everything on the listchars
opt.listchars   = {
  nbsp     = '⦸',
  extends  = '»',
  precedes = '«',
  tab      = "▸ ",
  trail    = '•'
}
opt.fillchars   = {
  diff = '∙', -- BULLET OPERATOR (U+2219)
  eob  = ' ', -- NO-BREAK SPACE (U+00A0) to suppress ~ at EndOfBuffer
  fold = '·', -- MIDDLE DOT (U+00B7)
  vert = '┃', -- BOX DRAWINGS HEAVY VERTICAL (U+2503)
}
