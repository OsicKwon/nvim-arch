return {
    "nvim-lua/lsp-status.nvim",
    event = "LspAttach",
    config = function()
        local lsp_status = require('lsp-status')

        -- Configure lsp-status
        lsp_status.config({
            indicator_errors = '✗',
            indicator_warnings = '⚠',
            indicator_info = 'ℹ',
            indicator_hint = '➤',
            indicator_ok = '✔',
            current_function = true,
            diagnostics = true,
            select_symbol = nil,
            update_interval = 100,
            status_symbol = '🇻',
            show_filename = false,
        })

        -- Register the progress handler
        lsp_status.register_progress()

        -- Integrate with nvim-lspconfig if you're using it
        local lspconfig = require('lspconfig')
        local on_attach = function(client, bufnr)
            lsp_status.on_attach(client)
            -- Add any other on_attach functions you might have here
        end

        -- -- Example of configuring a language server with lsp-status
        -- lspconfig.pyright.setup({
        --     handlers = lsp_status.extensions.pyright.setup(),
        --     settings = {
        --         python = {
        --             analysis = {
        --                 typeCheckingMode = "off"
        --             }
        --         }
        --     },
        --     on_attach = on_attach,
        --     capabilities = vim.tbl_extend('keep', lsp_status.capabilities, lspconfig.util.default_config.capabilities or {}),
        -- })

        -- You can repeat this pattern for other language servers

        -- Set up statusline (if you're using a custom statusline)
        -- vim.o.statusline = '%{%v:lua.require("lsp-status").status()%}'

        -- If you're using a statusline plugin like lualine, you can integrate lsp-status like this:
        -- require('lualine').setup {
        --   sections = {
        --     lualine_c = {
        --       {
        --         'lsp_progress',
        --         display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
        --         spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
        --       },
        --     }
        --   }
        -- }
    end
}
