return {
  "jvgrootveld/telescope-zoxide",
  config = function()
    require("telescope").setup({
      extensions = {
        zoxide = {
          mappings = {
            default = {
              action = vim.schedule_wrap(function(selection)
                vim.cmd("tcd " .. selection.path)
              end),
              after_action = function(selection) end,
            },
          },
        },
      },
    })

    require("telescope").load_extension("zoxide")
  end,
}

