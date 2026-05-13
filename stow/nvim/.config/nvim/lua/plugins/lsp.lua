return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- ensures Mason installs servers
      servers = {
        jdtls = {},
      },
      setup = {
        jdtls = function()
          return true -- avoid duplicate servers
        end,
      },
      inlay_hints = { enabled = false },
    },
  },
}
