local colors = require("colors")
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
bg("SignColumn", colors.bg)
bg("VertSplit", colors.bg)
fg("EndOfBuffer", colors.bg)
vim.cmd("hi StatusLineNC gui=underline guibg=NONE guifg=" .. colors.bgAlt)

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
-- Dashboard
--
fg("DashboardHeader", dbFg)
fg("DashboardCenter", dbFg)
fg("DashboardShortcut", dbFg)
fg("DashboardFooter", dbFg)

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
fg("IndentBlanklineContextChar", colors.grey)
fg("IndentBlanklineSpaceChar", colors.grey)
fg("IndentBlanklineSpaceCharBlankline", colors.grey)

--
-- NvimTree
--
fg("NvimTreeFolderIcon", colors.blue)
fg("NvimTreeFolderName", colors.blue)
fg("NvimTreeOpenedFolderName", colors.blue)
fg("NvimTreeEmptyFolderName", colors.blue)
fg("NvimTreeFileDirty", colors.red)
fg("NvimTreeExecFile", colors.fg)
fg("NvimTreeGitDirty", colors.red)
fg("NvimTreeRootFolder", colors.blue)
fg("NvimTreeIndentMarker", colors.fgAlt2)
bg("NvimTreeNormal", colors.bgAlt)
fgbg("NvimTreeVertSplit", colors.bg, colors.bg)
fgbg("NvimTreeStatusLine", colors.bg, colors.bg)
fgbg("NvimTreeEndOfBuffer", colors.bgAlt, colors.bgAlt)
vim.cmd("hi NvimTreeStatusLineNC gui=underline guifg=" .. colors.bgAlt .. " guibg=" .. colors.bg)

