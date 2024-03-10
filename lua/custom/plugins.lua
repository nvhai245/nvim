local plugins = {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "custom.configs.treesitter"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "custom.configs.mason"
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
      require("core.utils").load_mappings("lspconfig")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.none-ls"
    end,
  },
  {
    "romainl/vim-cool",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dapgo")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    ft = "*",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dapui").setup(opts)
      require("core.utils").load_mappings("dapui")
      require("custom.configs.dap-ui")
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
      require("go").setup({
        lsp_codelens = false,
        lsp_keymaps = false,
        lsp_inlay_hints = {
          enable = false,
        },
      })
      require("core.utils").load_mappings("gopher")
    end,
    ft = { "go", "gomod" },
    event = { "CmdlineEnter" },
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
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
      },
    },
    config = function(_, opts)
      require("cmp").setup(opts)
      require("custom.configs.cmp")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvimtree"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    event = { "VimEnter" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("core.utils").load_mappings("lazygit")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = { "VimEnter" },
    config = function()
      require("core.utils").load_mappings("diffview")
    end
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("custom.configs.auto-session")
    end
  },
  {
    "xiyaowong/transparent.nvim",
    event = { "VimEnter" },
  },
  {
    "nvhai245/lazydocker.nvim",
    event = "VeryLazy",
    opts = {
      require("core.utils").load_mappings("lazydocker")
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end
  },
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.g.codeium_no_map_tab = 1
    end
  },
  {
    "doums/suit.nvim",
    event = "VeryLazy",
    config = true
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "ellisonleao/dotenv.nvim",
    lazy = false,
    config = function()
      require('dotenv').setup({
        enable_on_load = true,
        verbose = false,
      })
    end
  },
  {
    'ThePrimeagen/vim-be-good',
    event = "VeryLazy"
  }
}
return plugins
