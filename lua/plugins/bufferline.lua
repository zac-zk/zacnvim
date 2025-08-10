return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- 显示缓冲区（可改成 "tabs" 显示 tab）
        numbers = "none", -- "ordinal" 显示编号
        close_command = "bdelete! %d", -- 关闭缓冲区命令
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,

        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "slant", -- "slant" | "thick" | "thin"
        enforce_regular_tabs = false,
        always_show_bufferline = true,
      },
    })
    local map = require("G").map
    map("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", "选择 Buffer")         -- 按字母选择
    map("n", "<leader>bc", "<Cmd>bdelete<CR>", "关闭当前 Buffer")            -- 关闭当前
    map("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", "关闭其它 Buffer") -- 关闭其它
    map("n", "<leader>bl", "<Cmd>BufferLineCycleNext<CR>", "下一个 Buffer")   -- 下一个
    map("n", "<leader>bh", "<Cmd>BufferLineCyclePrev<CR>", "上一个 Buffer")   -- 上一个
    map("n", "<leader>bm", "<Cmd>BufferLineMoveNext<CR>", "Buffer 向后移动")  -- 交换位置
    map("n", "<leader>bn", "<Cmd>BufferLineMovePrev<CR>", "Buffer 向前移动")  -- 交换位置
  end,
}

