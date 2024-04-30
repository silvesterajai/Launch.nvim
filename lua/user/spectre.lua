
local M = {
  "nvim-pack/nvim-spectre",
}

function M.config()
  require("spectre").setup {
    enabled = true, -- vim.g.config.plugins.spectre.enable,
  }
end

local which_key = require "which-key"
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  r = {
    name = "spectre",
    r = { "<cmd>lua require 'spectre'.toggle()<cr>", "Toggle search and replace" },
    w = { "<cmd>lua require 'spectre'.open_visual({ select_word = true })<cr>", "Search current word"},
    f = { "<cmd>lua require 'spectre'.open_file_search({ select_word = true })<cr>", "Search in current file"},
  },
}
which_key.register(mappings, opts)

return M

