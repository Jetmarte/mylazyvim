return {
  -- Indicadores de cambios git en la columna de signos + acciones de hunk
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged_enable = true,
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      -- Atajos buffer-locales: solo se activan cuando gitsigns engancha al buffer,
      -- por lo que no entran en conflicto con tus keymaps globales.
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        -- Navegación entre hunks (compatible con vim-diff: ]c / [c)
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Git: siguiente hunk")

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Git: hunk anterior")

        -- Acciones sobre hunks (prefijo <leader>g, libre en tu config)
        map("n", "<leader>gs", gs.stage_hunk, "Git: stage hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Git: reset hunk")
        map("v", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Git: stage hunk (selección)")
        map("v", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Git: reset hunk (selección)")

        map("n", "<leader>gS", gs.stage_buffer, "Git: stage buffer completo")
        map("n", "<leader>gR", gs.reset_buffer, "Git: reset buffer completo")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Git: deshacer stage hunk")

        -- Vista previa y blame
        map("n", "<leader>gp", gs.preview_hunk, "Git: preview hunk")
        map("n", "<leader>gP", gs.preview_hunk_inline, "Git: preview hunk inline")
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Git: blame línea (popup)")
        map("n", "<leader>gB", gs.toggle_current_line_blame, "Git: toggle blame virtual")

        -- Diff
        map("n", "<leader>gd", gs.diffthis, "Git: diff con index")
        map("n", "<leader>gD", function()
          gs.diffthis("~")
        end, "Git: diff con HEAD~")
        map("n", "<leader>gw", gs.toggle_word_diff, "Git: toggle word diff")
        map("n", "<leader>gl", gs.toggle_linehl, "Git: toggle highlight de líneas")

        -- Text object: ih = "in hunk"
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Git: seleccionar hunk")
      end,
    })
  end,
}
