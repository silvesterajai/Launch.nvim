local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "AndreM222/copilot-lualine",
  },
}

-- LSP clients attached to buffer 
local clients_lsp = function ()
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return '' end
    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end
    return '\u{f085} ' .. table.concat(c, '|')
end

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { clients_lsp, "diagnostics" },
      lualine_x = { "copilot", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
