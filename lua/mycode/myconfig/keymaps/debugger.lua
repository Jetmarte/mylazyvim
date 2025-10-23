function Debugger()
  -- config debug dap
  -- Ejecuta/continua el programa (si está detenido, sigue desde donde quedó)
  vim.keymap.set("n", "<F8>", function()
    require("dap").continue()
  end, { desc = "DAP: Run/Continue" })

  -- Avanza a la siguiente línea sin entrar en funciones
  vim.keymap.set("n", "<F9>", function()
    require("dap").step_over()
  end, { desc = "DAP: Step Over" })

  -- Entra dentro de la función llamada en la línea actual
  vim.keymap.set("n", "<F10>", function()
    require("dap").step_into()
  end, { desc = "DAP: Step Into" })

  -- Sale de la función actual y vuelve al contexto de llamada
  vim.keymap.set("n", "<F11>", function()
    require("dap").step_out()
  end, { desc = "DAP: Step Out" })

  -- Coloca o quita un breakpoint en la línea actual
  vim.keymap.set("n", "<F7>", function()
    require("dap").toggle_breakpoint()
  end, { desc = "DAP: Toggle Breakpoint" })

  -- Crea un breakpoint condicional (pidiendo una condición al usuario)
  vim.keymap.set("n", "<F6>", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, { desc = "DAP: Conditional Breakpoint" })
end
