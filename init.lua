-- 2024-07-13

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


-- Ensure transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })


-- long lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true})



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


-- tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4


-- split
vim.opt.splitbelow = true
vim.opt.splitright = true


-- case ignore
vim.opt.ignorecase =true
vim.o.smartcase =true


-- Always show tabline
vim.opt.showtabline = 2


-- path
vim.opt.autochdir = true


-- KEYMAP
-- 2024-07-14

-- -- -- telescope
-- vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
-- vim.keymap.set("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", { desc = "Old Files" })
-- vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>y", "<cmd>Telescope filetypes<cr>", { desc = "File Types" })
-- vim.keymap.set("n", "<leader>s", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy Find" })
-- vim.keymap.set("n", "<leader>r", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })


-- FzfLua
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>h", "<cmd>FzfLua oldfiles<cr>", { desc = "Old Files" })
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>y", "<cmd>FzfLua filetypes<cr>", { desc = "File Types" })
vim.keymap.set("n", "<leader>s", "<cmd>FzfLua blines<cr>", { desc = "Fuzzy Find" })
vim.keymap.set("n", "<leader>r", "<cmd>FzfLua grep<cr>", { desc = "Live Grep" })

-- Others
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>d", "<cmd>Trouble<cr>", { desc = "Trouble Diagnosis" })
vim.keymap.set("n", "<leader>c", "<cmd>changes<cr>", { desc = "changes" })
vim.keymap.set("n", "<leader>t", "<cmd>Tagbar<cr>", { desc = "Tagbar" })

vim.keymap.set("n", "<leader>k", "<cmd>checkhealth<cr>", { desc = "checkhealth" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })
vim.keymap.set("n", "<leader><space>", ":", { desc = "Command" })


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
