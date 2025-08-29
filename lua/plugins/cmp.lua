return {
  {
    "neovim/nvim-lspconfig",
    branch = "main",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "saghen/blink.cmp", version = "1.6.0" },
      "glepnir/lspsaga.nvim",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "gelguy/wilder.nvim", -- 命令行补全
    },
    config = function()
      -- Mason 安装与配置
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "cmake", "bashls", "lua_ls", "vimls" },
        automatic_installation = true,
      })

      -- LSP 设置
      local lspconfig = require("lspconfig")
      local servers = {
        clangd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--limit-results=500",
          "--limit-references=1000",
          "--limit-parse-depth=10",
        },
        cmake = {},
        bashls = {},
        vimls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      }

      for server, opts in pairs(servers) do
        opts = vim.tbl_extend("force", {
          on_attach = on_attach,
          flags = { debounce_text_changes = 150 },
        }, opts)
        lspconfig[server].setup(opts)
      end

      -- Wilder: 增强命令行补全
      local wilder = require("wilder")
      require("wilder").setup({ modes = { ":", "/", "?" } })
      -- 使用 popupmenu 渲染 UI（可选: wildmenu）
      wilder.set_option('renderer', wilder.renderer_mux({
        [":"] = wilder.popupmenu_renderer(
          wilder.popupmenu_border_theme({
            border = "rounded",
            highlights = {
              border = "Normal",
              accent = "Statement",
            },
            highlighter = wilder.basic_highlighter(),
            left = { ' ', wilder.popupmenu_devicons() }, -- 左侧显示图标
            right = { ' ', wilder.popupmenu_scrollbar() }, -- 右侧滚动条
          })
        ),
        ["/"] = wilder.wildmenu_renderer({
          highlighter = wilder.basic_highlighter(),
        }),
      }))

      -- 高亮渐变效果
      wilder.set_option('highlighter', wilder.highlighter_with_gradient({
        wilder.basic_highlighter(),
      }))

      -- 启用 Devicons 图标
      wilder.set_option('use_devicons', true)

      -- Blink.cmp: 补全设置
      local blink = require("blink.cmp")
      blink.setup({
        keymap = {
          preset     = "default",
          ["<Up>"]   = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<CR>"]   = { "accept", "fallback" },
          ["<Esc>"]  = { "cancel", "fallback" },
        },
        completion = {
          accept = { auto_brackets = { enabled = true } },
          list = { selection = { preselect = true, auto_insert = true } },
          trigger = {
            prefetch_on_insert = true,
            show_on_insert = true,
            show_on_trigger_character = true,
          },
        },
        sources = { default = { "lsp", "path", "buffer", "snippets" } },
        snippets = { preset = "luasnip" },
        signature = { enabled = true },
      })

      -- Lspsaga: LSP UI 美化
      require("lspsaga").setup({
        ui = { border = "rounded" },
        finder = {
          keys = { jump_to = "p", edit = { "o", "<CR>" }, vsplit = "v", split = "s", tabe = "t", quit = { "q", "<ESC>" } },
        },
        definition = {
          keys = { edit = "<CR>", vsplit = "v", split = "s", tabe = "t", quit = "q", close = "<Esc>" },
        },
      })

      -- 加载 LuaSnip 和 friendly-snippets
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
