return {
  -- "olimorris/onedarkpro.nvim",
  -- 'navarasu/onedark.nvim',

  -- 'projekt0n/github-nvim-theme',
  -- "rebelot/kanagawa.nvim",

  "catppuccin/nvim",
  -- name = "catppuccin",

  priority = 1000,
  config = function()
    -- require('onedark').setup {
    --   style = 'darker',
    --   transparent = true
    -- }
    -- vim.cmd.colorscheme "onedark"

    -- require('github-theme').setup()
    -- vim.cmd.colorscheme "github_dark"
    --
    -- require('kanagawa').setup({
    --   -- transparent = true,
    -- })
    -- vim.cmd('colorscheme kanagawa')

    --catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    vim.cmd.colorscheme "catppuccin-mocha"
  end,
}

