return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    cmd = 'Telescope',
    version = false, -- telescope did only one release, so use HEAD for now
    opts = {
        defaults = {
            layout_config = {
                prompt_position = "top",
            },
            sorting_strategy = "ascending",
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
    end,
    -- keys = {
    --     { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    --     { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    --     { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    --     { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    -- },
}
