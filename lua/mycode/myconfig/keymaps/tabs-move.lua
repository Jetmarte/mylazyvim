-- moverse entre dabs de buffers
function TabsMove()
  vim.keymap.set("n", "<A-i>", function()
    if vim.bo.filetype ~= "neo-tree" then
      vim.cmd("bprev")
    end
  end, { noremap = true, silent = true })

  vim.keymap.set("n", "<A-o>", function()
    if vim.bo.filetype ~= "neo-tree" then
      vim.cmd("bnext")
    end
  end, { noremap = true, silent = true })
end
