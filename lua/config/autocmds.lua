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

-- ~/.config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceLoadPost",
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local name = vim.api.nvim_buf_get_name(buf)
      if name == "" or name == "/nvim" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})
