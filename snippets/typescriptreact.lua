local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Define un snippet para React (JSX/TSX)
  ls.add_snippets("typescriptreact", {
    s("nextCompFunction", {
      t({ "", "", "export default function " }),
      i(1, "ComponentName"),
      t(" () {"),
      t({ "", "\treturn (" }),
      t({ "", "\t\t<div>" }),
      i(2, "Contenido"),
      t("</div>"),
      t({ "", "\t);", "};", "", "" }),
    }),
  }),
  -- Define un snippet para React (JSX/TSX)
  ls.add_snippets("typescriptreact", {
    s("nextcompArrow", {
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
  }),
}
