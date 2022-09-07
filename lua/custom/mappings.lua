local M = {}

M.general = {
  n = {

    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- Select All 
    ["<C-a>"] = { "ggVG", "select all" },

    -- move line down or up
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "move line down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "move line up" },

     -- Press * to search for the term under the cursor or a visual selection and
     -- then press a key below to replace all instances of it in the current file.
    ["<leader>r"] = { ":%s///g<Left><Left>", { noremap = true, silent = true } },
    ["<leader>rc"] = { ":%s///gc<Left><Left><Left>", { noremap = true, silent = true } },

    -- Type a replacement term and press . to repeat the replace    ment again. Useful
    -- for replacing a few instances of the term (comparable to     multiple cursors).
    ["<leader>sg"] = {":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn", { noremap = true, silent = true }}

  },
  i = {

     -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- Select All 
    ["<C-a>"] = { "<ESC>ggVG" , "select all"  },

    -- move line down or up
    ["<A-j>"] = { "<Esc><cmd> m .+1<CR>==gi", "move line down" },
    ["<A-k>"] = { "<Esc><cmd> m .-2<CR>==gi", "move line up" },

  },

  v = {

     -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },

    -- Select All 
    ["<C-a>"] = { "ggG", "select all" },


    -- move line down or up
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", { noremap=true } },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", { noremap=true } },


    -- cut
    ["<C-x>"] = { '"+d', { noremap=true } },


  },

  x = {

    ["<leader>sg"] = {'"sy:let @/=@s<CR>cgn', { noremap = true, silent = true }}
  }
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

M.nvterm = {

  n = {
    ["<leader>lz"] = {
      function()
        require("nvterm.terminal").send("lazygit", "float")
      end,
      "nvterm lazygit",

    },

  },

}




return M



