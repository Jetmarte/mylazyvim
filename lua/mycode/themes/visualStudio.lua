local function VisualStudio()
  return {
    "askfiy/visual_studio_code",
    priority = 100,
    config = function()
      vim.cmd([[colorscheme visual_studio_code]])
      require("visual_studio_code").setup({
        -- `dark` or `light`
        mode = "dark",
        -- Whether to load all color schemes
        preset = true,
        -- Whether to enable background transparency
        transparent = false,
        -- Whether to apply the adapted plugin
        expands = {
          hop = true,
          dbui = true,
          lazy = true,
          aerial = true,
          null_ls = true,
          nvim_cmp = true,
          gitsigns = true,
          which_key = true,
          nvim_tree = true,
          lspconfig = true,
          telescope = true,
          bufferline = true,
          nvim_navic = true,
          nvim_notify = true,
          vim_illuminate = true,
          nvim_treesitter = true,
          nvim_ts_rainbow = true,
          nvim_scrollview = true,
          nvim_ts_rainbow2 = true,
          indent_blankline = true,
          vim_visual_multi = true,
        },
        hooks = {
          before = function(conf, colors, utils) end,
          after = function(conf, colors, utils) end,
        },
      })
    end,
  }
end

return {
  VisualStudio(),
}
