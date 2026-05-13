return {
  {
    "stevearc/conform.nvim",
    opts = function()
      ---@class ConformOpts
      return {
        -- LazyVim will use these options when formatting with the conform.nvim formatter
        default_format_opts = {
          timeout_ms = 1000,
        },
        formatters_by_ft = {
          lua = { "stylua" },
          sh = { "shfmt" },
          bash = { "shfmt" },
          python = { "isort", "black" },
          java = { "clang_format" },
          go = { "gofmt" },
          rust = { "rustfmt" },
          cpp = { "clang_format" },
          javascript = { "deno_fmt" },
          typescript = { "deno_fmt" },
          markdown = { "deno_fmt", "mdslw", "mdsf", "markdown-toc" },
          yaml = { "yq" },
          json = { "deno" },
          ["_"] = { "clang_format" }, -- if not, clang_format not work for .h file
        },
        -- LazyVim will merge the options you set here with builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string,table>
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   extra_args = { "-i", "2", "-ci" },
          -- },
          clang_format = { extra_args = { "--style=file" } },
        },
      }
    end,
  },
}
