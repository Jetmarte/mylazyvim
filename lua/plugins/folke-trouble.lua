-- extension para mostrar diagnosticos, errores y advertencias
return {
  {
    -- interfaz para ver errores, advertencias y diagnosticos del proyecto
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {
      auto_close = true, -- cerrar automaticamente cuando no hay mas diagnosticos
      auto_preview = true, -- preview automatico al mover el cursor
      focus = true, -- enfocar la ventana de trouble al abrirla
      modes = {
        diagnostics = {
          auto_open = false, -- no abrir automaticamente
          auto_refresh = true, -- refrescar diagnosticos automaticamente
        },
        symbols = {
          win = { position = "right" },
        },
      },
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>xq",
        "<cmd>Trouble close<cr>",
        desc = "Close (Trouble)",
      },
    },
  },
}
