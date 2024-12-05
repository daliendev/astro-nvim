---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "astro",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "lua",
      "vim",
      "vue",
      "markdown",
      "markdown_inline",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}
