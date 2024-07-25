return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        -- config = function()
        --     require("catppuccin").setup({
        --         flavour = "mocha", -- latte, frappe, macchiato, mocha
        --         transparent_background = true,
        --         term_colors = true,
        --         -- other options...
        --     })

        --     -- Set the colorscheme
        --     vim.cmd.colorscheme "catppuccin"

        --     -- Ensure transparency
        --     vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })
        -- end,
    },
    -- other plugins...
}
