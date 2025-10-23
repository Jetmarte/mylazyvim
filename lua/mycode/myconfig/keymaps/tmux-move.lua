function TmuxMove()
  -- Keybindings para moverse entre splits y paneles
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", opts)
  vim.keymap.set("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<cr>", opts)
  vim.keymap.set("n", "<C-k>", "<cmd>lua require('tmux').move_top()<cr>", opts)
  vim.keymap.set("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", opts)
end
