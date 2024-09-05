local ensure_installed = require("mason-lspconfig.ensure_installed")
return {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    name = "mason",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()({
        ensure_installed = { "css_variables", "cssls", "cssmodules-ls", "tailwindcss", "unocss" },
      })
    end,
  },
}
--fin
