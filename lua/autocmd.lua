local M = {}

function M.setup()
  local api = vim.api

  -- 回到上次退出的位置
  api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })

  -- 新行不自动注释（关闭自动注释继续）
  api.nvim_create_autocmd("BufEnter", {
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions
        - "c" -- 不自动注释新行
        - "r"
        - "o"
    end,
  })

  -- 自动去除行尾空格（保存时）
  api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local pos = vim.api.nvim_win_get_cursor(0)
      vim.cmd([[%s/\s\+$//e]])
      vim.api.nvim_win_set_cursor(0, pos)
    end,
  })

  -- 复制时高亮（yank highlight）
  api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
  })

  -- 调整窗口大小时自动刷新折叠
  api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
      vim.cmd("normal! zx")
    end,
  })

end

return M

