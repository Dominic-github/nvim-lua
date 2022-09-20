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

  -- Shell
  -- b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- python
  b.formatting.black,

  -- c/cpp/cs
  b.formatting.clang_format,

  -- Check
  b.diagnostics.markdownlint,

}


require("null-ls").setup({
  debug = true,
  sources = sources,
})
