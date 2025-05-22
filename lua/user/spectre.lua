
local M = {
  "nvim-pack/nvim-spectre",
}

function M.config()
  require("spectre").setup {
    enabled = true, -- vim.g.config.plugins.spectre.enable,
  }
end


local wk = require("which-key")
wk.add({
  { "<leader>S", group = "Spectre" }, -- group
  { "<leader>Ss", '<cmd>lua require("spectre").toggle()<CR>', desc = "Search current word", mode = "n" },
  { "<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search current word", mode = "n" },
  { "<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search current word", mode = "v" },
  { "<leader>Sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search on current file" },

})
return M

