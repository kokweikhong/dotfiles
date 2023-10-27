-- keymap for SymbolsOutline
vim.api.nvim_set_keymap('n', '<leader>o', ':SymbolsOutline<CR>', { noremap = true, silent = true })

return {
  'simrat39/symbols-outline.nvim',
  config = function()
    require("symbols-outline").setup()
  end
}
