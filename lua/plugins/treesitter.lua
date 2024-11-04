---@type LazySpec
return {
    -- nvim-treesitter setup
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Changed from 'run' to 'build' as per newer Lazy.nvim specs
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "lua",
          "vim",
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
      })
    end,
}
