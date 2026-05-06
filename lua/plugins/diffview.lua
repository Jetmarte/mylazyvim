return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview: abrir diff del repo" },
    { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Diffview: cerrar" },
    { "<leader>gvt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview: toggle panel de archivos" },
    { "<leader>gvf", "<cmd>DiffviewFocusFiles<cr>", desc = "Diffview: foco en panel de archivos" },
    { "<leader>gvr", "<cmd>DiffviewRefresh<cr>", desc = "Diffview: refrescar" },
    { "<leader>gvh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: historial del archivo actual" },
    { "<leader>gvH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: historial del repo" },
    -- Versión visual: historial de las líneas seleccionadas
    { "<leader>gvh", ":DiffviewFileHistory<cr>", mode = "v", desc = "Diffview: historial de la selección" },
  },
  opts = {
    enhanced_diff_hl = true,
    use_icons = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true,
      },
      file_history = { layout = "diff2_horizontal" },
    },
    file_panel = {
      listing_style = "tree",
      win_config = {
        position = "left",
        width = 35,
      },
    },
    file_history_panel = {
      win_config = {
        position = "bottom",
        height = 16,
      },
    },
    keymaps = {
      view = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Cerrar diffview" } },
      },
      file_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Cerrar diffview" } },
      },
      file_history_panel = {
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Cerrar diffview" } },
      },
    },
  },
}
