-- Archivo: ~/.config/nvim/lua/snippets.lua
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- Define un snippet para una función en JavaScript/TypeScript
ls.add_snippets("javascript", {
  s("fn", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, "args"),
    t(") {"),
    t({ "", "\t" }),
    i(3, "// cuerpo de la función"),
    t({ "", "}" }),
  }),
})

-- Define un snippet para React (JSX/TSX)
ls.add_snippets("typescriptreact", {
  s("rfcx", {
    t("import React from 'react';"),
    t({ "", "", "const " }),
    i(1, "ComponentName"),
    t(" = () => {"),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    i(2, "Contenido"),
    t("</div>"),
    t({ "", "\t);", "};", "", "export default " }),
    i(1),
    t(";"),
  }),
})

-- Define un snippet para React (JSX/TSX)
ls.add_snippets("typescriptreact", {
  s("rfx", {
    t({ "", "", "export default function " }),
    i(1, "ComponentName"),
    t(" () {"),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    i(2, "Contenido"),
    t("</div>"),
    t({ "", "\t);", "};", "", "" }),
  }),
})

return {}
