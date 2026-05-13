return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    keys = {
      { "<leader>co", "<cmd>ToggleTerm direction='horizontal' size=(vim.o.rows * 0.40)<CR>" },
    },
    opts = {
      open_mapping = [[<c-\]],
      start_in_insert = true,
      autochdir = true,
      direction = "horizontal",
      size = function(term)
        if term.direction == "horizonal" then
          return vim.o.rows * 0.40
        elseif term.direction == "version" then
          return vim.o.columns * 0.55
        elseif term.direction == "float" then
          return vim.o.columns * 0.4
        end
      end,
    },
    config = function()
      require("toggleterm").setup({})
      local Terminal = require("toggleterm.terminal").Terminal

      vim.keymap.set({ "n", "v" }, "<leader>cs", "<CMD>ToggleTermSendVisualSelection<CR>")

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc> co", [[<C-\><C-n]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          vim.api.nvim_buf_del_keymap(0, "t", "jk")
          vim.api.nvim_buf_del_keymap(0, "t", "<C-h>")
          vim.api.nvim_buf_del_keymap(0, "t", "<C-j>")
          vim.api.nvim_buf_del_keymap(0, "t", "<C-k>")
          vim.api.nvim_buf_del_keymap(0, "t", "<C-w>")
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      -- function _lazygit_toggle()
      --   lazygit:toggle()
      -- end

      -- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end,
  },
}
