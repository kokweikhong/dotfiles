function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- "folke/tokyonight.nvim",
  -- lazy = false,
  -- priority = 1000,
  -- opts = {},
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- priority = 1000,
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup()
    vim.cmd("colorscheme gruvbox")
    --   -- require("tokyonight").setup()
    --   require("catppuccin").setup()
    --
    --   -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    --   vim.cmd("colorscheme catppuccin-macchiato")
    -- ColorMyPencils()
  end,
}
