return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")

        -- Configure notify
        notify.setup({
            background_colour = "#000000",
            fps = 30,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            level = 2,
            minimum_width = 50,
            render = "default",
            stages = "fade_in_slide_out",
            timeout = 5000,
            top_down = true
        })

        -- Override vim.notify with nvim-notify
        vim.notify = notify

        -- Custom spinner frames
        local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }

        -- LSP progress handler
        local client_notifs = {}

        local function get_notif_data(client_id, token)
            if not client_notifs[client_id] then
                client_notifs[client_id] = {}
            end

            if not client_notifs[client_id][token] then
                client_notifs[client_id][token] = {
                    spinner = 1,
                    spinner_frames = spinner_frames,
                }
            end

            return client_notifs[client_id][token]
        end

        local function update_spinner(client_id, token)
            local notif_data = get_notif_data(client_id, token)

            if notif_data.spinner then
                local new_spinner = (notif_data.spinner + 1) % #notif_data.spinner_frames
                notif_data.spinner = new_spinner

                notif_data.notification = vim.notify(nil, nil, {
                    hide_from_history = true,
                    icon = notif_data.spinner_frames[new_spinner],
                    replace = notif_data.notification,
                })

                vim.defer_fn(function()
                    update_spinner(client_id, token)
                end, 100)
            end
        end

        local function format_title(title, client_name)
            return client_name .. (#title > 0 and ": " .. title or "")
        end

        local function format_message(message, percentage)
            return (percentage and percentage .. "%\t" or "") .. (message or "")
        end

        -- LSP integration
        vim.lsp.handlers["$/progress"] = function(_, result, ctx)
            local client_id = ctx.client_id

            local val = result.value

            if not val.kind then
                return
            end

            local notif_data = get_notif_data(client_id, result.token)

            if val.kind == "begin" then
                local message = format_message(val.message, val.percentage)

                notif_data.notification = vim.notify(message, "info", {
                    title = format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
                    icon = notif_data.spinner_frames[1],
                    timeout = false,
                    hide_from_history = false,
                })

                notif_data.spinner = 1
                update_spinner(client_id, result.token)
            elseif val.kind == "report" and notif_data then
                notif_data.notification = vim.notify(format_message(val.message, val.percentage), "info", {
                    replace = notif_data.notification,
                    hide_from_history = false,
                })
            elseif val.kind == "end" and notif_data then
            notif_data.notification = vim.notify(val.message and format_message(val.message) or "Complete", "info", {
                icon = "",
                replace = notif_data.notification,
                timeout = 3000,
            })

            notif_data.spinner = nil
        end
    end

    -- Utility function to show LSP references
    vim.lsp.handlers["textDocument/references"] = function(_, result, ctx, config)
        if not result or vim.tbl_isempty(result) then
            vim.notify("No references found", "info")
        else
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            vim.notify(string.format("%d references found", #result), "info", {
                title = client and client.name or "LSP",
            })
            vim.lsp.util.set_qflist(vim.lsp.util.locations_to_items(result, client.offset_encoding))
            vim.api.nvim_command("copen")
        end
    end
end
}
