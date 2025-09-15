function WindowPicker()
  vim.keymap.set("n", "<leader>ñ", function()
    local picked = require("window-picker").pick_window({
      hint = "floating-big-letter",
    })
    if picked and vim.api.nvim_win_is_valid(picked) then
      vim.api.nvim_set_current_win(picked)
    else
      vim.notify("No se seleccionó ninguna ventana", vim.log.levels.WARN)
    end
  end, { desc = "Elegir ventana con Window Picker" })
end
