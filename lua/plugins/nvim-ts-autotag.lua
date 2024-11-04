---@type LazySpec
return {
  -- nvim-ts-autotag plugin for autoclose and autorename of tags
  "windwp/nvim-ts-autotag",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
