-- moverse entre dabs de buffers
function TabsMove()
  vim.api.nvim_set_keymap("n", "<A-i>", ":bprev<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<A-o>", ":bnext<CR>", { noremap = true, silent = true })
end
