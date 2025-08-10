local map = require("G").map

-- ===================
-- 基础操作
-- ===================
map("n", "<leader>w", "<cmd>w<cr>", "保存")
map("n", "<leader>q", "<cmd>q<cr>", "退出")
map("i", "jk", "<esc>", "退出编辑")

-- 窗口分屏
map("n", "<leader>sv", "<cmd>vsplit<CR>", "垂直分屏")
map("n", "<leader>sh", "<cmd>split<CR>", "水平分屏")
map("n", "<leader>sc", "<cmd>close<CR>", "关闭当前窗口")
-- 窗口导航
map("n", "<C-h>", "<C-w>h", "")
map("n", "<C-j>", "<C-w>j", "")
map("n", "<C-k>", "<C-w>k", "")
map("n", "<C-l>", "<C-w>l", "")

map("n", "za", "za", "切换折叠")
map("n", "zc", "zc", "关闭折叠")
map("n", "zo", "zo", "打开折叠")
map("n", "zM", "zM", "折叠全部")
map("n", "zR", "zR", "展开全部")
