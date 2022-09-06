-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "jellybeans", "one_light" },
  theme = "jellybeans", -- default theme
  transparency = false,
}


M.plugins = {
   user = require "custom.plugins",

   override = {
   ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
   ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
   ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
   ["goolord/alpha-nvim"] = override.alpha,
   ["williamboman/mason.nvim"] = override.mason,
   },

   status = {
     dashboard = true,
   },
 }

 M.mappings = require "custom.mappings"

return M
