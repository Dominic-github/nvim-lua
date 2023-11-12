local M = {}

M.general = {
  n = {
    -- go to  beginning and end 
    ["<S-H>"] = { "<ESC>^", "beginning of line" },
    ["<S-L>"] = { "<End>", "end of line" },
    ["<S-J>"] = { "5j", "move down 5 live" },
    ["K"] = { "5k", "move down 5 live" },

    ["<C-s>"] = {
      function()
        vim.lsp.buf.format { async = true }
        vim.cmd [[w]]
        vim.api.nvim_input "<ESC>"
      end,
      " Save file ",
    },


    -- Select All
    ["<C-a>"] = { "ggVG", "select all" },

    -- move line down or up
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "move line down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "move line up" },

    -- Press * to search for the term under the cursor or a visual selection and
    -- then press a key below to replace all instances of it in the current file.
    ["<leader>r"] = { ":%s///g<Left><Left>", { noremap = true, silent = true } },
    ["<leader>rc"] = { ":%s///gc<Left><Left><Left>", { noremap = true, silent = true } },

    -- Type a replacement term and press . to repeat the replace  ment again. Useful
    -- for replacing a few instances of the term (comparable to  multiple cursors).
    ["<leader>sg"] = { ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", { noremap = true, silent = true } },

    -- cut
    ["<C-x>"] = { "dd", "cut line", { noremap = true } },
  },
  i = {

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- Select All
    ["<C-a>"] = { "<ESC>ggVG", "select all" },

    ["<C-s>"] = {
      function()
        vim.lsp.buf.format { async = true }
        vim.cmd [[w]]
      end,
      " Save file ",
    },

    -- move line down or up
    ["<A-j>"] = { "<Esc><cmd> m .+1<CR>==gi", "move line down" },
    ["<A-k>"] = { "<Esc><cmd> m .-2<CR>==gi", "move line up" },
  },

  v = {

    -- go to  beginning and end
    ["<S-H>"] = { "^", "beginning of line" },
    ["<S-L>"] = { "<End>", "end of line" },
    ["<S-J>"] = { "5j", "move down 5 live" },
    ["<S-K>"] = { "5k", "move down 5 live" },

    -- Select All
    ["<C-a>"] = { "ggG", "select all" },

    -- move line down or up
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", { noremap = true } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", { noremap = true } },

    ["<C-s>"] = {
      function()
        vim.lsp.buf.format { async = true }
        vim.cmd [[w]]
      end,
      " Save file ",
    },

    -- cut
    ["<C-x>"] = { '"+d', { noremap = true } },
  },

  x = {

    ["<leader>sg"] = { '"sy:let @/=@s<CR>cgn', { noremap = true, silent = true } },
  },
}
M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

M.lazygit = {

  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>", "toggle lazygit" },
  },
}

M.gitsigns = {
  n = {
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          package.loaded.gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end,
      "next_hunk",
      { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          package.loaded.gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end,
      "prev_hunk",
      { expr = true },
    },

    ["<leader>ghs"] = { "<cmd> Gitsigns stage_hunk <CR>", "stage_hunk" },

    ["<leader>ghr"] = { "<cmd> Gitsigns reset_hunk <CR>", "reset_hunk" },

    ["<leader>ghu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "undo_stage_hunk" },

    ["<leader>ghS"] = { "<cmd> Gitsigns stage_buffer<CR>", "stage_buffer" },

    ["<leader>ghR"] = { "<cmd> Gitsigns reset_buffer <CR>", "reset_buffer" },

    ["<leader>ghp"] = { "<cmd> Gitsigns preview_hunk <CR>", "preview_hunk" },

    ["<leader>ght"] = { "<cmd> Gitsigns toggle_deleted <CR>", "toggle_deleted" },

    ["<leader>ghd"] = { "<cmd> Gitsigns diffthis <CR>", "diffthis" },
  },

  v = {

    ["<leader>ghs"] = { "<cmd> Gitsigns stage_hunk <CR>", "stage_hunk" },
    ["<leader>ghr"] = { "<cmd> Gitsigns reset_hunk <CR>", "reset_hunk" },
  },
}

return M
