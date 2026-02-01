return {
  "voldikss/vim-translator",
  config = function()
    vim.g.translator_default_engines = { "google" }
    vim.g.translator_target_lang = "es"

    -- Usar ventana flotante independiente (no preview del LSP)
    vim.g.translator_window_type = "popup"
    vim.g.translator_window_timeout = 0
    vim.g.translator_popup_border = "rounded"
    vim.g.translator_popup_min_height = 5
    vim.g.translator_popup_min_width = 40
    vim.g.translator_popup_max_height = 20
    vim.g.translator_popup_max_width = 100

    local function close_translator_windows()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("Translator") then
          vim.api.nvim_win_close(win, true)
        end
      end
    end

    -- Hover / palabra
    local function translate_hover()
      close_translator_windows()
      vim.cmd("Translate")
    end

    -- Selección visual
    local function translate_selection()
      close_translator_windows()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":TranslateW<CR>", true, false, true), "n", false)
    end

    -- Keymaps
    vim.keymap.set("n", "<leader>th", translate_hover, { desc = "Traducir hover / palabra" })
    vim.keymap.set("v", "<leader>ts", translate_selection, { desc = "Traducir selección (ventana persistente)" })
  end,
}
