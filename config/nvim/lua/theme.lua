local base16 = require("base16")

base16.themes["kizu-gruvbox"] = { -- Make this configurable.
  base00 = "1d2021"; base01 = "3c3836"; base02 = "504945"; base03 = "665c54";
  base04 = "bdae93"; base05 = "d5c4a1"; base06 = "ebdbb2"; base07 = "fbf1c7";
  base08 = "ea6962"; base09 = "ffc745"; base0A = "d48049"; base0B = "a9b665";
  base0C = "7daea3"; base0D = "d3869b"; base0E = "89b482"; base0F = "d65d0e";
}

base16(base16.themes["kizu-gruvbox"], true)
require "highlights"
