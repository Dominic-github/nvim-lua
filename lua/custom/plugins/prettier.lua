local present , prettier = pcall(require, "prettier")
if (not present) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "sass",
    "lua",
    "typescript",
    "typescriptreact",
    "yaml",
  }

}
