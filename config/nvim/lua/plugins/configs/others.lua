local M = {  }

M.blankline = function()
  local ok, blankline = pcall(require, "indent_blankline")
  if not ok then
    return
  end
  blankline.setup {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
      "help",
      "terminal",
      "dashboard",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "lsp-installer"
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
  }
end

M.colorizer = function()
  local ok, colorizer = pcall(require, "colorizer")
  if not ok then
    return
  end

  colorizer.setup({
    "*"; -- Highlight all files with defautls, but customize some others.
    "!NeogiStatus"; -- exclude filetype
    "!NeogitCommitMessage";
    css = { rgb_fn = true, names = true }; -- CSS rgb() and rgba() + defaults
  },{ -- defaults
      names = false,   -- "Name" codes like 'Blue'
      RGB = false,     -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      mode = 'background', -- Set the display mode.
    })
  vim.cmd "ColorizerReloadAllBuffers"
end

M.neogit = function ()
  local ok, neogit = pcall(require, "neogit")
  if not ok then
    return
  end
  neogit.setup {
    disable_signs = true,
    disable_commit_confirmation = true,
    commit_popup = { kind = "vsplit" },
    integrations = { diffview = true } -- diffview plugin
  }
end

M.neoscroll = function()
  local ok, neoscroll = pcall(require, "neoscroll")
  if not ok then
    return
  end
  neoscroll.setup {
    respect_scroll_off = true,
    hide_curor = true,
    stop_eof = true,
    cursor_scrolls_alone = false,
    easing_function = "circular"
  }
end

M.navigator = function()
  local ok, navigator = pcall(require, "Navigator")
  if not ok then
    return
  end
  navigator.setup { auto_save = 'current' }
end

M.surround = function()
  local ok, surround = pcall(require, "surround")
  if not ok then
    return
  end
  surround.setup {
    mappings_style = "surround",
    map_insert_mode = false
  }
end

M.comment = function()
  local ok, comment = pcall(require, "nvim_comment")
  if not ok then
    return
  end
  comment.setup {
    hook = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")
      if  filetype == "c" or filetype == "cpp"  then
        vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
      else
        local ts_comment = require("ts_context_commentstring.internal")
        ts_comment.update_commentstring()
      end
    end,
    comment_empty = false
  }
end

return M
