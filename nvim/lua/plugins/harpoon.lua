return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
      },
    })
    vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { noremap = true })
  end,
}
