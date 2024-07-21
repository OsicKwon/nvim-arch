return {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
        require('fidget').setup {
            notification = {
                override_vim_notify = true,
                window = {
                    winblend = 0,
                },
            },
            -- Turn on LSP progress
            progress = {
                poll_rate = 0.1,
                suppress_on_insert = false,
                ignore_done_already = false,
                ignore_empty_message = false,
            },
        }
        require("fidget").notify("Started!")
    end,
    opts = {
        progress = {
            ignore = { "null-ls", "null_ls", "none-ls", "none_ls" },
        },
    },
}
