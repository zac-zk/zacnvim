return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,                       -- 终端窗口大小
      open_mapping = [[<leader>tt]],   -- 打开/关闭终端快捷键
      hide_numbers = true,             -- 隐藏行号
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,          -- 打开时进入插入模式
      insert_mappings = true,
      persist_size = true,
      direction = "float",             -- 浮动终端，可改为"horizontal"或"vertical"
      close_on_exit = true,
      shell = vim.o.shell,             -- 使用系统 shell
    })

    -- 快速打开水平终端
    vim.keymap.set("n", "<leader>th", function()
      require("toggleterm").toggle(1, 15, vim.loop.cwd(), "horizontal")
    end, { desc = "水平终端" })

    -- 快速打开垂直终端
    vim.keymap.set("n", "<leader>tv", function()
      require("toggleterm").toggle(2, 60, vim.loop.cwd(), "vertical")
    end, { desc = "垂直终端" })

    -- 快速打开浮动终端
    vim.keymap.set("n", "<leader>tf", function()
      require("toggleterm").toggle(3, nil, vim.loop.cwd(), "float")
    end, { desc = "浮动终端" })
  end,
}

