---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- Optimize for large files
      autopairs = true, -- Enable automatic pairing of brackets and quotes
      cmp = true, -- Enable completion
      diagnostics_mode = 3, -- Enable full diagnostics
      highlighturl = true, -- Highlight URLs
      notifications = true, -- Enable notifications
    },
    -- Diagnostics configuration
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- Vim options configuration
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- Relative line numbers
        number = true, -- Absolute line number for the current line
        spell = false, -- Disable spell check
        signcolumn = "yes", -- Always show the sign column
        wrap = true, -- Enable line wrapping
        mouse = "", -- Disable mouse support
        clipboard = "unnamedplus", -- Use system clipboard
      },
      g = { -- vim.g.<key>
      },
    },
    -- Key mappings through AstroCore
    mappings = {
      n = {
        -- Navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- Buffer management
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
