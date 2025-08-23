return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
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
  end,
}
