local servers = {
  "lua_ls",
  "gopls",
  "pyright",
  "tailwindcss",
  -- "ts_ls",
  "tsserver",
  "html",
  "cssls",
  "jsonls",
  "emmet_ls",
  "templ",
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",         -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    require("mason-lspconfig").setup()

    require("mason-lspconfig").setup_handlers({
      -- Will be called for each installed server that doesn't have
      -- a dedicated handler.
      --
      function(server_name) -- default handler (optional)
        -- https://github.com/neovim/nvim-lspconfig/pull/3232
        if server_name == "tsserver" then
          server_name = "ts_ls"
        end
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server_name].setup({

          capabilities = capabilities,
        })
      end,
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "isort",
        "black",
        "goimports",
        "eslint_d",
      },
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local lspconfig = require("lspconfig")

    -- for _, lsp in ipairs(servers) do
    --   lspconfig[lsp].setup({
    --     -- on_attach = my_custom_on_attach,
    --     capabilities = capabilities,
    --   })
    -- end

    lspconfig.tailwindcss.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "templ", "astro", "javascript", "typescript", "react" },
      init_options = { userLanguages = { templ = "html" } },
    })

    lspconfig.html.setup({
      -- on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "templ" },
    })

    -- lspconfig.HTMX.setup({
    --   -- on_attach = on_attach,
    --   capabilities = capabilities,
    --   filetypes = { "html", "templ" },
    -- })

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-,>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
    -- luasnip setup
    local luasnip = require("luasnip")

    -- nvim-cmp setup
    local cmp = require("cmp")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
        ["<C-d>"] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ["<C-e>"] = cmp.mapping.abort(),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
            --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
          elseif has_words_before() then
            cmp.complete()
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
    })
  end,
}
