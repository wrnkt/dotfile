return {
  "NeogitOrg/neogit",
  lazy = false,
  priority = 1000,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = true,
  keys = {
    { "<leader>G", "<cmd>Neogit<CR>" },
  },
}
