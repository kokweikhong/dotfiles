-- n_keymap('<Leader>fv', "current_buffer_fuzzy_find")
return {

  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "vendor/",
            ".next/",
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      })

      -- Enable telescope fzf native, if installed
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")

      local builtin = require("telescope.builtin")

      -- n_keymap('<C-p>', "find_files")
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({
          hidden = true,
          follow = true,
          no_ignore = true,
          previewer = false,
        })
      end, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
          hidden = true,
        })
      end, { desc = "[F]ind by [G]rep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
      -- vim.keymap.set('n', '<leader>fs', "grep_string", { desc = '[F]ind current [S]tring' })
      vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "[F]ind [D]efinitions" })
      vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[F]ind [R]eferences" })
      -- set document symbols
      vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "[F]ind document [S]ymbols" })
      vim.keymap.set("n", "<leader>fss", builtin.lsp_workspace_symbols, { desc = "[F]ind workspace [S]ymbols" })
      vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "[F]ind [Q]uickfix" })
      vim.keymap.set("n", "<leader>fl", builtin.loclist, { desc = "[F]ind [L]oclist" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
      vim.keymap.set("n", "<leader>fe", builtin.diagnostics, { desc = "[F]ind [E]rrors" })

      -- vim.keymap.set('n', '<leader>fee', builtin.lsp_workspace_diagnostics, { desc = '[F]ind [E]rrors [E]verywhere' })
      vim.keymap.set("n", "<leader>fc", function()
        require("telescope").extensions.file_browser.file_browser()
      end, { desc = "[F]ile [O]pen" })
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = "make",
  },
}
