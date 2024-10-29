require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^4", -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
      wrap = true, -- Default is false, enable to wrap lines on a few
    },
  },
  { import = "community" },
  { import = "plugins" },
  -- Adding dependencies here
  {
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
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = true,
      })
    end,
  },
  {
    -- Setup Mason first
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- Setup Mason-LSPConfig to install required servers
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "astro",
          "html",
          "cssls",
          "tailwindcss",
          "volar",
          "eslint",
          "intelephense",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    -- Configure the LSP servers after Mason is set up
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        -- Some  custom on_attach logic here
      end

      -- List of LSP servers to configure
      local servers = { 
	      "astro", 
	      "html", 
	      "cssls", 
	      "tailwindcss", 
	      "volar", 
	      "eslint", 
	      "intelephense", 
	      "ts_ls" 
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  },
  {
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
  },
  {
    -- nvim-ts-autotag plugin for autoclose and autorename of tags
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrotheme", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])

-- Enable line wrapping globally
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  command = "set wrap",
})

-- Disable mouse
vim.opt.mouse = ""
