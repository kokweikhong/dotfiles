local n_keymap = function(map, func)
  vim.api.nvim_set_keymap('n', map,
    "<cmd>lua require('telescope.builtin')." .. func .. "(require('telescope.themes').get_dropdown({}))<CR>",
    { noremap = true, silent = true })
end
local n_keymap_ivy = function(map, func)
  vim.api.nvim_set_keymap('n', map,
    "<cmd>lua require('telescope.builtin')." .. func .. "(require('telescope.themes').get_ivy({}))<CR>",
    { noremap = true, silent = true })
end

n_keymap('<C-p>', "find_files")
n_keymap('<C-\\>', "buffers")
-- n_keymap('<C-g>', "grep_string")
n_keymap('<C-g>', "live_grep")
n_keymap('<C-q>', "quickfix")
n_keymap('<C-l>', "loclist")
n_keymap('<C-e>', "diagnostics")

n_keymap('<leader>fd', "lsp_definitions")
n_keymap('<leader>fr', "lsp_references")
n_keymap('<leader>fs', "lsp_document_symbols")
n_keymap('<leader>fss', "lsp_workspace_symbols")
-- n_keymap('<leader>fa', "lsp_code_actions")
n_keymap('<leader>fa', "lsp_implementations")
n_keymap('<leader>fe', "lsp_document_diagnostics")
n_keymap('<leader>fee', "lsp_workspace_diagnostics")
n_keymap_ivy('<leader>fk', "keymaps")
n_keymap('<leader>fh', "help_tags")
n_keymap_ivy('<leader>fn', "notify")
-- n_keymap('<Leader>fv', "current_buffer_fuzzy_find")
return {

  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          }
        },
      }

      -- Enable telescope fzf native, if installed
      require('telescope').load_extension('fzf')
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
  },

}

-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
