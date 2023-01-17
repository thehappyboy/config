return {
  "p00f/nvim-ts-rainbow",
  config = function()
    require("nvim-treesitter.configs").setup({
      rainbow = { enable = true },
    })

    vim.cmd("highlight! link rainbowcol1 GruvboxOrangeBold")
    vim.cmd("highlight! link rainbowcol2 GruvboxPurpleBold")
    vim.cmd("highlight! link rainbowcol3 GruvboxBlueBold")
    vim.cmd("highlight! link rainbowcol4 GruvboxYellowBold")
    vim.cmd("highlight! link rainbowcol5 GruvboxAquaBold")
    vim.cmd("highlight! link rainbowcol6 GruvboxRedBold")
    vim.cmd("highlight! link rainbowcol7 GruvboxGrayBold")
  end,
}
