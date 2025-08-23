return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,  -- 开启当前行Git Blame显示
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',    -- 行尾显示
        delay = 500,              -- 延迟显示，单位ms
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      -- 你也可以配置更多功能
    })
  end,
}
