return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_auto_start = 0 -- no auto preview
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
