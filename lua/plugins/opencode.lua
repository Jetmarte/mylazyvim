return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    ---@module 'snacks'
    {
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
        terminal = {},
      },
    },
  },
  config = function()
    -- =====================================================
    -- CONFIGURACIÓN PRINCIPAL
    -- =====================================================
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- server: usamos snacks.terminal para poder hacer toggle.
      -- Si quieres conectarte a un opencode --port externo, fija aquí el puerto.
      server = {
        start = function()
          require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
        end,
      },

      events = {
        enabled = true,
        reload = { enabled = true },
        permissions = {
          enabled = true,
          idle_delay_ms = 1000,
          edits = { enabled = true },
        },
      },

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

      ask = {
        prompt = "Ask opencode: ",
        snacks = {
          icon = "󰚩 ",
          expand = false,
          win = {
            title_pos = "left",
            relative = "cursor",
            row = -3,
            col = 0,
            height = 5,
            width = 60,
          },
        },
      },

      select = {
        prompt = "opencode: ",
        snacks = {
          preview = "preview",
          layout = { preset = "vscode", hidden = {} },
        },
      },
    }

    -- Requerido para events.reload (plugin recarga buffers editados por opencode).
    vim.o.autoread = true

    local opencode = require("opencode")

    local opencode_cmd = "opencode --port"
    local snacks_terminal_opts = {
      win = {
        position = "right",
        enter = false,
      },
    }

    -- =====================================================
    -- KEYMAPS PRINCIPALES
    -- =====================================================

    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      opencode.ask("@this: ")
    end, { desc = "Ask opencode about this" })

    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      opencode.select()
    end, { desc = "Select opencode action" })

    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
    end, { desc = "Toggle opencode" })

    vim.keymap.set("n", "<leader>oS", function()
      opencode.start()
    end, { desc = "Start opencode" })

    vim.keymap.set("n", "<leader>o<CR>", function()
      opencode.command("session.select")
    end, { desc = "Select opencode session" })

    -- =====================================================
    -- OPERADORES (soportan rangos y dot-repeat)
    -- =====================================================

    vim.keymap.set({ "n", "x" }, "go", function()
      return opencode.operator("@this ")
    end, { expr = true, desc = "Add range to opencode" })

    vim.keymap.set("n", "goo", function()
      return opencode.operator("@this ") .. "_"
    end, { expr = true, desc = "Add line to opencode" })

    -- =====================================================
    -- NAVEGACIÓN DE SESIÓN
    -- =====================================================

    vim.keymap.set({ "n", "t" }, "<S-C-u>", function()
      opencode.command("session.half.page.up")
    end, { desc = "Opencode half page up" })

    vim.keymap.set({ "n", "t" }, "<S-C-d>", function()
      opencode.command("session.half.page.down")
    end, { desc = "Opencode half page down" })

    -- =====================================================
    -- KEYMAPS DE CONTEXTO ESPECÍFICO
    -- =====================================================

    vim.keymap.set({ "n", "x" }, "<leader>ob", function()
      opencode.ask("@buffer: ", { submit = true })
    end, { desc = "Ask about buffer" })

    vim.keymap.set({ "n", "x" }, "<leader>od", function()
      opencode.ask("@diagnostics: ", { submit = true })
    end, { desc = "Ask about diagnostics" })

    vim.keymap.set({ "n", "x" }, "<leader>og", function()
      opencode.ask("@diff: ", { submit = true })
    end, { desc = "Ask about git diff" })

    -- =====================================================
    -- COMANDOS Y PROMPTS RÁPIDOS
    -- =====================================================

    vim.keymap.set("n", "<leader>oc", function()
      vim.ui.input({ prompt = "Opencode command: " }, function(input)
        if input and input ~= "" then
          opencode.command(input)
        end
      end)
    end, { desc = "Execute opencode command" })

    vim.keymap.set({ "n", "x" }, "<leader>op", function()
      opencode.prompt("@this: ", { submit = false })
    end, { desc = "Prompt opencode (no submit)" })

    vim.keymap.set({ "n", "x" }, "<leader>or", function()
      opencode.prompt("Review @this for correctness and readability")
    end, { desc = "Review code" })

    vim.keymap.set({ "n", "x" }, "<leader>oe", function()
      opencode.prompt("Explain @this")
    end, { desc = "Explain code" })

    vim.keymap.set({ "n", "x" }, "<leader>oT", function()
      opencode.prompt("Add tests for @this")
    end, { desc = "Add tests" })

    vim.keymap.set({ "n", "x" }, "<leader>of", function()
      opencode.prompt("Fix @this")
    end, { desc = "Fix code" })

    vim.keymap.set({ "n", "x" }, "<leader>oR", function()
      opencode.prompt("Refactor @this for better readability")
    end, { desc = "Refactor code" })

    -- =====================================================
    -- TERMINAL DE OPENCODE: NAVEGACIÓN ENTRE VENTANAS
    -- =====================================================

    vim.keymap.set("t", "<Esc><Esc>", function()
      vim.cmd("stopinsert")
      vim.cmd("wincmd p")
    end, { desc = "Exit opencode and focus editor" })

    vim.keymap.set("t", "<C-h>", function()
      vim.cmd("stopinsert")
      vim.cmd("wincmd h")
    end, { desc = "Focus editor from opencode" })

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

    -- =====================================================
    -- AUTOCOMANDOS
    -- =====================================================

    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
      callback = function()
        if vim.bo.buftype == "terminal" then
          vim.cmd("startinsert")
        end
      end,
      desc = "Auto-enter terminal mode on focus",
    })

    -- Auto-wrap del input de `ask()` en saltos de línea reales al llegar al
    -- límite de columnas. `t` en formatoptions activa el wrap por textwidth.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "opencode_ask",
      callback = function()
        vim.opt_local.textwidth = 58
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.formatoptions:append("t")
      end,
      desc = "Multi-line wrap for opencode ask input",
    })

    vim.api.nvim_create_autocmd("TermOpen", {
      callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        if name:match("opencode") then
          vim.bo[args.buf].buflisted = false
        end
      end,
      desc = "Hide opencode terminal from buffer list",
    })

    -- Eventos de opencode (SSE). El patrón real es `OpencodeEvent:<type>`.
    -- Ej: OpencodeEvent:session.idle, OpencodeEvent:permission.asked, OpencodeEvent:file.edited.
    vim.api.nvim_create_autocmd("User", {
      pattern = "OpencodeEvent:*",
      callback = function(args)
        ---@type opencode.server.Event
        local event = args.data and args.data.event
        if not event then
          return
        end
        if event.type == "session.idle" then
          vim.notify("opencode finished responding", vim.log.levels.INFO)
        elseif event.type == "permission.asked" then
          vim.notify("opencode requested permission", vim.log.levels.WARN)
        end
      end,
    })
  end,
}
