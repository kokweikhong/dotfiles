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
    vim.keymap.set("n", "<leader>hh", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { noremap = true, desc = "[Harpoon] Toggle quick menu" }) -- Toggle quick menu
    vim.keymap.set("n", "<leader>hf", function()
      require("harpoon.mark").add_file()
    end, { noremap = true, desc = "[Harpoon] Add file" }) -- Add file to harpoon
    vim.keymap.set("n", "<leader>hj", function()
      require("harpoon.ui").nav_next()
    end, { noremap = true, desc = "[Harpoon] Next" }) -- Next file
    vim.keymap.set("n", "<leader>hk", function()
      require("harpoon.ui").nav_prev()
    end, { noremap = true, desc = "[Harpoon] Previous" }) -- Previous file
  end,
}
