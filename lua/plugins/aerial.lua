return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },
    layout = { min_width = 30 },
    show_guides = true,
    -- Mostrar TODO tipo de símbolo
    filter_kind = false,

    -- Personalizar qué tipos mostrar
    -- Aquí incluyo constantes, variables y funciones anónimas
    -- que suelen mapearse como "Variable", "Constant" o "Function"
    icons = {
      Class = "ﴯ ",
      Constant = " ",
      Function = " ",
      Variable = " ",
      Method = " ",
      Property = " ",
      Field = " ",
      Module = " ",
      Namespace = " ",
      Interface = " ",
      Struct = "פּ ",
      Enum = " ",
      EnumMember = " ",
      TypeParameter = " ",
      Operator = " ",
      File = " ",
      Key = " ",
    },
  },
  config = function(_, opts)
    require("aerial").setup(opts)

    -- Atajo para abrir/cerrar outline
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Toggle symbols outline" })
  end,
}
