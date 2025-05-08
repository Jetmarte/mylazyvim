-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- ~/.config/nvim/lua/config/autocmds.lua o similar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.cmd.colorscheme("solarized-osaka")

    -- Colores personalizados para grupos de Java
    vim.cmd([[
      highlight javaType guifg=#b58900
      highlight javaClassDecl guifg=#cb4b16
      highlight javaMethodDecl guifg=#2aa198
    ]])
  end,
})
