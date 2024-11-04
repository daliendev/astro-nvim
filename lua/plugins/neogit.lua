---@type LazySpec
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function ()
    require("neogit").setup({})

    -- Set up autocmd to refresh neo-tree after Neogit operations
    vim.api.nvim_create_autocmd("User", {
      pattern = "NeogitStatusRefreshed",
      callback = function()
        require("neo-tree.sources.filesystem.commands").refresh(
          require("neo-tree.sources.manager").get_state("filesystem")
        ) -- Refresh neo-tree filesystem as expanded here https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1253
      end,
    })
  end,
}
