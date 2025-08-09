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
    require("mini.indentscope").setup({
      options = { try_as_border = true },
    })

    -- 平滑动画
    -- require("mini.animate").setup({
    --   cursor = { enable = true, timing = require("mini.animate").gen_timing.linear({ duration = 10 }) },
    --   scroll = { enable = true, timing = require("mini.animate").gen_timing.linear({ duration = 10 }) },
    --   resize = { enable = false },
    --   open = { enable = false },
    -- })

    -- 多行对齐（没有默认快捷键，需要手动调用）
    require("mini.align").setup()

    -- 轻量文件浏览器
    require("mini.files").setup()
    require("mini.bracketed").setup()
    require('mini.notify').setup()
    require('mini.git').setup()
  end,
}

