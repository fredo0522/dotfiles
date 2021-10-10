local theme = require("theme")
local colors = theme.colors

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
fgbg("MatchParen", colors.bg, colors.yellow)

-- Italic Comments
vim.cmd("hi Comment gui=italic")

-- Search
fgbg("Search", colors.yellow, colors.bg)
vim.cmd("hi Search gui=bold,underline")
vim.cmd("hi IncSearch gui=bold")

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

--
-- NvimTree
--
fg("NvimTreeRootFolder", colors.green)
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.blue)
bg("NvimTreeNormal", colors.bgAlt)
bg("NvimTreeNormalNC", colors.bgAlt)
fg("NvimTreeIndentMarker", colors.fgAlt2)
fgbg("NvimTreeEndOfBuffer", colors.bgAlt, colors.bgAlt)
fgbg("NvimTreeVertSplit", colors.bg, colors.bg)
fg("NvimTreeFileDirty", colors.red)
fg("NvimTreeGitDirty", colors.red)
fg("NvimTreeGitDeleted", colors.red)
fg("NvimTreeExecFile", colors.fg)
bg("NvimTreeSignColumn", colors.bgAlt)
fgbg("NvimTreeStatusLine", colors.bg, colors.bg)
vim.cmd("hi NvimTreeStatusLineNC gui=underline guifg=" .. colors.bgAlt .. " guibg=" .. colors.bg)

