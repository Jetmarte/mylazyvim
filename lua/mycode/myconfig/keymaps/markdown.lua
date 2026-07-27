function Markdown()
  --markdown--
  vim.api.nvim_set_keymap("n", "<leader>mr", ":RenderMarkdown<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>mf", ":RenderMarkdownRefresh<CR>", { noremap = true, silent = true })

  -- MarkdownPreview
  vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })
end
