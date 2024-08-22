
local M = {
  "nvim-pack/nvim-spectre",
}

function M.config()
  require("spectre").setup {
    enabled = true, -- vim.g.config.plugins.spectre.enable,
  }
end

return M

