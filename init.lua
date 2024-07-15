-- 2024-07-13

-- change leader-key
-- vim.g.mapleader = "K"

-- Built-in package manaer
-- require'lspconfig'.pyright.setup{}

-- lazy.nvim
require("config.lazy")  -- Loading Lazy.nvim package manager
-- require("lazy").setup("plugins")


-- flash
require("flash").toggle()  -- enabled 'jump label' as default


-- lualine
-- require('lualine').get_config()
-- require('lualine').setup()


-- auto reaload buffer when changed externally 2024-07-12
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
    pattern = "*",
    command = "checktime"
})

-- Neovide Configuration :: https://neovide.dev/configuration.html
if vim.g.neovide then
    -- Scale
    vim.g.neovide_scale_factor = 1.0
    -- Neovide configuration
    vim.g.neovide_transparency = 0.9
    -- padding
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 10
    vim.g.neovide_padding_right = 10
    vim.g.neovide_padding_left = 10
    -- animation
    vim.g.neovide_cursor_vfx_mode = "pixiedust"

end


-- Plugin Options
vim.notify = require("notify")


-- colorscheme
vim.cmd.colorscheme "catppuccin"


-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s %l %r "


-- split
vim.opt.splitbelow = true
vim.opt.splitright = true


-- case ignore
vim.opt.ignorecase =true
vim.o.smartcase =true


-- path
vim.opt.autochdir = true

-- KEYMAP
-- 2024-07-14
-- -- telescope
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", { desc = "Old Files" })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>y", "<cmd>Telescope filetypes<cr>", { desc = "File Types" })

vim.keymap.set("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy Find" })
vim.keymap.set("n", "<leader>r", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

vim.keymap.set("n", "<leader>t", "<cmd>Tagbar<cr>", { desc = "Tagbar" })
vim.keymap.set("n", "<leader>n", "<cmd>Neotree<cr>", { desc = "Neotree" })

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>T", "<cmd>Trouble<cr>", { desc = "Trouble" })
vim.keymap.set("n", "<leader>c", "<cmd>changes<cr>", { desc = "changes" })

vim.keymap.set("n", "<leader>k", "<cmd>checkhealth<cr>", { desc = "checkhealth" })


-- local fidget = require("fidget")

-- vim.keymap.set("n", "A", function()
--   fidget.notify("This is from fidget.notify().")
-- end)

-- vim.keymap.set("n", "B", function()
--   fidget.notify("This is also from fidget.notify().", vim.log.levels.WARN)
-- end)

-- vim.keymap.set("n", "C", function()
--   fidget.notify("fidget.notify() supports annotations...", nil, { annote = "MY NOTE", key = "foobar" })
-- end)

-- vim.keymap.set("n", "D", function()
--   fidget.notify(nil, vim.log.levels.ERROR, { annote = "bottom text", key = "foobar" })
--   fidget.notify("... and overwriting notifications.", vim.log.levels.WARN, { annote = "YOUR AD HERE" })
-- end)



-- EOL --
