return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<F2>", "<cmd>:Neotree reveal toggle<CR>" },
  },
  config = function()
    require("neo-tree").setup({
      -- window = {
      --   position = "float",
      -- },
      buffer = {
        follow_current_file = {
          enabled = true,
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "+",
          folder_open = "-",
          folder_empty = "#",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "m", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "i",
            unstaged = "u",
            staged = "s",
            conflict = "c",
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    })
    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  end,
}
