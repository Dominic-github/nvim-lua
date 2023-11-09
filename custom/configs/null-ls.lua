local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.prettier, -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- golang
	b.formatting.gofmt,

	-- python
	b.formatting.black,

	-- formatting markdown
	b.formatting.mdformat,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
