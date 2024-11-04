---@type LazySpec
return {
    "nvimtools/none-ls.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = true,
      })
    end,
}
