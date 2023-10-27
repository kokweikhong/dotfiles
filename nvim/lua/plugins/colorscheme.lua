return {
  -- 'folke/tokyonight.nvim',
  -- branch = 'main',
  -- priority = 1000,
  -- "olimorris/onedarkpro.nvim",
  -- 'navarasu/onedark.nvim',
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- require("catppuccin").setup({
    --   flavour = "frappe",
    -- })
    -- vim.cmd.colorscheme 'tokyonight'
    -- vim.cmd.colorscheme "onedark"
    vim.cmd.colorscheme "catppuccin-frappe"
    -- require('onedark').setup {
    --   style = 'darker',
    --   transparent = true
    -- }
    -- require('onedark').load()
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
