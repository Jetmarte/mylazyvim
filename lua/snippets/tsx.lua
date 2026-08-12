local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local ob = "\123" -- {
local cb = "\125" -- }

return {
  -- =======> Componente de React (function) con export default
  s("rfc", {
    t("export default function "),
    i(1, "Component"),
    t("(" .. ob .. " "),
    i(2, "props"),
    t(" }: "),
    i(3, "Component"),
    t("Props)" .. ob),
    t({ "", "\t" }),
    i(4, "// lógica"),
    t({ "", "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t" }),
    i(5, "// contenido"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", cb }),
    t({ "", "", "" }),
    t("interface "),
    i(3),
    t("Props" .. ob),
    t({ "", "\t" }),
    i(6, ""),
    t({ "", cb }),
  }),

  -- =======> Componente de React (function) con export default
  s("rfce", {
    t("import React from 'react'"),
    t({ "", "" }),
    t({ "", "export default function " }),
    i(1, "Component"),
    t("(" .. ob .. " "),
    i(2, "props"),
    t(" }: "),
    i(3, "Component"),
    t("Props)" .. ob),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t" }),
    i(4, "// contenido"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", cb }),
  }),

  -- =======> Componente de React (arrow) con export const
  s("rafe", {
    t("import React from 'react'"),
    t({ "", "" }),
    t({ "", "const " }),
    i(1, "Component"),
    t(" = () => " .. ob),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t" }),
    i(2, "// contenido"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", cb }),
    t({ "", "" }),
    t({ "", "export default " }),
    i(1),
  }),

  -- =======> Componente de Next.js App Router
  s("npage", {
    t("import Link from 'next/link'"),
    t({ "", "" }),
    t({ "", "export default function Page() " .. ob }),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t" }),
    i(1, "// contenido de la página"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", cb }),
  }),

  -- =======> Componente de Next.js con "use client"
  s("nclient", {
    t('"use client"'),
    t({ "", "" }),
    t({ "", "export default function " }),
    i(1, "Component"),
    t("() " .. ob),
    t({ "", "\t" }),
    i(2, "// lógica del cliente"),
    t({ "", "\treturn (" }),
    t({ "", "\t\t<div>" }),
    t({ "", "\t\t\t" }),
    i(3, "// contenido"),
    t({ "", "\t\t</div>" }),
    t({ "", "\t)" }),
    t({ "", cb }),
  }),

  -- =======> getServerSideProps (Pages Router)
  s("gssp", {
    t("export async function getServerSideProps(context) " .. ob),
    t({ "", "\t" }),
    i(1, "// lógica del servidor"),
    t({ "", "\treturn " .. ob }),
    t({ "", "\t\tprops: " .. ob }),
    t({ "", "\t\t\t" }),
    i(2, ""),
    t({ "", "\t\t" .. cb }),
    t({ "", "\t" .. cb }),
    t({ "", cb }),
  }),

  -- =======> getStaticProps (Pages Router)
  s("gsp", {
    t("export async function getStaticProps() " .. ob),
    t({ "", "\t" }),
    i(1, "// lógica del servidor"),
    t({ "", "\treturn " .. ob }),
    t({ "", "\t\tprops: " .. ob }),
    t({ "", "\t\t\t" }),
    i(2, ""),
    t({ "", "\t\t" .. cb }),
    t({ "", "\t" .. cb }),
    t({ "", cb }),
  }),

  -- =======> useState
  s("us", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    i(1),
    t("] = useState("),
    i(2, "initialValue"),
    t(")"),
  }),

  -- =======> useState con tipo
  s("ust", {
    t("const ["),
    i(1, "state"),
    t(", set"),
    i(1),
    t("] = useState<"),
    i(2, "Type"),
    t(">("),
    i(3, ""),
    t(")"),
  }),

  -- =======> useEffect
  s("ue", {
    t("useEffect(() => " .. ob),
    t({ "", "\t" }),
    i(1, "// efecto"),
    t({ "", "" }),
    t("}, ["),
    i(2, "dependencies"),
    t("])"),
  }),

  -- =======> useRef
  s("ur", {
    t("const "),
    i(1, "ref"),
    t(" = useRef<"),
    i(2, "HTMLDivElement"),
    t(">(null)"),
  }),

  -- =======> useCallback
  s("ucb", {
    t("const "),
    i(1, "fn"),
    t(" = useCallback(("),
    i(2, "args"),
    t(") => " .. ob),
    t({ "", "\t" }),
    i(3, "// lógica"),
    t({ "", "" }),
    t("}, ["),
    i(4, "dependencies"),
    t("])"),
  }),

  -- =======> useMemo
  s("um", {
    t("const "),
    i(1, "memo"),
    t(" = useMemo(() => " .. ob),
    t({ "", "\t" }),
    i(2, "// lógica"),
    t({ "", "\treturn " }),
    i(3, "value"),
    t({ "", "" }),
    t("}, ["),
    i(4, "dependencies"),
    t("])"),
  }),

  -- =======> useReducer
  s("usr", {
    t("const ["),
    i(1, "state"),
    t(", dispatch] = useReducer("),
    i(2, "reducer"),
    t(", "),
    i(3, "initialState"),
    t(")"),
  }),

  -- =======> interface de props
  s("intp", {
    t("interface "),
    i(1, "Component"),
    t("Props" .. ob),
    t({ "", "\t" }),
    i(2, "prop"),
    t(": "),
    i(3, "Type"),
    t({ "", cb }),
  }),

  -- =======> Next.js Link
  s("nlink", {
    t("import Link from 'next/link'"),
    t({ "", "" }),
    t(""),
    t({ "", "<Link href=" .. ob }),
    i(1, "path"),
    t(cb .. ">"),
    i(2, "texto"),
    t("</Link>"),
  }),

  -- =======> Next.js Image
  s("nimg", {
    t("import Image from 'next/image'"),
    t({ "", "" }),
    t(""),
    t({ "", "<Image src=" .. ob }),
    i(1, "url"),
    t(cb .. " alt=" .. ob),
    i(2, "alt"),
    t(cb .. " width=" .. ob),
    i(3, "width"),
    t(cb .. " height=" .. ob),
    i(4, "height"),
    t(cb .. " />"),
  }),

  -- =======> useRouter de Next.js
  s("nrouter", {
    t("import { useRouter } from 'next/navigation'"),
    t({ "", "" }),
    t(""),
    t({ "", "const router = useRouter()" }),
  }),

  -- =======> Fragment
  s("fr", {
    t("<>"),
    t({ "", "\t" }),
    i(1, "// contenido"),
    t({ "", "</>" }),
  }),
}
