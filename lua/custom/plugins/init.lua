-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {

  ['dsznajder/vscode-es7-javascript-react-snippets'] = {
    run = 'yarn install --frozen-lockfile && yarn compile'
  },

  ['tpope/vim-surround'] = {},

  ['lewis6991/gitsigns.nvim'] = {
    requires = { 'nvim-lua/plenary.nvim' },
    config = "require('custom.plugins.gitsigns')",
    event = "BufRead"
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
    run = 'cd app && yarn install',
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- get highlight group under cursor
  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require("nvim-treesitter.configs").setup()
    end,
  },

  ['wakatime/vim-wakatime'] = {},

}
