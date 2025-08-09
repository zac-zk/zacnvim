vim.g.mapleader = " "      -- 设置 <leader> 为空格
vim.g.maplocalleader = " " -- 本地 leader 也设置为空格

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("keymaps")
require("autocmd").setup()
require("config")

