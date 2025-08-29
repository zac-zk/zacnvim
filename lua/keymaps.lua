local map = require("G").map

-- ===================
-- 基础操作
-- ===================
map("n", "W", "<cmd>w<cr>", "保存")
map("n", "Q", "<cmd>q<cr>", "退出")
map({ "i", "v" }, "jk", "<esc>", "normal模式")
map("n", "<C-h>", ":%s///g<Left><Left>", "全局替换")
map("n", "<C-j>", "10j", "向下移动10行")
map("n", "<C-k>", "10k", "向上移动10行")

-- 切换头文件和cpp/cc文件
map('n', '<leader>a', function()
  local name = vim.fn.expand('%:t:r') -- 文件名，不带路径和后缀
  local ext = vim.fn.expand('%:e')    -- 文件扩展名
  local dir = vim.fn.expand('%:p:h')  -- 当前文件所在目录
  local targets = { "h", "hpp", "hh", "cc", "cpp", "cxx" }

  for _, t in ipairs(targets) do
    if t ~= ext then
      local file = dir .. "/" .. name .. "." .. t
      if vim.fn.filereadable(file) == 1 then
        vim.cmd("edit " .. file)
        return
      end
    end
  end
  print("No matching file found")
end, "")

-- 窗口分屏
map("n", "<leader>wv", "<cmd>vsplit<CR>", "垂直分屏")
map("n", "<leader>wh", "<cmd>split<CR>", "水平分屏")
map("n", "<leader>wc", "<cmd>close<CR>", "关闭当前窗口")
map("n", "<leader>wo", "<cmd>only<CR>", "关闭当前窗口")
-- 窗口导航
map("n", "<leader>h", "<C-w>h", "向左移动窗口")
map("n", "<leader>l", "<C-w>l", "向右移动窗口")
map("n", "<leader>j", "<C-w>j", "向下移动窗口")
map("n", "<leader>k", "<C-w>k", "向上移动窗口")
-- 窗口大小
map("n", "<C-A-h>", ":vertical resize -5<CR>", "减少宽度")
map("n", "<C-A-l>", ":vertical resize +5<CR>", "增加宽度")
map("n", "<C-A-k>", ":resize +2<CR>", "增加高度")
map("n", "<C-A-j>", ":resize -2<CR>", "减少高度")

-- map("n", "za", "za", "切换折叠")
-- map("n", "zc", "zc", "关闭折叠")
-- map("n", "zo", "zo", "打开折叠")
-- map("n", "zM", "zM", "折叠全部")
-- map("n", "zR", "zR", "展开全部")

-- mini
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", "打开文件树")
map("x", "ga", "<Plug>(mini.align)", "多行对齐")

-- Lspsage
map("n", "<leader>cd", "<cmd>Lspsaga peek_definition<CR>", "查看定义 (Lspsaga)")
map("n", "<leader>cD", "<cmd>Lspsaga goto_definition<CR>", "跳转定义 (Lspsaga)")
map("n", "<leader>cR", "<cmd>Lspsaga finder<CR>", "查找引用/定义 (Lspsaga)")
map("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", "重命名 (Lspsaga)")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", "代码操作 (Lspsaga)")
map("n", "<leader>co", "<cmd>Lspsaga outline<CR>", "打开大纲 (Lspsaga)")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "悬浮文档 (Lspsaga)")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "上一个诊断 (Lspsaga)")
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "下一个诊断 (Lspsaga)")
map("n", "<leader>=", function()
  vim.lsp.buf.format({ async = true })
end, "格式化代码")

-- ToggleTerm
map("n", "<leader>th", function()
  require("toggleterm").toggle(1, 15, vim.loop.cwd(), "horizontal")
end, "水平终端")
map("n", "<leader>tv", function()
  require("toggleterm").toggle(2, 60, vim.loop.cwd(), "vertical")
end, "垂直终端")
map("n", "<leader>tf", function()
  require("toggleterm").toggle(3, nil, vim.loop.cwd(), "float")
end, "浮动终端")

-- Gitsigns
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", "切换给git blame")

-- fzf-lua
map("n", "<leader>ff", require("fzf-lua").files, "文件搜索")
map("n", "<leader>fb", require("fzf-lua").buffers, "缓冲区列表")
map("n", "<leader>fg", require("fzf-lua").grep, "全文搜索(rg)")
map("n", "<leader>fh", require("fzf-lua").oldfiles, "历史文件")
map("n", "<leader>fq", require("fzf-lua").quickfix, "快速修复列表")

-- bufferline
map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", "选择 Buffer") -- 按字母选择
map("n", "<leader>bc", "<Cmd>bdelete<CR>", "关闭当前 Buffer") -- 关闭当前
map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", "关闭其它 Buffer") -- 关闭其它
map("n", "<leader>bl", "<Cmd>BufferLineCycleNext<CR>", "下一个 Buffer") -- 下一个
map("n", "<leader>bh", "<Cmd>BufferLineCyclePrev<CR>", "上一个 Buffer") -- 上一个
map("n", "<leader>bm", "<Cmd>BufferLineMoveNext<CR>", "Buffer 向后移动") -- 交换位置
map("n", "<leader>bn", "<Cmd>BufferLineMovePrev<CR>", "Buffer 向前移动") -- 交换位置
