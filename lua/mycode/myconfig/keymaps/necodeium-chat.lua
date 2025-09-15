-- atajo para abrir neocodeium chat
function NeocodeIumChat()
  vim.keymap.set("n", "<leader>cn", function()
    vim.cmd("NeoCodeium chat")
  end, { desc = "Abrir NeoCodeium Chat" })
end
