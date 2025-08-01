return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = function()
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)
    return {
      auto_insert_mode = true,
      question_header = "  " .. user .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
    }
  end,
  keys = {
    { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    {
      "<leader>aa",
      function()
        return require("CopilotChat").toggle()
      end,
      desc = "Toggle (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ax",
      function()
        return require("CopilotChat").reset()
      end,
      desc = "Clear (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function()
        vim.ui.input({
          prompt = "Quick Chat: ",
        }, function(input)
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end)
      end,
      desc = "Quick Chat (CopilotChat)",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function()
        require("CopilotChat").select_prompt()
      end,
      desc = "Prompt Actions (CopilotChat)",
      mode = { "n", "v" },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "copilot-chat",
      callback = function()
        vim.opt_local.relativenumber = false
        vim.opt_local.number = false
      end,
    })
    local custom_prompts = {
      {
        title = "Commit",
        prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters.",
      },
      {
        title = "Docs",
        prompt = "Please add documentation comments to the selected code.",
      },
      {
        title = "Explain",
        prompt = "Write an explanation for the selected code as paragraphs of text.",
      },
      {
        title = "Fix",
        prompt = "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain your reasoning.",
      },
      {
        title = "Optimize",
        prompt = "Optimize the selected code to improve performance and readability. Explain your optimizations.",
      },
      {
        title = "Review",
        prompt = "Review the selected code.",
      },
      {
        title = "Tests",
        prompt = "Please generate tests for my code.",
      },
      {
        title = "Hello",
        prompt = "Write a hello world program.",
      },
    }
    opts.prompts = vim.list_extend(opts.prompts or {}, custom_prompts)
    chat.setup(opts)
  end,
}
