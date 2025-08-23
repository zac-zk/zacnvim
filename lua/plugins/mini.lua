return {
  "echasnovski/mini.nvim",
  branch = "stable",
  config = function()
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

    -- 轻量文件浏览器
    require("mini.files").setup()

    require("mini.bracketed").setup({
      conflict = { suffix = "", options = {} },
      diagnostic = { suffix = "", options = {} },
      comment = { suffix = "", opions = {}},
    })
    require('mini.notify').setup()
    require('mini.git').setup()
    require('mini.move').setup()
  end,
}

