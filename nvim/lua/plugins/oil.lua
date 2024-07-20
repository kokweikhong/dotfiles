return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
    })

    vim.api.nvim_set_keymap("n", "<leader>oo", '<cmd>lua require("oil").open()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<F2>", '<cmd>lua require("oil").open()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap(
      "n",
      "<leader>of",
      '<cmd>lua require("oil").open_float()<CR>',
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap("n", "<leader>oc", '<cmd>lua require("oil").close()<CR>', { noremap = true, silent = true })
  end,
}
