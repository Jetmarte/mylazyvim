return {
  --muestra un minimapa en la derecha tipo vscode
  -- "echasnovski/mini.map",
  "nvim-mini/mini.map",
  version = "*",
  config = function()
    local map = require("mini.map")
    map.setup({
      -- Highlight integrations (none by default)
      integrations = nil,

      -- Symbols used to display data
      symbols = {
        -- Encode symbols. See `:h MiniMap.config` for specification and
        -- `:h MiniMap.gen_encode_symbols` for pre-built ones.
        -- Default: solid blocks with 3x2 resolution.
        encode = nil,

        -- Scrollbar parts for view and line. Use empty string to disable any.
        scroll_line = "█",
        scroll_view = "┃",
      },

      -- Window options
      window = {
        -- Whether window is focusable in normal way (with `wincmd` or mouse)
        focusable = true,

        -- Side to stick ('left' or 'right')
        side = "right",

        -- Whether to show count of multiple integration highlights
        show_integration_count = true,

        -- Total width
        width = 8,

        -- Value of 'winblend' option
        winblend = 25,

        -- Z-index
        zindex = 10,
      },
    })

    -- Mapeo opcional para alternar el minimapa
    vim.keymap.set("n", "<leader>mm", map.toggle, { desc = "MiniMap Toggle" })
    vim.keymap.set("n", "<leader>MM", function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "minimap" then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
      print("No se encontró el minimapa.")
    end, { desc = "Asignar foco al MiniMap" })
  end,
}
