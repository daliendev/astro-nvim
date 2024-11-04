---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "astro",
        "html",
        "cssls",
        "tailwindcss",
        "volar",
        "eslint",
        "intelephense",
        "ts_ls",
        "pyright",
        "lua_ls",
      },
      automatic_installation = true,
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "prettier", -- for JavaScript/TypeScript/HTML/CSS
        "eslint_d", -- for JavaScript/TypeScript
        "phpcs", -- for PHP
        "black", -- for Python
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
        "js", -- for JavaScript/TypeScript
        "php", -- for PHP
      },
    },
  },
}
