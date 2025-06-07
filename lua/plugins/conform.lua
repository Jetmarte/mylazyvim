return {
  {
    -- Formatear con prettier
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        markdown = { "prettier" },
        jsx = { "prettier" }, -- Agregado soporte para JSX
        tsx = { "prettier" }, -- Agregado soporte para TSX
      },
    },
  },
}
