return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  keys = {
    { "a,", mode = "o" },
    { "i,", mode = "o" },
    { "it", mode = "o" },
    { "af", mode = "o" },
    { "ac", mode = "o" },
    { "if", mode = "o" },
    { "ic", mode = "o" },
    { "a,", mode = "v" },
    { "i,", mode = "v" },
    { "it", mode = "v" },
    { "af", mode = "v" },
    { "ac", mode = "v" },
    { "if", mode = "v" },
    { "ic", mode = "v" },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["i,"] = "@parameter.inner",
            ["a,"] = "@parameter.outer",
          },
          selection_modes = function(opts)
            if vim.bo.filetype == "python" then
              return {
                ["@class.outer"] = "V",
                ["@class.inner"] = "V",
                ["@function.outer"] = "V",
                ["@function.inner"] = "V",
              }
            end
          end,
        },
        move = {
          enable = false,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
        lsp_interop = {
          enable = false,
          peek_definition_code = {
            ["gD"] = "@function.outer",
          },
        },
      },
    })
  end,
}
