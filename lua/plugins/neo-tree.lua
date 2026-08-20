return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,

  opts = {
    close_if_last_window = true,

    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        with_expanders = false,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "󰈙",
      },
      modified = {
        symbol = "●",
      },
      name = {
        trailing_slash = false,
        highlight_opened_files = true,
      },
      git_status = {
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "󰁕",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },

    window = {
      position = "left",
      width = 36,
      mappings = {
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local rel = vim.fn.fnamemodify(path, ":.")
          vim.fn.setreg("+", rel)
          vim.notify("Ruta copiada: " .. rel)
        end,
        ["gY"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path)
          vim.notify("Ruta absoluta copiada: " .. path)
        end,
        ["O"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
        ["h"] = "close_node",
        ["l"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        ["E"] = "expand_all_nodes",
        ["W"] = "close_all_nodes",
        ["<A-o>"] = false,
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "node_modules",
          ".git",
          ".DS_Store",
          "thumbs.db",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      use_libuv_file_watcher = true,
      group_empty_dirs = false,
    },

    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      group_empty_dirs = false,
      show_unloaded = true,
    },

    git_status = {
      window = {
        position = "left",
      },
    },

    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
        end,
      },
    },
  },
}
