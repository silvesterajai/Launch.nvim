local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  require("which-key").setup()
  local wk = require "which-key"
  wk.add {
    -- { "<leader>c", group = "[C]ode" },
    -- { "<leader>d", group = "[D]ocument" },

    -- Neogit
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },

    -- LSP
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
    { "<leader>lD", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },

    -- NvimTree
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },

    -- neotest
    { "<leader>tt", "<cmd>lua require'neotest'.run.run()<cr>", desc = "Test Nearest" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test File" },
    { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug Test" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Test Stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach Test" },

    -- gitsigns
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },

    -- spectre
    {
      mode = { "n" }, -- NORMAL mode
      { "<leade>rr", "<cmd>lua require 'spectre'.toggle()<cr>", desc = "Toggle search and replace" },
      {
        "<leader>rw",
        "<cmd>lua require 'spectre'.open_visual({ select_word = true })<cr>",
        desc = "Search current word",
      },
      {
        "<leader>rf",
        "<cmd>lua require 'spectre'.open_file_search({ select_word = true })<cr>",
        desc = "Search in current file",
      },
    },

    -- Telescope
    { "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { "<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },

    -- comment
    { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment", mode = "v" },

    -- GitLink
    { "<leader>gy", "<cmd>GitLink!<cr>", desc = "Git link" },
    { "<leader>gY", "<cmd>GitLink blam<cr>", desc = "Git link blame" },

    -- Navbuddy
    { "<leader>o", "<cmd>Navbuddy<cr>", desc = "Nav" },

    -- conform
    {
      "<leader>cf",
      "<cmd>lua require('conform').format { async = true, lsp_fallback = true }<cr>",
      desc = "Format",
    },
  }
end
return M
