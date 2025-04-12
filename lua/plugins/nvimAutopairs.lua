-- inseratar automaticamente los pares de caracteres-- Instalar nvim-autopairs
return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup()
  end,
}
