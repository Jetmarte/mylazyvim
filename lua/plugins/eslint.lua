return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          workingDirectory = { mode = "auto" },
        },
        on_attach = function(client, bufnr)
          -- ❗ desactiva diagnóstico de ESLint para no chocar con tsserver
          client.server_capabilities.diagnosticProvider = false
          client.server_capabilities.publishDiagnostics = false
        end,
      },
    },
  },
}
