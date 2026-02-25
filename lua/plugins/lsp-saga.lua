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
    -- Mantener siempre visible el gutter (2 columnas)
    vim.opt.signcolumn = "yes:2"

    require("lspsaga").setup({
      ui = {
        border = "rounded",
        title = true,
        expand = "",
        collapse = "",
        code_action = "",
      },
      hover = {
        max_width = 0.6,
        max_height = 0.8,
        open_link = "gx",
        open_cmd = "!xdg-open",
      },
      diagnostic = {
        show_layout = "float",
        jump_num_shortcut = true,
        auto_preview = false,
        max_width = 0.8,
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
        num_shortcut = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
        debounce = 10,
        sign_priority = 40,
      },
      symbol_in_winbar = {
        enable = true,
        separator = "  ",
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        color_mode = true,
      },
      finder = {
        max_height = 0.5,
        left_width = 0.4,
        default = "ref+imp",
        keys = {
          shuttle = "[w",
          toggle_or_open = "o",
          vsplit = "s",
          split = "i",
          tabe = "t",
          quit = "q",
          close = "<C-c>k",
        },
      },
      definition = {
        width = 0.6,
        height = 0.5,
        keys = {
          edit = "<C-o>",
          vsplit = "<C-v>",
          split = "<C-x>",
          tabe = "<C-t>",
          quit = "q",
          close = "<ESC>",
        },
      },
      outline = {
        win_position = "right",
        win_width = 40,
        auto_preview = false,
        detail = true,
        auto_close = true,
        close_after_jump = false,
        keys = {
          toggle_or_jump = "o",
          quit = "q",
          jump = "e",
        },
      },
      scroll_preview = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
      },
      rename = {
        in_select = true,
        auto_save = false,
        keys = {
          quit = "<C-k>",
          exec = "<CR>",
        },
      },
    })

    -- Atajos útiles
    local keymap = vim.keymap.set
    local opts = function(desc)
      return { desc = desc, silent = true }
    end
    keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opts("Ver documentación"))
    keymap("n", "gr", "<cmd>Lspsaga finder<CR>", opts("Buscar referencias"))
    keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts("Vista previa de definición"))
    keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts("Ir a definición"))
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts("Acción de código"))
    -- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts("Lspsaga outline"))
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts("Renombrar símbolo"))
    keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts("Diagnóstico anterior"))
    keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts("Diagnóstico siguiente"))
    keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts("Diagnósticos de línea"))
  end,
}
