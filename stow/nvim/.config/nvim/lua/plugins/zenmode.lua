return {
  {
    -- simplifies UI, removes distractions
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    enabled = true,
    lazy = false,
    config = function(_, _)
      -- require("core.utils").load_mappings("zenmode")
    end,
    opts = {
      window = {
        width = 0.80,
        height = 1,
        options = {
          signcolumn = "no",
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
          laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = false },
      },
    },
  },
}
