local present, null_ls = pcall(require, "null-ls")
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,

  -- prettierd
  b.formatting.prettierd,

  -- Lua
  -- i'm using sumeko lua
  -- b.formatting.stylua,

  -- golang
  b.formatting.gofmt,

  -- Shell
  b.formatting.shfmt,

  -- python
  b.formatting.black,

  -- c/cpp/cs
  b.formatting.clang_format,

  -- Check
  -- b.diagnostics.markdownlint,

  -- formatting markdown
  b.formatting.mdformat

}


require("null-ls").setup({
  debug = true,
  sources = sources,
})
