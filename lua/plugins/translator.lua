return {
  "voldikss/vim-translator",
  config = function()
    -- ============================
    -- Configuración del plugin
    -- ============================
    vim.g.translator_target_lang = "es"
    vim.g.translator_source_lang = "auto"
    vim.g.translator_default_engines = { "google" }

    -- Configuración de ventana
    vim.g.translator_window_type = "popup"
    vim.g.translator_window_max_width = 0.6
    vim.g.translator_window_max_height = 0.6
    vim.g.translator_window_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    -- Historial deshabilitado para mejor rendimiento
    vim.g.translator_history_enable = false

    -- ============================
    -- Función auxiliar: cerrar ventanas previas
    -- ============================
    local function close_translator_windows()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.bo[buf].filetype
        if ft == "translator" then
          pcall(vim.api.nvim_win_close, win, true)
        end
      end
    end

    -- ============================
    -- Traducir palabra bajo cursor
    -- ============================
    local function translate_hover()
      close_translator_windows()
      vim.cmd("TranslateW")
    end

    -- ============================
    -- Traducir selección visual (CORREGIDO)
    -- ============================
    local function translate_selection()
      close_translator_windows()
      -- Usar feedkeys para preservar el rango visual
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":TranslateW<CR>", true, false, true), "n", false)
    end

    -- ============================
    -- Keymaps
    -- ============================
    vim.keymap.set("n", "<leader>th", translate_hover, {
      desc = "Traducir palabra bajo cursor",
      silent = true,
    })

    vim.keymap.set("v", "<leader>ts", translate_selection, {
      desc = "Traducir selección",
      silent = true,
    })

    -- Keymaps adicionales útiles
    vim.keymap.set("n", "<leader>tr", "<cmd>TranslateR<cr>", {
      desc = "Reemplazar con traducción",
      silent = true,
    })

    vim.keymap.set("v", "<leader>tr", ":TranslateR<cr>", {
      desc = "Reemplazar selección con traducción",
      silent = true,
    })

    -- ============================
    -- Autocomando: cerrar con <Esc> o q
    -- ============================
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "translator",
      callback = function()
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, silent = true })
        vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = true, silent = true })
      end,
    })
  end,
}
