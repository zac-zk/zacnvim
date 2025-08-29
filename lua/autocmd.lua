local M = {}

function M.setup()
  local api = vim.api
  local group = api.nvim_create_augroup("MyAutoCmds", { clear = true })

  -- 定义一个辅助函数，用于简化 autocmd 创建
  local function autocmd(events, opts)
    opts.group = group
    api.nvim_create_autocmd(events, opts)
  end

  -- 自动命令列表
  local cmds = {
    -- 回到上次退出的位置
    {
      { "BufReadPost" },
      function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
          pcall(api.nvim_win_set_cursor, 0, mark)
        end
      end,
    },

    -- 新行不自动注释
    {
      { "BufEnter" },
      function()
        vim.opt.formatoptions = vim.opt.formatoptions - "c" - "r" - "o"
      end,
    },

    -- yank 高亮
    {
      { "TextYankPost" },
      function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
      end,
    },

    -- 调整窗口大小时刷新折叠
    {
      { "VimResized" },
      function()
        vim.cmd("normal! zx")
      end,
    },

    -- 实时检测外部文件变化
    -- {
    --   { "FocusGained", "BufEnter" },
    --   function()
    --     vim.cmd("checktime")
    --   end,
    -- },
  }

  -- 统一注册所有自动命令
  for _, cmd in ipairs(cmds) do
    autocmd(cmd[1], { callback = cmd[2] })
  end
end

return M
