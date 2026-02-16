-- Una mejor manera de ver documentación y vista previa de código además de
-- saltar a la definición de funciones
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- 🧱 Mantener siempre visible el gutter (2 columnas)
    vim.opt.signcolumn = "yes:2"

    -- ⚙️ Configuración de Lspsaga
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        title = true,
        winblend = 10,
        expand = "",
        collapse = "",
        code_action = "", -- 💡 → icono de ancho normal
        diagnostic = "", -- 🐞 → icono de ancho normal
        incoming = "",
        outgoing = "",
        colors = {
          normal_bg = "#1e1e2e",
          title_bg = "#89b4fa",
        },
      },
      hover = {
        max_width = 0.6,
        open_link = "gx",
        open_cmd = "!xdg-open",
      },
      diagnostic = {
        show_code_action = true,
        jump_num_shortcut = true,
        keys = {
          exec_action = "o",
          quit = "q",
          toggle_or_jump = "<CR>",
          quit_in_show = { "q", "<ESC>" },
        },
      },
      code_action = {
        show_server_name = true,
        extend_gitsigns = true,
      },
      symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        color_mode = true,
      },
      finder = {
        keys = {
          jump_to = "p",
          edit = { "o", "<CR>" },
          vsplit = "s",
          split = "i",
          tabe = "t",
          quit = { "q", "<ESC>" },
          close_in_preview = "<ESC>",
        },
      },
      outline = {
        win_width = 40,
        auto_preview = false,
        detail = true,
        auto_refresh = true,
        keys = {
          jump = "o",
          expand_collapse = "u",
          quit = "q",
        },
      },
    })

    -- 🧠 Atajos útiles
    local keymap = vim.keymap.set
    keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Ver documentación" })
    keymap("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "Buscar referencias" })
    keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Vista previa de definición" })
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Ir a definición" })
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Acción de código" })
    keymap("n", "<leader>a", "<cmd>Lspsaga outline<CR>", { desc = "Ver outline (símbolos)" })
  end,
}
