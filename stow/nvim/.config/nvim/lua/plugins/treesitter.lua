return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        -- "vue",
        -- "svelte",

        -- low level
        "c",
        "cpp",
        "rust",
        "zig",

        -- high level
        "java",
        "kotlin",
        "python",
        "go",
        "haskell",

        -- scripting
        "bash",
        "awk",

        -- build
        "cmake",
        "dockerfile",

        -- config
        "json",
        "xml",
        "yaml",
        "toml",

        -- docs
        "doxygen",
        "markdown",
        "markdown_inline",

        -- git
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",

        -- misc
        "query", -- for treesitter queries
        "regex",
      },
    },
  },
}
