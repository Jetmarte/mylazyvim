local function Palette()
  return {
    "roobert/palette.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("palette").setup({
        palettes = {
          main = "dust_dusk",
        },

        italics = true,
        transparent_background = false,

        custom_palettes = {
          main = {
            -- dusk theme taken from roobert/dust.nvim
            dust_dusk = {
              color0 = "#121527",
              color1 = "#1A1E39",
              color2 = "#232A4D",
              color3 = "#3E4D89",
              color4 = "#687BBA",
              color5 = "#A4B1D6",
              color6 = "#bdbfc9",
              color7 = "#DFE5F1",
              color8 = "#e9e9ed",
            },
          },
          accent = {},
          state = {},
        },
      })

      vim.cmd([[colorscheme palette]])
    end,
  }
end

return {
  Palette(),
}
