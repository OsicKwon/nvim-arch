return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")

        noice.setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- presets = {
            --     bottom_search = true,
            --     command_palette = true,
            --     long_message_to_split = true,
            --     inc_rename = false,
            --     lsp_doc_border = false,
            -- },
            views = {
                -- mini = {
                --     win_options = {
                --         winblend = 0,
                --     },
                -- },
                cmdline_popup = {
                    position = {
                        row = 5,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_showmode",
                        find = "recording",
                    },
                    opts = { skip = true },
                },
            },
            messages = {
                enabled = true,
                view = "notify",
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },
        })

        -- Macro recording state
        local macro_recording = false

        -- Function to show macro recording messages
        local function show_macro_recording(recording)
            macro_recording = recording
            local message = recording and "Recording macro..." or "Macro recording stopped"
            local level = recording and vim.log.levels.INFO or vim.log.levels.WARN

            vim.notify(message, level, {
                title = "Macro",
                icon = recording and "󰑋" or "󰑊",
                timeout = 1000,
                keep = function()
                    return macro_recording
                end,
            })
        end

        -- Autocommands to detect macro recording start/stop
        local macro_augroup = vim.api.nvim_create_augroup("MacroRecording", { clear = true })
        vim.api.nvim_create_autocmd("RecordingEnter", {
            group = macro_augroup,
            callback = function()
                show_macro_recording(true)
            end,
        })
        vim.api.nvim_create_autocmd("RecordingLeave", {
            group = macro_augroup,
            callback = function()
                -- Delay the notification slightly to ensure it's shown after recording stops
                vim.defer_fn(function()
                    show_macro_recording(false)
                end, 50)
            end,
        })
    end,
}
