return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
    require("formatter").setup({
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        css = {
          require("formatter.filetypes.css").prettier,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
          require("formatter.filetypes.javascript").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
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

    vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Format<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>Fm", "<cmd>FormatWrite<cr>", { noremap = true, silent = true })

    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    -- 	command = "FormatWriteLock",
    -- })
  end,
}
