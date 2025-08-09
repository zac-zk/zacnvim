local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ===================
-- 基础操作
-- ===================
map("n", "<leader>w", "<cmd>w<cr>", opts) -- 保存文件
map("n", "<leader>q", "<cmd>q<cr>", opts) -- 退出

-- 窗口分屏
map("n", "<leader>sv", "<cmd>vsplit<CR>", opts)  -- 垂直分屏
map("n", "<leader>sh", "<cmd>split<CR>", opts)   -- 水平分屏
map("n", "<leader>sc", "<cmd>close<CR>", opts)   -- 关闭当前窗口
-- 窗口导航（不使用leader，常用）
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- ===================
-- mini系列
-- ===================
map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", opts)

-- ===================
-- 文件搜索和缓冲区
-- ===================
-- fzf-lua 文件搜索相关 <leader>f 开头
map("n", "<leader>ff", require("fzf-lua").files, { desc = "文件搜索", silent = true })
map("n", "<leader>fb", require("fzf-lua").buffers, { desc = "缓冲区列表", silent = true })
map("n", "<leader>fg", require("fzf-lua").grep, { desc = "全文搜索(rg)", silent = true })
map("n", "<leader>fh", require("fzf-lua").oldfiles, { desc = "历史文件", silent = true })
map("n", "<leader>fq", require("fzf-lua").quickfix, { desc = "快速修复列表", silent = true })

-- ===================
-- LSP 相关 <leader>l 开头
-- ===================
map("n", "gd", vim.lsp.buf.definition, { desc = "跳转到定义", silent = true })
map("n", "gr", vim.lsp.buf.references, { desc = "查找引用", silent = true })
map("n", "gi", vim.lsp.buf.implementation, { desc = "跳转到实现", silent = true })
map("n", "K", vim.lsp.buf.hover, { desc = "悬停信息", silent = true })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "重命名", silent = true })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "代码操作", silent = true })

-- ===================
-- 多行文本操作 <leader>a
-- ===================
map("x", "ga", "<Plug>(mini.align)", { desc = "多行对齐" })

-- ===================
-- 代码折叠
-- ===================
map("n", "za", "za", opts) -- 切换折叠
map("n", "zc", "zc", opts) -- 关闭折叠
map("n", "zo", "zo", opts) -- 打开折叠
map("n", "zM", "zM", opts) -- 折叠全部
map("n", "zR", "zR", opts) -- 展开全部
