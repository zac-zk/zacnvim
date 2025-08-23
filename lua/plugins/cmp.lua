return {
  {
    "gelguy/wilder.nvim", -- 用于增强命令行补全体验，blink 推荐搭配
    config = function()
      -- 可选配置，这里先空着
      require("wilder").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    branch = "main",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
      "glepnir/lspsaga.nvim",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- Mason安装和设置
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "cmake", "bashls", "lua_ls", "vimls" },
        automatic_installation = true,
      })

      -- lspconfig设置
      local lspconfig = require("lspconfig")

      local lua_settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      }

      local servers = {
        clangd = {},
        cmake = {},
        bashls = {},
        vimls = {},
        lua_ls = { settings = lua_settings },
      }

      for server, opts in pairs(servers) do
        opts = vim.tbl_extend("force", {
          on_attach = on_attach,
          flags = { debounce_text_changes = 150 },
        }, opts)
        lspconfig[server].setup(opts)
      end

      local blink = require("blink.cmp")
      blink.setup({
        keymap = {
          preset = "default",
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<CR>"] = { "accept", "fallback" }, -- Enter 确认选择
          ["<Esc>"]  = { "cancel", "fallback" },
        },
        completion = {
          accept = { auto_brackets = { enabled = true } },
          list = { selection = { preselect = true, auto_insert = true } },
          -- 自动补全设置
          trigger = {
            prefetch_on_insert = true,
            show_on_insert = true,  -- 输入时自动显示补全菜单
            show_on_trigger_character = true,
          },
        },
        sources = {
          default = { "lsp", "path", "buffer", "snippets" },
        },
        snippets = {
          preset = "luasnip",
        },
        signature = { enabled = true },
      })

      require("lspsaga").setup({
        ui = {
          border = "rounded",
          -- 其他ui配置可加
        },
        finder = {
          keys = {
            jump_to = "p",  -- 查找结果跳转
            edit = { "o", "<CR>" },
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = { "q", "<ESC>" },
          },
        },
        definition = {
          edit = "<CR>",
          -- 使用弹窗预览定义
          keys = {
            edit = "<CR>",
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = "q",
            close = "<Esc>",
          },
        },
      })
      -- 加载 LuaSnip 和 friendly-snippets
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()  -- 加载 vscode 风格 snippet
    end,
  },
}

