function Markdown()
  --markdown--
  vim.api.nvim_set_keymap("n", "<leader>mr", ":RenderMarkdown<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>mf", ":RenderMarkdownRefresh<CR>", { noremap = true, silent = true })
end
