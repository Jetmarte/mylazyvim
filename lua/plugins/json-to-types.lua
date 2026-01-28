-- Ejemplo usando lazy.nvim
-- ejemplo del comando ConvertJsonToLang tyescript
return {
  "redoxahmii/json-to-types.nvim",
  config = function()
    require("json-to-types").setup({})
  end,
}
