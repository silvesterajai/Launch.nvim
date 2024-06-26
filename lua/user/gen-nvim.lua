local M = {
  "David-Kunz/gen.nvim",
  config = true,
}

function M.config()
  local gen = require "gen"
  local opts = {
    model = "llama3:latest", -- The default model to use.
    host = "localhost", -- The host running the Ollama service.
    port = "11434", -- The port on which the Ollama service is listening.
    quit_map = "q", -- set keymap for close the response window
    retry_map = "<c-r>", -- set keymap to re-send the current prompts
    display_mode = "split", -- The display mode. Can be "float" or "split".
    show_prompt = false, -- Shows the prompt submitted to Ollama.
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false, -- Never closes the window automatically.
    debug = false, -- Prints errors and the command which is run.
  }

  gen.setup(opts)
  gen.prompts["Explain_Code"] = {
    prompt = "Explain the following code in plain English:\n$text",
    model = "zephyr:7b-beta",
    replace = false,
  }
  gen.prompts["Fix_Code"] = {
    prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    replace = true,
    model = "zephyr:7b-beta",
    extract = "```$filetype\n(.-)```",
  }
  gen.prompts["Code_Suggestions"] = {
    prompt = "Review the following $filetype code and make concise suggestions:\n```$filetype\n$text\n```",
    replace = false,
    model = "zephyr:7b-beta",
  }
end

return M
