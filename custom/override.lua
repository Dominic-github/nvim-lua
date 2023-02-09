-- overriding default plugin configs!
--
-- alpha
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }
local M = {}


M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "bash",
    "lua",
    "norg",
  },
  autotag = {
    enable = true,
  },
}

M.nvimtree = {
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  view = {
    -- hide_root_folder = false
  },
  sync_root_with_cwd = true,
  renderer = {
    highlight_git = true,
    group_empty = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

M.alpha = {
  header = {
    val = {


      "███████╗██████╗░███████╗██╗░░░██╗░░░░░██╗░█████╗░ ",
      "██╔════╝██╔══██╗██╔════╝╚██╗░██╔╝░░░░░██║██╔══██╗ ",
      "█████╗░░██████╔╝█████╗░░░╚████╔╝░░░░░░██║███████║ ",
      "██╔══╝░░██╔══██╗██╔══╝░░░░╚██╔╝░░██╗░░██║██╔══██║ ",
      "██║░░░░░██║░░██║███████╗░░░██║░░░╚█████╔╝██║░░██║ ",
      "╚═╝░░░░░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝ ",

    },
  },
  headerPaddingTop = { type = "padding", val = headerPadding / 2 },

}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "emmet-ls",
    "json-lsp",

    -- shell
    "shfmt",
    "shellcheck",
  },
}

return M
