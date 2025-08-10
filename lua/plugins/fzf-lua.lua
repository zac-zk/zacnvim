return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local map = require("G").map
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        height = 0.85,
        width = 0.8,
        preview = {
          layout = "vertical",
          vertical = "up:45%",
        },
      },
      files = {
        prompt = "Files❯ ",
        cmd = "rg --files --hidden --follow --glob '!.git/*'",
      },
      buffers = {
        prompt = "Buffers❯ ",
        sort_lastused = true,
      },
      grep = {
        prompt = "Rg❯ ",
        rg_opts = "--hidden --line-number --column --smart-case --follow",
      },
      git = {
        files = {
          prompt = "GitFiles❯ ",
          cmd = "git ls-files --exclude-standard --cached --others",
        },
      },
      oldfiles = {
        prompt = "History❯ ",
      },
      quickfix = {
        prompt = "QuickFix❯ ",
      },
      lsp = {
        prompt = "LSP Symbols❯ ",
      },
      -- 可根据需要自定义快捷键，以下是示例
      keymap = {
        builtin = {
          ["<c-j>"] = "down",
          ["<c-k>"] = "up",
          ["<c-q>"] = "send-to-quickfix",
          ["<esc>"] = "close",
        },
      },
    })
    map("n", "<leader>ff", require("fzf-lua").files, "文件搜索")
    map("n", "<leader>fb", require("fzf-lua").buffers, "缓冲区列表")
    map("n", "<leader>fg", require("fzf-lua").grep, "全文搜索(rg)")
    map("n", "<leader>fh", require("fzf-lua").oldfiles, "历史文件")
    map("n", "<leader>fq", require("fzf-lua").quickfix, "快速修复列表")
  end,
}
