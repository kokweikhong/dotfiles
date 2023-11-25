return {
  -- "olimorris/onedarkpro.nvim",
  -- 'navarasu/onedark.nvim',

  'projekt0n/github-nvim-theme',

  -- "catppuccin/nvim",
  -- name = "catppuccin",

  priority = 1000,
  config = function()
    -- require('onedark').setup {
    --   style = 'darker',
    --   transparent = true
    -- }
    -- vim.cmd.colorscheme "onedark"

    require('github-theme').setup()
    vim.cmd.colorscheme "github_dark"

    --catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    -- vim.cmd.colorscheme "catppuccin-macchiato"
  end,
}
--
-- return {
--   'rose-pine/neovim',
--   name = 'rose-pine',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require('rose-pine').setup({
--       -- disable_background = true,
--     })
--     vim.cmd('colorscheme rose-pine')
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require('kanagawa').setup({
--       -- transparent = true,
--     })
--
--     vim.cmd('colorscheme kanagawa')
--   end,
-- }
