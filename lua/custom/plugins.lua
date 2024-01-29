local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "romainl/vim-cool",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = "*",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dapui").setup(opts)
      require("core.utils").load_mappings("dap_ui")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    ft = "*",
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup(opts)
    end,
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()'
  },
  {
    "folke/trouble.nvim",
    ft = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("core.utils").load_mappings("trouble")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("custom.configs.cmp")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    event = { "VimEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    event = { "VimEnter" },
  }
}
return plugins

