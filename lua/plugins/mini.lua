return {
  "echasnovski/mini.nvim",
  branch = "stable",
  config = function()
    local map = require("G").map
    -- 括号自动补全
    require("mini.pairs").setup()

    -- 注释
    require("mini.comment").setup()

    -- 包围符号操作
    require("mini.surround").setup()

    -- 缩进范围高亮
    require("mini.indentscope").setup()

    -- 平滑动画
    -- require("mini.animate").setup()

    -- 多行对齐（没有默认快捷键，需要手动调用）
    require("mini.align").setup()
    map("x", "ga", "<Plug>(mini.align)", "多行对齐")

    -- 轻量文件浏览器
    require("mini.files").setup()
    map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", "打开文件树")

    require("mini.bracketed").setup({
      conflict = { suffix = "", options = {} },
      diagnostic = { suffix = "", options = {} },

    })
    require('mini.notify').setup()
    require('mini.git').setup()
    require('mini.move').setup()
  end,
}

