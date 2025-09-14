local function EverGarden()
  return {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    config = function()
      require("evergarden").setup({
        theme = {
          variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
          accent = "green",
        },
        editor = {
          transparent_background = false,
          override_terminal = true,
          sign = { color = "none" },
          float = {
            color = "mantle",
            invert_border = false,
          },
          completion = {
            color = "surface0",
          },
        },
        style = {
          tabline = { "reverse" },
          search = { "italic", "reverse" },
          incsearch = { "italic", "reverse" },
          types = { "italic" },
          keyword = { "italic" },
          comment = { "italic" },
          spell = {},
          diagnostics = { "italic" },
          todo = { "italic" },
          treesitter_context = { "italic" },
          treesitter_context_top = { "italic" },
          treesitter_context_bottom = { "italic" },
          treesitter_context_side = { "italic" },
        },
        overrides = {
          ["@keyword.return"] = { fg = "#ea5206", bold = true }, -- const en color base (fg)
          ["@keyword.const"] = { fg = "#D3C6AA", bold = true }, -- const en color base (fg)
          ["@variable"] = { fg = "#7FBBB3" }, -- variables locales → azul
          ["@variable.builtin"] = { fg = "#E67E80", italic = true }, -- document, window → rojo
          ["@property"] = { fg = "#DBBC7F" }, -- querySelector → amarillo
          ["@function.method"] = { fg = "#E69875" }, -- métodos de objeto → naranja
          ["@string"] = { fg = "#A7C080" }, -- strings → verde
        },
        color_overrides = {},
        {
          integrations = {
            blink_cmp = true,
            cmp = true,
            fzf_lua = true,
            gitsigns = true,
            indent_blankline = { enable = true, scope_color = "green" },
            mini = {
              enable = true,
              animate = true,
              clue = true,
              completion = true,
              cursorword = true,
              deps = true,
              diff = true,
              files = true,
              hipatterns = true,
              icons = true,
              indentscope = true,
              jump = true,
              jump2d = true,
              map = true,
              notify = true,
              operators = true,
              pick = true,
              starters = true,
              statusline = true,
              surround = true,
              tabline = true,
              test = true,
              trailspace = true,
            },
            nvimtree = true,
            rainbow_delimiters = true,
            symbols_outline = true,
            telescope = true,
            which_key = true,
            neotree = true,
          },
        },
      })
    end,
    opts = {
      theme = {
        variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          invert_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  }
end

return {
  EverGarden(),
}
