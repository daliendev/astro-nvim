return {
  "AstroNvim/astrolsp",
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      timeout_ms = 1000,
    },
    servers = {
      "astro",
      "html",
      "cssls",
      "tailwindcss",
      "volar",
      "eslint",
      "intelephense",
      "ts_ls",
      "pyright"
    },
    config = {
      -- Example: clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- Custom on_attach function
    on_attach = function(client, bufnr)
    end,
    -- Add capabilities
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
}
