return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        -- lualine_a = {
        --   mode = 'diagnostics',
        --   symbols = { error = ' ', warn = ' ', info = ' ' },
        -- },
        lualine_c = { 'vim.fn.expand("%p")' },
        lualine_x = {
          'encoding',
          'filetype',
        },
      }
    })
  end
}
