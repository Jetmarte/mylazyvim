return {
  "mfussenegger/nvim-dap",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio",
  },

  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },

    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Conditional Breakpoint",
    },

    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<F8>",
      function()
        require("dap").continue()
      end,
      desc = "Continue",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },

    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle DAP UI",
    },
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui"] = function()
      dapui.close()
    end

    -- VS Code launch.json support
    local vscode = require("dap.ext.vscode")
    vscode.json_decode = function(str)
      return vim.json.decode(require("plenary.json").json_strip_comments(str))
    end

    -- Mason DAP
    if LazyVim.has("mason-nvim-dap.nvim") then
      require("mason-nvim-dap").setup()
    end

    ---------------------------------------------------------
    -- JS / TS DEBUG ADAPTER (Next.js / Node / React)
    ---------------------------------------------------------

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    dap.adapters["pwa-chrome"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    ---------------------------------------------------------
    -- NEXT.JS / NODE SERVER DEBUG
    ---------------------------------------------------------

    local js_config = {
      {
        name = "Debug Next.js (Server)",
        type = "pwa-node",
        request = "launch",
        program = "${workspaceFolder}/node_modules/.bin/next",
        args = { "dev" },
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        resolveSourceMapLocations = {
          "${workspaceFolder}/**",
          "!**/node_modules/**",
        },
      },

      {
        name = "Debug Node File",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
      },

      {
        name = "Attach to Node",
        type = "pwa-node",
        request = "attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }

    dap.configurations.javascript = js_config
    dap.configurations.typescript = js_config

    ---------------------------------------------------------
    -- REACT / NEXT FRONTEND (CHROME DEBUG)
    ---------------------------------------------------------

    dap.configurations.javascriptreact = {
      {
        name = "Debug Browser (Next.js)",
        type = "pwa-chrome",
        request = "launch",
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
    }

    dap.configurations.typescriptreact = dap.configurations.javascriptreact

    ---------------------------------------------------------
    -- PYTHON DEBUG (BONUS)
    ---------------------------------------------------------

    dap.adapters.python = {
      type = "executable",
      command = "python3",
      args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Debug Python File",
        program = "${file}",
        pythonPath = "python3",
      },
    }

    ---------------------------------------------------------
    -- VISUAL BREAKPOINT ICONS
    ---------------------------------------------------------

    vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })
  end,
}
