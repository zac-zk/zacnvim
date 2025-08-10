-- utils.lua
local M = {}

-- 设置快捷键的封装函数
-- mode: 'n', 'i', 'v', 等
-- lhs: 按键
-- rhs: 触发命令或函数
-- desc: 描述
function M.map(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true }
  if desc then
    opts.desc = desc
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- 批量映射快捷键
-- keys: { {mode, lhs, rhs, desc}, ... }
function M.map_batch(keys)
  for _, key in ipairs(keys) do
    M.map(key[1], key[2], key[3], key[4])
  end
end

return M

