return {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle" },
    keys = {
        { "<C-_>", "<CMD>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Toggle Floaterm" },
        { "<leader>fn", "<CMD>FloatermNew<CR>", mode = "n", desc = "New Floaterm" },
        { "<leader>fp", "<CMD>FloatermPrev<CR>", mode = "n", desc = "Previous Floaterm" },
        { "<leader>fx", "<CMD>FloatermNext<CR>", mode = "n", desc = "Next Floaterm" },
    },
    init = function()
        -- Global configuration
        vim.g.floaterm_width = 0.8
        vim.g.floaterm_height = 0.8
        vim.g.floaterm_title = "Terminal ($1/$2)"
        vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
        vim.g.floaterm_autoinsert = true
        vim.g.floaterm_autohide = 2

        -- Set the toggle keymap as requested
        vim.g.floaterm_keymap_toggle = '<C-_>'

        -- Additional keymaps (these will work inside the terminal)
        vim.g.floaterm_keymap_new = '<F7>'
        vim.g.floaterm_keymap_prev = '<F8>'
        vim.g.floaterm_keymap_next = '<F9>'
        vim.g.floaterm_keymap_kill = '<F12>'

        -- Custom colors
        vim.cmd([[
        hi FloatermBorder guibg=NONE guifg=#875faf
        ]])
    end,
    config = function()
        -- Custom commands or additional setup can go here
        vim.api.nvim_create_user_command("FTLazygit", "FloatermNew lazygit", {})
        vim.api.nvim_create_user_command("FTRanger", "FloatermNew ranger", {})

        -- Keymaps for custom commands
        vim.keymap.set("n", "<leader>fg", ":FTLazygit<CR>", { noremap = true, silent = true, desc = "Lazygit in Floaterm" })
        vim.keymap.set("n", "<leader>fr", ":FTRanger<CR>", { noremap = true, silent = true, desc = "Ranger in Floaterm" })

        if vim.g.neovide then
            vim.keymap.set("n", "<C-/>", ":FloatermToggle<CR>", { silent = true })
            vim.keymap.set("t", "<C-/>", "<C-\\><C-n>:FloatermToggle<CR>", { silent = true })
        end
    end,
}
