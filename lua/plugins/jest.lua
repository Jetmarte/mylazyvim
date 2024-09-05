return {
  {
    "mattkubej/jest.nvim",
    name = "jest",
    config = function()
      require("nvim-jest").setup({
        -- Jest executable
        -- By default finds jest in the relative project directory
        -- To override with an npm script, provide 'npm test --' or similar
        --jest_cmd = "/relative/project/dir/node_modules/jest/bin/jest.js",
        jest_cmd = "/usr/local/lib/node_modules/jest/bin/jest.js",

        -- Prevents tests from printing messages
        silent = true,
      })
    end,
  },
}
