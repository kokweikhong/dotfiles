function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  -- "rose-pine/neovim",
  -- name = "rose-pine",
  config = function()
    require("tokyonight").setup()

    vim.cmd("colorscheme tokyonight-night")
    -- ColorMyPencils()
  end,
}
