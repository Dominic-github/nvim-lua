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

  }
}

return M



