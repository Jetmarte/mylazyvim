-- Agregar la carpeta 'prompts' al package.path
package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/copilot_prompts/?.lua"

local prompts = require("copilot_prompts.myprompt")

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local function split_lines(str)
  local lines = {}
  for line in str:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end
  return lines
end

-- ===========prompt snippets ===========================
return {
  ls.add_snippets("all", {
    s("nexorem", t(split_lines(prompts.Nexorem))),
  }),
}
