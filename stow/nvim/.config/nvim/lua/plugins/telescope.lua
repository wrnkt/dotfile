return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- stylua: ignore
      {
        "<leader>fp",
        "<CMD>Telescope keymaps<CR>",
        desc = "Find Plugin File",
      },
      {
        "<leader>ff",
        "<cmd> Telescope find_files <CR>",
        desc = "Find files",
      },
      {
        "<leader>fa",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        desc = "Find all",
      },
      {
        "<leader>fw",
        "<cmd> Telescope live_grep <CR>",
        desc = "Live grep",
      },
      {
        "<leader>fb",
        "<cmd> Telescope buffers <CR>",
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        "<cmd> Telescope help_tags <CR>",
        desc = "Help page",
      },
      {
        "<leader>fo",
        "<cmd> Telescope oldfiles <CR>",
        desc = "Find oldfiles",
      },
      {
        "<leader>fz",
        "<cmd> Telescope current_buffer_fuzzy_find <CR>",
        desc = "Find in current buffer",
      },
      {
        "<leader>cm",
        "<cmd> Telescope git_commits <CR>",
        desc = "Git commits",
      },
      {
        "<leader>gt",
        "<cmd> Telescope git_status <CR>",
        desc = "Git status",
      },
      {
        "<leader>pt",
        "<cmd> Telescope terms <CR>",
        desc = "Pick hidden term",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
