local bufferline = require("bufferline")
local theme = require("theme")
local colors = theme.colors

bufferline.setup {
  options = {
    offsets = {{ filetype = "NvimTree", text = "", padding = 1, highlight = "Directory" }},
    indicator_icon = "",
    modified_icon = "",
    show_close_icon = false,
    show_buffer_close_icons = false,

    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
  },
  highlights = {
    background = {
      guifg = colors.fgAlt2,
      guibg = colors.bg,
    },
    fill = {
      guifg = colors.fgAlt,
      guibg = colors.bg
    },

    -- Buffer
    buffer_visible = {
      guifg = colors.fgAlt2,
      guibg = colors.bgAlt
    },
    buffer_selected = {
      guifg = colors.fgAlt,
      guibg = colors.bgAlt2,
      gui = "bold"
    },

    -- Modified
    modified = {
      guifg = colors.red,
      guibg = colors.bg
    },
    modified_selected = {
      guifg = colors.red,
      guibg = colors.bgAlt2
    },
    modified_visible = {
      guifg = colors.red,
      guibg = colors.bgAlt
    },
    indicator_selected = {
      guifg = colors.fgAlt2,
      guibg = colors.bg
    },

    -- Separator
    separator = {
      guifg = colors.bg,
      guibg = colors.bg
    },
  }
}
