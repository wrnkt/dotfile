-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local del_keymap = vim.api.nvim_del_keymap
local unmap = vim.keymap.del

-- REMOVE DEFAULT KEYMAPS

-- Where windows start when hitting control keys
del_keymap("n", "<C-Up>")
del_keymap("n", "<C-Down>")
del_keymap("n", "<C-Left>")
del_keymap("n", "<C-Right>")

-- Move Lines
del_keymap("n", "<A-j>")
del_keymap("n", "<A-k>")
del_keymap("i", "<A-j>")
del_keymap("i", "<A-k>")
del_keymap("v", "<A-k>")
del_keymap("v", "<A-j>")
