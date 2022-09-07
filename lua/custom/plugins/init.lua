-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {

  ["kyazdani42/nvim-tree.lua"] = {
  after = "nvim-web-devicons",
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
     require "custom.plugins.nvimtree"
  end,
  },

  ['kdheepak/lazygit.nvim'] = {},


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

  -- Prettier plugin for Neovim's built-in LSP client
  ['MunifTanjim/prettier.nvim'] = {
    config = function ()
      require "custom.plugins.prettier"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

}

