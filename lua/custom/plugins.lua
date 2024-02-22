local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "lua-language-server",
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
      require("go").setup()
      require("core.utils").load_mappings("gopher")
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
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
      },
    },
    config = function()
      require("custom.configs.cmpconfig")
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
  }
}
return plugins
