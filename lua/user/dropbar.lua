local utils = require("user.functions")

local M = {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufNewFile" },
  enabled = utils.isNeovimVersionsatisfied(10),
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }
  -- keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
  keymap("n", "Q", ":lua require('bufdelete').bufdelete(0, false)<cr>", opts)
end

return M
