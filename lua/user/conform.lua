local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
    lsp_fallback = true,
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "biome" },
      jsonc = { "biome" },
      markdown = { "deno_fmt" },
      sh = { "shfmt" },
      yaml = { "yamlfmt" },
      rust = { "rustfmt" },
      python = { "ruff_format" },
    },
    format_on_save = function(bufnr)
      if vim.api.nvim_buf_line_count(bufnr) >= 5000 then
        return
      end
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  }
end
vim.api.nvim_create_user_command("FormatDisable", function(args)
  vim.g.disable_autoformat = true
end, {
  desc = "Disable autoformat-on-save",
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
return M

