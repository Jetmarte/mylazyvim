return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    -- =====================================================
    -- VERIFICACIÓN DE INSTALACIÓN
    -- =====================================================
    local ok, opencode = pcall(require, "opencode")
    if not ok then
      vim.notify("opencode.nvim no está instalado correctamente", vim.log.levels.ERROR)
      return
    end

    -- =====================================================
    -- CONFIGURACIÓN PRINCIPAL
    -- =====================================================
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        port = nil,
      },

      -- Configuración de eventos
      events = {
        enabled = true,
        reload = true,
        permissions = {
          enabled = true,
          idle_delay_ms = 1000,
        },
      },

      -- Configuración de prompts personalizados
      prompts = {
        ask_append = { prompt = "", ask = true },
        ask_this = { prompt = "@this: ", ask = true, submit = true },
        review = { prompt = "Review @this for correctness, readability and best practices", submit = true },
        test = { prompt = "Add comprehensive tests for @this including edge cases", submit = true },
        explain = { prompt = "Explain @this and its context in detail", submit = true },
        fix = { prompt = "Fix @diagnostics", submit = true },
        refactor = { prompt = "Refactor @this to improve readability and maintainability", submit = true },
        optimize = { prompt = "Optimize @this for better performance", submit = true },
        document = { prompt = "Add comprehensive documentation/comments for @this", submit = true },
        debug = { prompt = "Debug @this and explain what the issue is and how to fix it", submit = true },
        diff = { prompt = "Review the following git diff for correctness and readability: @diff", submit = true },
        implement = { prompt = "Implement @this following best practices", submit = true },
        complete = { prompt = "Complete the implementation of @this", submit = true },
        analyze = { prompt = "Analyze @this and suggest improvements", submit = true },
        simplify = { prompt = "Simplify @this while maintaining functionality", submit = true },
        unittests = { prompt = "Write unit tests for @this with proper setup and teardown", submit = true },
        integration = { prompt = "Write integration tests for @this", submit = true },
      },

      -- Configuración de ask (input)
      ask = {
        prompt = "Ask opencode: ",
        snacks = {
          icon = "󰚩 ",
          win = {
            title_pos = "left",
            relative = "cursor",
            row = -3,
            col = 0,
          },
        },
      },

      -- Configuración de select (picker)
      select = {
        prompt = "opencode: ",
        sections = {
          prompts = true,
          commands = {
            ["session.new"] = "Start a new session",
            ["session.select"] = "Select a session",
            ["session.share"] = "Share the current session",
            ["session.interrupt"] = "Interrupt the current session",
            ["session.compact"] = "Compact the current session (reduce context size)",
            ["session.undo"] = "Undo the last action in the current session",
            ["session.redo"] = "Redo the last undone action in the current session",
            ["agent.cycle"] = "Cycle the selected agent",
            ["prompt.submit"] = "Submit the current prompt",
            ["prompt.clear"] = "Clear the current prompt",
          },
          server = true,
        },
        snacks = {
          preview = "preview",
          layout = {
            preset = "vscode",
            hidden = {},
          },
        },
      },
    }

    -- Recargar buffers automáticamente cuando opencode modifica archivos
    vim.o.autoread = true
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
      callback = function()
        if vim.bo.buftype ~= "terminal" then
          vim.cmd("checktime")
        end
      end,
      desc = "Auto-reload buffers modified externally",
    })

    -- =====================================================
    -- KEYMAPS PRINCIPALES
    -- =====================================================

    -- Preguntar a opencode
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      local success, err = pcall(function()
        opencode.ask("@this: ", { submit = true })
      end)
      if not success then
        vim.notify("Error en ask: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Ask opencode about this" })

    -- Seleccionar acción de opencode
    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      local success, err = pcall(function()
        opencode.select()
      end)
      if not success then
        vim.notify("Error en select: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Select opencode action" })

    -- Toggle opencode terminal
    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      local success, err = pcall(function()
        opencode.toggle()
      end)
      if not success then
        vim.notify("Error en toggle: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Toggle opencode" })

    -- Escapar del terminal de opencode y volver al buffer de nvim
    vim.keymap.set("t", "<C-\\><C-n>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    vim.keymap.set("t", "<Esc><Esc>", function()
      vim.cmd("stopinsert")
      vim.cmd("wincmd p")
    end, { desc = "Exit opencode and focus editor" })

    -- Ctrl+H: desde opencode terminal, volver al editor (ventana izquierda)
    vim.keymap.set("t", "<C-h>", function()
      vim.cmd("stopinsert")
      vim.cmd("wincmd h")
    end, { desc = "Focus editor from opencode" })

    -- Ctrl+L: desde el editor, ir al panel de opencode
    vim.keymap.set("n", "<C-l>", function()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "terminal" and vim.api.nvim_win_get_config(win).relative == "" then
          vim.api.nvim_set_current_win(win)
          vim.cmd("startinsert")
          return
        end
      end
      vim.cmd("wincmd l")
    end, { desc = "Focus opencode panel" })

    -- Auto-entrar en terminal mode al enfocar ventana de terminal
    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
      callback = function()
        if vim.bo.buftype == "terminal" then
          vim.cmd("startinsert")
        end
      end,
      desc = "Auto-enter terminal mode on focus",
    })

    -- Iniciar opencode
    vim.keymap.set("n", "<leader>oS", function()
      local success, err = pcall(function()
        opencode.start()
      end)
      if not success then
        vim.notify("Error en start: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Start opencode" })

    -- Detener opencode
    vim.keymap.set("n", "<leader>oQ", function()
      local success, err = pcall(function()
        opencode.stop()
      end)
      if not success then
        vim.notify("Error en stop: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Stop opencode" })

    -- Seleccionar sesión
    vim.keymap.set("n", "<leader>o<CR>", function()
      local success, err = pcall(function()
        opencode.select_session()
      end)
      if not success then
        vim.notify("Error en select_session: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Select opencode session" })

    -- =====================================================
    -- OPERADORES
    -- =====================================================

    -- Operador para añadir rango a opencode
    vim.keymap.set({ "n", "x" }, "go", function()
      local success, result = pcall(function()
        return opencode.operator("@this ")
      end)
      if not success then
        vim.notify("Error en operator: " .. tostring(result), vim.log.levels.ERROR)
        return ""
      end
      return result
    end, { expr = true, desc = "Add range to opencode" })

    -- Añadir línea actual a opencode
    vim.keymap.set("n", "goo", function()
      local success, result = pcall(function()
        return opencode.operator("@this ") .. "_"
      end)
      if not success then
        vim.notify("Error en operator: " .. tostring(result), vim.log.levels.ERROR)
        return ""
      end
      return result
    end, { expr = true, desc = "Add line to opencode" })

    -- =====================================================
    -- NAVEGACIÓN EN OPENCODE
    -- =====================================================

    -- Half page up/down en la sesión de opencode
    vim.keymap.set({ "n", "t" }, "<S-C-u>", function()
      local success, err = pcall(function()
        opencode.command("session.half.page.up")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Opencode half page up" })

    vim.keymap.set({ "n", "t" }, "<S-C-d>", function()
      local success, err = pcall(function()
        opencode.command("session.half.page.down")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Opencode half page down" })

    -- =====================================================
    -- KEYMAPS DE CONTEXTO ESPECÍFICO
    -- =====================================================

    -- Preguntar con contexto de buffer completo
    vim.keymap.set({ "n", "x" }, "<leader>ob", function()
      local success, err = pcall(function()
        opencode.ask("@buffer: ", { submit = true })
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Ask about buffer" })

    -- Preguntar con contexto de diagnósticos
    vim.keymap.set({ "n", "x" }, "<leader>od", function()
      local success, err = pcall(function()
        opencode.ask("@diagnostics: ", { submit = true })
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Ask about diagnostics" })

    -- Preguntar con contexto de git diff
    vim.keymap.set({ "n", "x" }, "<leader>og", function()
      local success, err = pcall(function()
        opencode.ask("@diff: ", { submit = true })
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Ask about git diff" })

    -- =====================================================
    -- KEYMAPS DE COMANDOS RÁPIDOS
    -- =====================================================

    -- Ejecutar comando específico de opencode
    vim.keymap.set("n", "<leader>oc", function()
      vim.ui.input({ prompt = "Opencode command: " }, function(input)
        if input and input ~= "" then
          local success, err = pcall(function()
            opencode.command(input)
          end)
          if not success then
            vim.notify("Error en command: " .. tostring(err), vim.log.levels.ERROR)
          end
        end
      end)
    end, { desc = "Execute opencode command" })

    -- Prompt directo (sin submit automático)
    vim.keymap.set({ "n", "x" }, "<leader>op", function()
      local success, err = pcall(function()
        opencode.prompt("@this: ")
      end)
      if not success then
        vim.notify("Error en prompt: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Prompt opencode (no submit)" })

    -- =====================================================
    -- KEYMAPS DE PROMPTS RÁPIDOS
    -- =====================================================

    -- Review rápido
    vim.keymap.set({ "n", "x" }, "<leader>or", function()
      local success, err = pcall(function()
        opencode.prompt("Review @this for correctness and readability")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Review code" })

    -- Explicar código
    vim.keymap.set({ "n", "x" }, "<leader>oe", function()
      local success, err = pcall(function()
        opencode.prompt("Explain @this")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Explain code" })

    -- Añadir tests
    vim.keymap.set({ "n", "x" }, "<leader>oT", function()
      local success, err = pcall(function()
        opencode.prompt("Add tests for @this")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Add tests" })

    -- Fix rápido
    vim.keymap.set({ "n", "x" }, "<leader>of", function()
      local success, err = pcall(function()
        opencode.prompt("Fix @this")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Fix code" })

    -- Refactor
    vim.keymap.set({ "n", "x" }, "<leader>oR", function()
      local success, err = pcall(function()
        opencode.prompt("Refactor @this for better readability")
      end)
      if not success then
        vim.notify("Error: " .. tostring(err), vim.log.levels.ERROR)
      end
    end, { desc = "Refactor code" })

    -- =====================================================
    -- AUTOCOMANDOS
    -- =====================================================

    -- Ocultar el buffer del terminal de opencode de la lista de buffers
    vim.api.nvim_create_autocmd("TermOpen", {
      callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        if name:match("opencode") then
          vim.bo[args.buf].buflisted = false
        end
      end,
      desc = "Hide opencode terminal from buffer list",
    })

    -- Forzar redraw de la terminal opencode al redimensionar Neovim
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].filetype == "opencode_terminal" then
            -- Enviar señal de resize al proceso de terminal
            vim.api.nvim_win_call(win, function()
              vim.cmd("mode")
            end)
          end
        end
      end,
      desc = "Redraw opencode terminal on resize",
    })


    -- Autocomando para manejar eventos de opencode
    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent",
      callback = function(args)
        local data = args.data
        if data and data.type then
          -- Manejar diferentes tipos de eventos
          if data.type == "permission" then
            vim.notify("Opencode solicita permiso: " .. tostring(data.message), vim.log.levels.WARN)
          elseif data.type == "error" then
            vim.notify("Opencode error: " .. tostring(data.message), vim.log.levels.ERROR)
          elseif data.type == "reload" then
            vim.notify("Buffer recargado por opencode", vim.log.levels.INFO)
          end
        end
      end,
    })

    -- Notificación de carga exitosa
    vim.notify("opencode.nvim cargado correctamente", vim.log.levels.INFO)
  end,
}
