return {
  "voldikss/vim-translator",
  -- Carga perezosa: no carga el plugin hasta que lo uses
  cmd = { "Translate", "TranslateW", "TranslateR", "TranslateX" },
  keys = {
    { "<leader>th", mode = "n", desc = "Traducir palabra bajo cursor" },
    { "<leader>ts", mode = "v", desc = "Traducir selección visual" },
    { "<leader>tr", mode = { "n", "v" }, desc = "Reemplazar con traducción" },
  },

  -- Configuración global: se ejecuta antes de cargar el plugin
  init = function()
    vim.g.translator_target_lang = "es"
    vim.g.translator_source_lang = "auto"
    vim.g.translator_default_engines = { "google" }

    vim.g.translator_window_type = "popup"
    vim.g.translator_window_max_width = 0.6
    vim.g.translator_window_max_height = 0.6
    vim.g.translator_window_borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    vim.g.translator_history_enable = false
  end,

  config = function()
    local function close_translator_windows()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ok, ft = pcall(vim.api.nvim_get_option_value, "filetype", { buf = buf })
        if ok and ft == "translator" then
          pcall(vim.api.nvim_win_close, win, true)
        end
      end
    end

    -- Traducir palabra bajo cursor
    vim.keymap.set("n", "<leader>th", function()
      close_translator_windows()
      vim.cmd("TranslateW")
    end, { desc = "Traducir palabra bajo cursor", silent = true })

    -- Traducir selección visual
    -- Se usa feedkeys para preservar el rango visual del modo selección
    vim.keymap.set("v", "<leader>ts", function()
      close_translator_windows()
      local keys = vim.api.nvim_replace_termcodes(":TranslateW<CR>", true, false, true)
      vim.api.nvim_feedkeys(keys, "n", false)
    end, { desc = "Traducir selección visual", silent = true })

    -- Reemplazar con traducción
    vim.keymap.set("n", "<leader>tr", "<cmd>TranslateR<cr>", { desc = "Reemplazar con traducción", silent = true })
    vim.keymap.set("v", "<leader>tr", ":TranslateR<cr>", { desc = "Reemplazar selección con traducción", silent = true })

    -- Cerrar ventanas del traductor con q o Esc
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "translator",
      callback = function(args)
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
        vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = args.buf, silent = true })
      end,
    })
  end,
}
