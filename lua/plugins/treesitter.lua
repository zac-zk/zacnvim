return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- 安装的语言列表
      ensure_installed = { "cpp", "c", "cmake", "bash", "lua", "json", "proto" },

      -- 自动安装缺失的 parser
      auto_install = true,

      highlight = {
        enable = true, -- 启用代码高亮
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true, -- 启用缩进模块（注意某些语言支持有限）
      },

      -- 你可以加更多模块，如增量选择、上下文感知等
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
