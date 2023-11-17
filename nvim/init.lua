local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
vim.g.markdown_folding = 1   -- enable markdown folding


if vim.g.vscode then
  -- lua config for vscode for nnoremap mode
  vim.api.nvim_set_keymap('n', '<C-j>', ":call VSCodeNotify('workbench.action.navigateDown')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-k>', ":call VSCodeNotify('workbench.action.navigateUp')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-h>', ":call VSCodeNotify('workbench.action.navigateLeft')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-l>', ":call VSCodeNotify('workbench.action.navigateRight')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-w>_ ', ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<Space>;', ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })

  -- lua config for vscode for xnoremap mode
  vim.api.nvim_set_keymap('x', '<C-j>', ":call VSCodeNotify('workbench.action.navigateDown')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', '<C-k>', ":call VSCodeNotify('workbench.action.navigateUp')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', '<C-h>', ":call VSCodeNotify('workbench.action.navigateLeft')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', '<C-l>', ":call VSCodeNotify('workbench.action.navigateRight')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', '<C-w>_ ', ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap('x', '<Space>;', ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })
else

  vim.o.guicursor = table.concat({
    "i-ci:ver30-block-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250",
  }, ",")

  -- vim.opt.foldmethod = "expr"
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  -- vim.opt.foldlevel = 99

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
  })


  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "set fo-=c fo-=r fo-=o"
  })

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
