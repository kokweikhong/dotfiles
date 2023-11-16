vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vscode
if vim.g.vscode then
  vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
else
  -- vim.opt.showmode = true
  -- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
  vim.o.guicursor = table.concat({
    -- "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
    -- "i-ci:block-Cursor/lCursor-blinkwait10k00-blinkon100-blinkoff100",
    "i-ci:ver30-block-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250",
    -- "i-ci:ver25-Cursor/lCursor-blinkwait10:w00",
    -- "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
  }, ",")
  -- vim.o.guicursor = "i:block"

  vim.opt.hlsearch = false
  vim.opt.incsearch = true

  -- Make line numbers default
  vim.opt.number = true
  vim.opt.relativenumber = true

  -- Enable mouse mode
  vim.opt.mouse = 'a'

  -- Sync clipboard between OS and Neovim.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.opt.clipboard = 'unnamedplus'

  -- Enable break indent
  vim.opt.breakindent = true

  -- Save undo history
  vim.opt.undofile = true

  -- Case insensitive searching UNLESS /C or capital in search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Keep signcolumn on by default
  vim.opt.signcolumn = 'yes'

  -- Decrease update time
  vim.opt.updatetime = 50
  vim.opt.timeout = true
  vim.opt.timeoutlen = 300

  -- Set completeopt to have a better completion experience
  vim.opt.completeopt = 'menuone,noselect'

  -- NOTE: You should make sure your terminal supports this
  vim.opt.termguicolors = true

  vim.cmd('filetype plugin indent on')
  vim.o.shortmess = vim.o.shortmess .. 'c'
  -- vim.opt.hidden = true
  vim.o.whichwrap = 'b,s,<,>,[,],h,l'
  vim.o.pumheight = 10
  vim.o.fileencoding = "utf-8"
  vim.o.cmdheight = 2
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.conceallevel = 0
  vim.o.showtabline = 0
  vim.o.showmode = true
  -- vim.o.showmode = false
  vim.o.backup = false
  vim.o.writebackup = false
  vim.o.updatetime = 200
  vim.o.timeoutlen = 500
  vim.o.clipboard = "unnamedplus"
  vim.o.ignorecase = true
  vim.o.scrolloff = 3
  vim.o.sidescrolloff = 5
  vim.o.mouse = "a"

  vim.o.tabstop = 4
  vim.bo.tabstop = 4
  vim.o.softtabstop = 4
  vim.bo.softtabstop = 4
  vim.o.shiftwidth = 4
  vim.bo.shiftwidth = 4
  --
  vim.wo.wrap = false
  vim.wo.number = true
  vim.wo.cursorline = true
  vim.wo.signcolumn = "yes"

  vim.o.autoindent = true
  vim.bo.autoindent = true
  vim.o.expandtab = true
  vim.bo.expandtab = true


  vim.api.nvim_exec([[let &t_ut='']], true)

  vim.cmd [[
  tnoremap <silent> <ESC> <C-\><C-n>
]]


  -- Disable builtins plugins
  local disabled_built_ins = {
    -- "netrw",
    -- "netrwPlugin",
    -- "netrwSettings",
    -- "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
  }

  vim.api.nvim_set_option_value("colorcolumn", "79", {})

  for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
  end

  -- fold method, za to toggle
  vim.opt.fillchars:append({ fold = " " })
  vim.opt.foldmethod = "indent"
  vim.opt.foldenable = false
  vim.opt.foldlevel = 99
  vim.g.markdown_folding = 1 -- enable markdown folding

  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  -- vim.opt.foldlevel = 99
  --
  --
  -- local vim = vim
  -- local api = vim.api
  -- local M = {}
  -- -- function to create a list of commands and convert them to autocommands
  -- -------- This function is taken from https://github.com/norcalli/nvim_utils
  -- function M.nvim_create_augroups(definitions)
  --     for group_name, definition in pairs(definitions) do
  --         api.nvim_command('augroup '..group_name)
  --         api.nvim_command('autocmd!')
  --         for _, def in ipairs(definition) do
  --             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
  --             api.nvim_command(command)
  --         end
  --         api.nvim_command('augroup END')
  --     end
  -- end


  -- local autoCommands = {
  --     -- other autocommands
  --     open_folds = {
  --         {"BufReadPost,FileReadPost", "*", "normal zR"}
  --     }
  -- }

  -- M.nvim_create_augroups(autoCommands)

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
  })


  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "set fo-=c fo-=r fo-=o"
  })

  -- don't auto commenting new lines
  -- vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

  -- remove line lenght marker for selected filetypes
  vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

  -- 2 spaces for selected filetypes
  vim.cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,javascriptreact,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

  -----------------------------------------------------------
  -- Terminal
  -----------------------------------------------------------
  -- open a terminal pane on the right using :Term
  vim.cmd [[command Term :split term]]

  -- Terminal visual tweaks
  --- enter insert mode when switching to terminal
  --- close terminal buffer on process exit
  vim.cmd [[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]]
  -- autocmd BufWinLeave * mkview
  -- autocmd BufWinEnter * silent! loadview
  -- autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  -- autocmd BufWinEnter ?* silent! loadviewutocmd!
  -- require("statusline")

  vim.cmd [[
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1roup remember_folds
  augroup END
]]

  -- Install package manager
  --    https://github.com/folke/lazy.nvim
  --    `:help lazy.nvim.txt` for more info
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup("plugins", {
    ui = {
      icons = {
        cmd = "⌘",
        config = "🛠",
        event = "📅",
        ft = "📂",
        init = "⚙",
        keys = "🗝",
        plugin = "🔌",
        runtime = "💻",
        source = "📄",
        start = "🚀",
        task = "📌",
        lazy = "💤 ",
      },
    },
  })
end
