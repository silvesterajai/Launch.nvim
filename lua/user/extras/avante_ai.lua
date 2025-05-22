local M = {
  "yetone/avante.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

function M.config()
  local avante = require "avante"
  avante.setup {
    provider = "ollama",
    -- openai = {
    --   endpoint = "http://localhost:11434/endpoint/v1",
    --   -- model = "zephyr:7b-beta",
    --   model = "llama3:latest",
    --   timeout = 30000, -- Timeout in milliseconds
    --   temperature = 0,
    --   max_tokens = 4096,
    --   ["local"] = true,
    -- },
    vendors = {
      ollama = {
        ["local"] = true,
        endpoint = "http://localhost:11434/",
        -- model = "codegemma",
        model = "llama3.1:latest",
        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/api/chat",
            headers = {
              ["Content-Type"] = "application/json",
            },
            body = {
              model = "llama3.1",
              messages = require("avante.providers").openai.parse_message(code_opts), -- you can make your own message, but this is very advanced
              max_tokens = 2048,
              stream = false,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          require("avante.providers").openai.parse_response(data_stream, event_state, opts)
        end,
      },
    },
  }
end

return M
