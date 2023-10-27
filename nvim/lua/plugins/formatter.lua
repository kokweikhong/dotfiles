return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        go = {
          require("formatter.filetypes.go").goimports,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })

    vim.api.nvim_set_keymap("n", "<leader>fm", "<cmd>Format<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>Fm", "<cmd>FormatWrite<cr>", { noremap = true, silent = true })

    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    -- 	command = "FormatWriteLock",
    -- })
  end,
}
