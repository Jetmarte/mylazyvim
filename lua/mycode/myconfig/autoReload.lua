local AutoReload = {}

--- Configura la recarga automática de archivos desde disco.
-- Detecta cambios externos (git pull, otra app que guarda el archivo, etc.)
-- y recarga el buffer en Neovim sin tener que recargarlo manualmente.
-- Se omite en buffers de tipo "terminal" para no interferir con ellos.
function AutoReload.setup()
  -- Recarga el archivo automáticamente si cambió en disco
  vim.o.autoread = true
  -- Intervalo (ms) que usa Vim para comprobar cambios con CursorHold
  vim.o.updatetime = 1000

  -- Autocmd que fuerza la comprobación (checktime) en momentos clave:
  --   - FocusGained: al volver a Neovim desde otra app
  --   - BufEnter:    al entrar a un buffer
  --   - FileChangedShell: cuando el archivo se modificó fuera de Neovim
  vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "FileChangedShell" }, {
    pattern = { "*" },
    callback = function()
      if vim.bo.buftype ~= "terminal" then
        vim.cmd("checktime")
      end
    end,
  })
end

return AutoReload
