local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- console.log()
  s("csl", { t("console.log("), i(1, "msg"), t(")") }),

  -- Define un snippet para una función en JavaScript/TypeScript
  ls.add_snippets("javascript", {
    s("jfn", {
      t("function "),
      i(1, "name"),
      t("("),
      i(2, "args"),
      t(") {"),
      t({ "", "\t" }),
      i(3, "// cuerpo de la función"),
      t({ "", "}" }),
    }),
  }),
}
