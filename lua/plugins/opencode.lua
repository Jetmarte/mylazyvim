return {
  "NickvanDyke/opencode.nvim",
  cmd = "Opencode",
  keys = {
    { "<leader>oa", desc = "Ask opencode about this", mode = { "n", "x" } },
    { "<leader>os", desc = "Select opencode action", mode = { "n", "x" } },
    { "<leader>ot", desc = "Toggle opencode", mode = { "n", "t" } },
    { "<leader>oS", desc = "Start opencode" },
    { "<leader>oQ", desc = "Stop opencode" },
    { "<leader>o<CR>", desc = "Select opencode session" },
    { "go", desc = "Add range to opencode", mode = { "n", "x" } },
    { "goo", desc = "Add line to opencode" },
    { "<leader>ob", desc = "Ask about buffer", mode = { "n", "x" } },
    { "<leader>od", desc = "Ask about diagnostics", mode = { "n", "x" } },
    { "<leader>og", desc = "Ask about git diff", mode = { "n", "x" } },
    { "<leader>oc", desc = "Execute opencode command" },
    { "<leader>op", desc = "Prompt opencode (no submit)", mode = { "n", "x" } },
    { "<leader>or", desc = "Review code", mode = { "n", "x" } },
    { "<leader>oe", desc = "Explain code", mode = { "n", "x" } },
    { "<leader>oT", desc = "Add tests", mode = { "n", "x" } },
    { "<leader>of", desc = "Fix code", mode = { "n", "x" } },
    { "<leader>oR", desc = "Refactor code", mode = { "n", "x" } },
  },
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

    local config_ok, opencode_config = pcall(require, "opencode.config")
    if not config_ok then
      vim.notify("No se pudo cargar opencode.config", vim.log.levels.ERROR)
      return
    end

    -- =====================================================
    -- CONFIGURACIÓN PRINCIPAL
    -- =====================================================
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Puerto personalizado (nil = auto-detectar)
      port = nil,

      -- Proveedor de terminal integrado
      provider = {
        -- Usar 'snacks' si está disponible, 'terminal' como fallback
        enabled = "snacks",
        
        -- Comando base para iniciar opencode
        cmd = "opencode --port",
        
        -- Configuración del proveedor snacks
        snacks = {
          auto_close = true, -- Cerrar terminal cuando opencode termina
          win = {
            position = "right",
            width = 0.35,
            enter = false, -- Mantener foco en el editor
            wo = {
              winbar = "",        -- Sin winbar
              number = false,     -- Sin números de línea
              relativenumber = false,
              signcolumn = "no",  -- Sin columna de signos
              statuscolumn = "",  -- Sin status column
              foldcolumn = "0",   -- Sin columna de folds
              winfixwidth = true, -- Mantener ancho fijo al redimensionar
              wrap = false,       -- Sin wrap (evita artefactos)
            },
            bo = {
              filetype = "opencode_terminal",
              scrollback = 10000,
            },
          },
        },
        
        -- Configuración de terminal de Neovim (fallback)
        terminal = {
          split = "right",
          width = math.floor(vim.o.columns * 0.35),
        },
      },

      -- Configuración de eventos
      events = {
        enabled = true,
        reload = true, -- Recargar buffers automáticamente
        permissions = {
          enabled = true,
          idle_delay_ms = 1000,
        },
      },

      -- Configuración de prompts personalizados
      prompts = {
        -- Prompts extendidos
        ask_append = { prompt = "", ask = true },
        ask_this = { prompt = "@this: ", ask = true, submit = true },
        
        -- Prompts de código
        review = { prompt = "Review @this for correctness, readability and best practices", submit = true },
        test = { prompt = "Add comprehensive tests for @this including edge cases", submit = true },
        explain = { prompt = "Explain @this and its context in detail", submit = true },
        fix = { prompt = "Fix @diagnostics", submit = true },
        refactor = { prompt = "Refactor @this to improve readability and maintainability", submit = true },
        optimize = { prompt = "Optimize @this for better performance", submit = true },
        document = { prompt = "Add comprehensive documentation/comments for @this", submit = true },
        
        -- Prompts de debugging
        debug = { prompt = "Debug @this and explain what the issue is and how to fix it", submit = true },
        diff = { prompt = "Review the following git diff for correctness and readability: @diff", submit = true },
        
        -- Prompts de implementación
        implement = { prompt = "Implement @this following best practices", submit = true },
        complete = { prompt = "Complete the implementation of @this", submit = true },
        
        -- Prompts de análisis
        analyze = { prompt = "Analyze @this and suggest improvements", submit = true },
        simplify = { prompt = "Simplify @this while maintaining functionality", submit = true },
        
        -- Prompts de testing
        unittests = { prompt = "Write unit tests for @this with proper setup and teardown", submit = true },
        integration = { prompt = "Write integration tests for @this", submit = true },
      },

      -- Configuración de ask (input)
      ask = {
        prompt = "Ask opencode: ",
        blink_cmp_sources = { "opencode", "buffer" },
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
          provider = true,
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

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

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

    -- Refrescar terminal al recuperar foco
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "WinEnter" }, {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].filetype == "opencode_terminal" then
          vim.cmd("mode")
        end
      end,
      desc = "Refresh opencode terminal on focus",
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
