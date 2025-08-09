local opt = vim.opt

-- 基础编辑体验
opt.number = true                   -- 显示行号
opt.relativenumber = true           -- 相对行号，方便跳转
opt.cursorline = true                -- 高亮当前行
opt.wrap = true                     -- 不自动换行
opt.expandtab = true                 -- 使用空格代替tab
opt.shiftwidth = 2                   -- 缩进2个空格
opt.tabstop = 2                      -- tab宽度为2
opt.smartindent = true               -- 智能缩进
opt.autoindent = true                -- 自动缩进
opt.smarttab = true                  -- 智能tab键
opt.backspace = { "indent", "eol", "start" }  -- backspace行为更智能

-- 搜索
opt.ignorecase = true                -- 搜索忽略大小写
opt.smartcase = true                 -- 有大写字母时搜索区分大小写
opt.hlsearch = true                  -- 高亮搜索结果
opt.incsearch = true                 -- 边输入边搜索

-- 界面相关
opt.termguicolors = true             -- 启用真彩色支持
opt.signcolumn = "yes"               -- 总是显示符号列（避免跳动）
opt.cmdheight = 1                    -- 命令行高度
opt.showmode = false                 -- 不显示模式(用状态栏替代)
opt.showcmd = true                   -- 显示部分命令
opt.scrolloff = 8                    -- 光标上下保留8行
opt.sidescrolloff = 8                -- 左右保留8列

-- 备份和交换文件
opt.swapfile = false                 -- 禁用交换文件
opt.backup = false                   -- 禁用备份文件
opt.undofile = true                  -- 启用持久化撤销

-- 鼠标支持
opt.mouse = "a"                      -- 所有模式启用鼠标

-- 分屏行为
opt.splitright = true                -- 垂直分屏打开在右边
opt.splitbelow = true                -- 水平分屏打开在下面

-- 其他
opt.timeoutlen = 500                 -- 按键等待时间(ms)
opt.updatetime = 300                 -- 触发事件等待时间(ms)，影响CursorHold等
opt.clipboard = "unnamedplus"       -- 使用系统剪贴板
opt.completeopt = { "menuone", "noinsert", "noselect" } -- 补全选项

-- 折叠配置，配合treesitter折叠
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99                   -- 默认全部展开
opt.foldenable = true                -- 启用折叠
