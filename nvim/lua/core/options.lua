vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable mouse mode
vim.opt.mouse = "a"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Decrease update time
vim.opt.updatetime = 250
-- vim.opt.timeout = true
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "80"

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"

-- fold method, za to toggle
vim.opt.fillchars:append({ fold = " " })
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1 -- enable markdown folding
