local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- =======> console.log()
  s("csl", { t("console.log("), i(1, "msg"), t(")") }),
  -- =======> console.log()
  s("lorem", {
    t(
      "Lorem ipsum es un texto de relleno estándar utilizado en diseño gráfico, editorial y web para previsualizar maquetas (layouts) y tipografías antes de insertar el contenido definitivo. Se comenzó a utilizar en 1966, creado por diseñadores de Letraset y James Mosely, un bibliotecario en Londres, para crear las hojas de tipografía de Letraset."
    ),
  }),
  -- ========>()=>{}
  s("ña", {
    t("("),
    i(1, ""),
    t(")=>{"),
    i(2, ""),
    t("}"),
  }),
  -- ========>()=>{}
  s("ñf", {
    t("function "),
    i(1, "name"),
    t("("),
    i(2, ""),
    t("){"),
    i(3, ""),
    t("}"),
  }),

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
