vim.cmd("filetype plugin indent on")
-- vim.opt.clipboard = "unnamedplus"
require("settings.init")

vim.api.nvim_exec([[let &t_ut='']], true)

vim.cmd([[
  tnoremap <silent> <ESC> <C-\><C-n>
]])

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
  "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

if vim.g.vscode then
  -- lua config for vscode for nnoremap mode
  vim.api.nvim_set_keymap(
    "n",
    "<C-j>",
    ":call VSCodeNotify('workbench.action.navigateDown')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-k>",
    ":call VSCodeNotify('workbench.action.navigateUp')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-h>",
    ":call VSCodeNotify('workbench.action.navigateLeft')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-l>",
    ":call VSCodeNotify('workbench.action.navigateRight')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-w>_ ",
    ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("n", "<Space>;", ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })

  -- lua config for vscode for xnoremap mode
  vim.api.nvim_set_keymap(
    "x",
    "<C-j>",
    ":call VSCodeNotify('workbench.action.navigateDown')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "x",
    "<C-k>",
    ":call VSCodeNotify('workbench.action.navigateUp')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "x",
    "<C-h>",
    ":call VSCodeNotify('workbench.action.navigateLeft')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "x",
    "<C-l>",
    ":call VSCodeNotify('workbench.action.navigateRight')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "x",
    "<C-w>_ ",
    ":call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap("x", "<Space>;", ":call VSCodeNotify('whichkey.show')<CR>", { noremap = true, silent = true })
else
  vim.o.guicursor = table.concat({
    "i-ci:ver30-block-Cursor/lCursor-blinkwait700-blinkoff400-blinkon250",
  }, ",")

  -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  --   pattern = { "*" },
  --   command = [[%s/\s\+$//e]],
  -- })

  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function(args)
      local save_cursor = vim.fn.getpos(".")
      pcall(function()
        vim.cmd([[%s/\s\+$//e]])
        require("conform").format({ bufnr = args.bufnr })
      end)
      vim.fn.setpos(".", save_cursor)
    end,
  })

  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "set fo-=c fo-=r fo-=o",
  })

  -- remove line lenght marker for selected filetypes
  vim.cmd([[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]])

  -- 2 spaces for selected filetypes
  vim.cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,javascriptreact,lua,yaml setlocal shiftwidth=2 tabstop=2
]])

  -----------------------------------------------------------
  -- Terminal
  -----------------------------------------------------------
  -- open a terminal pane on the right using :Term
  vim.cmd([[command Term :split term]])

  -- Terminal visual tweaks
  --- enter insert mode when switching to terminal
  --- close terminal buffer on process exit
  vim.cmd([[
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
  autocmd TermOpen * startinsert
  autocmd BufLeave term://* stopinsert
]])

  vim.cmd([[
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1roup remember_folds
  augroup END
]])

  -- Install package manager
  --    https://github.com/folke/lazy.nvim
  --    `:help lazy.nvim.txt` for more info
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
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
