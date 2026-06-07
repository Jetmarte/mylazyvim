local function Github()
  return {
    "projekt0n/github-nvim-theme",
    priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
        groups = {
          github_dark = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
            IblIndent = { fg = "#1b2230" },
            IblScope = { fg = "#30363d" },
            SnacksIndent = { fg = "#1b2230" },
            SnacksIndentScope = { fg = "#30363d" },
            NeoTreeDirectoryIcon = { fg = "#539bf5" },
            NeoTreeDirectoryName = { fg = "#539bf5" },
            NeoTreeRootName = { fg = "#539bf5", bold = true },
          },
          github_dark_dimmed = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
            IblIndent = { fg = "#1b2230" },
            IblScope = { fg = "#30363d" },
            SnacksIndent = { fg = "#1b2230" },
            SnacksIndentScope = { fg = "#30363d" },
            NeoTreeDirectoryIcon = { fg = "#539bf5" },
            NeoTreeDirectoryName = { fg = "#539bf5" },
            NeoTreeRootName = { fg = "#539bf5", bold = true },
          },
          github_dark_default = {
            NormalFloat = { bg = "#0d1117" },
            FloatBorder = { fg = "#539bf5", bg = "#0d1117" },
            FloatTitle = { fg = "#539bf5", bg = "#0d1117" },
            LazyNormal = { bg = "#0d1117" },
            MasonNormal = { bg = "#0d1117" },
            ["@keyword.return"] = { fg = "#ff80c8", bold = true },
            IblIndent = { fg = "#1b2230" },
            IblScope = { fg = "#30363d" },
            SnacksIndent = { fg = "#1b2230" },
            SnacksIndentScope = { fg = "#30363d" },
            NeoTreeDirectoryIcon = { fg = "#539bf5" },
            NeoTreeDirectoryName = { fg = "#539bf5" },
            NeoTreeRootName = { fg = "#539bf5", bold = true },
          },
        },
      })
    end,
  }
end

return {
  Github(),
}
