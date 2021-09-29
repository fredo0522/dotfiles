local theme = require("theme")
local colors = theme.colors
local dbFg = "#a89984"

-- Helper functions
local function fg(group, color)
  vim.cmd("hi " .. group .. " guifg=" .. color)
end

local function bg(group, color)
  vim.cmd("hi " .. group .. " guibg=" .. color)
end

local function fgbg(group, fgcol, bgcol)
  vim.cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

--
-- General
--
bg("LineNr", colors.bg)
fgbg("CursorLineNr", colors.base04, colors.bg)
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)
vim.cmd("hi StatusLineNC gui=underline guibg=NONE guifg=" .. colors.bgAlt)

-- Italic Comments
vim.cmd("hi Comment gui=italic")

-- Search
fgbg("Search", colors.red, colors.bg)
vim.cmd("hi Search gui=underline,bold")
vim.cmd("hi IncSearch gui=underline,bold")

-- Completition menu (Pop up)
bg("Pmenu", colors.bgAlt)
fgbg("PmenuSel", colors.bgAlt, colors.fg)

--
-- LSP
--

-- Errors
fg("LspDiagnosticsSignError", colors.red)
fg("LspDiagnosticsVirtualTextError", colors.red)
fg("LspDiagnosticsSignWarning", colors.yellow)
fg("LspDiagnosticsVirtualTextWarning", colors.yellow)

-- Info
fg("LspDiagnosticsSignInformation", colors.green)
fg("LspDiagnosticsVirtualTextInformation", colors.green)

-- Hints
fg("LspDiagnosticsSignHint", colors.magenta)
fg("LspDiagnosticsVirtualTextHint", colors.magenta)

--
-- GitSigns
--
fgbg("GitSignsAdd", colors.green, colors.bg)
fgbg("GitSignsChange", colors.blue, colors.bg)
fgbg("GitSignsChangeDelete", colors.red, colors.bg)
fgbg("GitSignsDelete", colors.red, colors.bg)

--
-- BlankIndent Lines
--
fg("IndentBlanklineChar", colors.grey)

--
-- Telescope
--
fg("TelescopeBorder", colors.bgAlt2)

--
-- Lsp neovim float window colors
--
bg("NormalFloat", colors.bgAlt)
fgbg("FloatBorder", colors.fg, colors.bgAlt)

