return {
  {
    "gelguy/wilder.nvim", -- 用于增强命令行补全体验，blink 推荐搭配
    config = function()
      -- 可选配置，这里先空着
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
      local map = require("G").map
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
          autocomplete = true,
          completeopt = "menu,menuone,noinsert", -- 不插入内容直到确认
          confirm = {
            behavior = "replace", -- 只在确认时替换输入文本
            select = false,       -- 不自动选择第一个
          },
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
        -- 你可以根据需求调整配置，这里是常用默认配置
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
      map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", "查看定义 (Lspsaga)")
      map("n", "gD", "<cmd>Lspsaga goto_definition<CR>", "跳转定义 (Lspsaga)")
      map("n", "gr", "<cmd>Lspsaga finder<CR>", "查找引用/定义 (Lspsaga)")

      -- 悬浮文档
      map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "悬浮文档 (Lspsaga)")

      -- 代码操作
      map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", "代码操作 (Lspsaga)")

      -- 重命名
      map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "重命名 (Lspsaga)")

      -- 诊断跳转
      map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "上一个诊断 (Lspsaga)")
      map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "下一个诊断 (Lspsaga)")

      -- Outline
      map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", "打开大纲 (Lspsaga)")

      -- 加载 LuaSnip 和 friendly-snippets
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()  -- 加载 vscode 风格 snippet
    end,
  },
}

