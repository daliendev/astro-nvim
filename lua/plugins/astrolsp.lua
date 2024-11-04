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
        enabled = false,
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
      "pyright",
    },
    config = {
      -- Example: clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
}
