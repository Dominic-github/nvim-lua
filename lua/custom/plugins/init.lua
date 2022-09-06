-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

   ["Pocco81/AutoSave.nvim"] = {
    module = "autosave",
    config = function()
      require("custom.plugins.smolconfigs").autosave()
    end,
  },

-- autoclose tags in html, jsx etc
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.smolconfigs").autotag()
    end,
  },

-- markdown preview
  ['iamcco/markdown-preview.nvim'] = {
    ft = 'markdown',
    run = 'cd app && yarn install'
  },

   -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ['MunifTanjim/prettier.nvim'] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

}

