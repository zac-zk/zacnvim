return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup({
      plugins = { spelling = true },
      window = { border = "rounded" },
    })
  end,
}
