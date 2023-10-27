return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup({
      sections = {
        lualine_c = { 'vim.fn.expand("%p")' },
        lualine_x = {
          'encoding',
          'filetype',
        },
      }
    })
  end
}
