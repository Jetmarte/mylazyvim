-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- ~/.config/nvim/lua/config/autocmds.lua o similar

--al recuperar ultima sesion , no cargar otros buffers inutiles
vim.api.nvim_create_autocmd("BufNew", {
  callback = function()
    if vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) == "" then
      vim.bo.bufhidden = "wipe"
    end
  end,
})

-- Desactivar corrección ortográfica en markdown y texto
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- Auto-guardar buffers modificados al perder foco, cambiar de buffer o salir de Neovim.
-- Garantiza que ningún cambio se pierda sin depender de swap files.
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
  callback = function()
    if
      vim.bo.modified -- hay cambios sin guardar
      and not vim.bo.readonly
      and vim.bo.buftype == "" -- solo buffers de archivo normales
      and vim.fn.expand("%") ~= "" -- tiene nombre de archivo
      and vim.fn.filewritable(vim.fn.expand("%:p")) == 1 -- se puede escribir
    then
      vim.cmd("silent! write")
    end
  end,
})
