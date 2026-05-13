return {
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = { "VeryLazy" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signs = true,
      keywords = {
        -- OBE: sdfsdaf
        -- FIX: sdfasdfasj
        -- TODO: sdfasdf
        -- HACK: dsfasdf
        -- WARN: sdfjasdkf
        -- PERF: sadfajsdf
        -- NOTE: sdafasdnfj
        -- TEST: sdafajsdkf
        -- PASS: sadfawujeiore
        -- FAIL: asdfaujiwer
        FIX = { icon = "🚧", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        OBE = { icon = "" },
        TODO = { icon = "🛠", color = "info" },
        HACK = { icon = "⚠️", color = "warning" },
        WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "📶", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "🗒️", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING" } },
        PASS = { icon = "✅", color = "green", alt = { "PASSED", "DONE" } },
        FAIL = { icon = "🚫", color = "error", alt = { "FAILED" } },
      },
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "fg",
        keyword = "fg",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        green = { "#87E752" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" },
      },
    },
  },
}
