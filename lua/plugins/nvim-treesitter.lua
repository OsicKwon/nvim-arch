return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({
                -- enable syntax highlighting
                highlight = {
                    enable = true,
                    -- Disable highlighting for specific filetypes
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    -- Use this to debug highlight issues
                    additional_vim_regex_highlighting = false,
                },
                -- enable indentation
                indent = { enable = true },
                -- enable autotagging (w/ nvim-ts-autotag plugin)
                autotag = { enable = true },
                -- ensure these language parsers are installed
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "markdown",
                    "markdown_inline",
                    "svelte",
                    "graphql",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                },
                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- automatically jump forward to matching textobj
                        keymaps = {
                            -- you can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            })

            -- Workaround for the "(delimiter) @markup.heading.1" error
            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.markdown = {
                install_info = {
                    url = "https://github.com/ikatyang/tree-sitter-markdown",
                    files = { "src/parser.c", "src/scanner.cc" },
                    branch = "master",
                },
                filetype = "markdown",
            }

            -- Error logging function
            local function log_treesitter_error(msg)
                vim.api.nvim_err_writeln("[Treesitter] " .. msg)
            end

            -- Override the default highlight function to catch errors
            local orig_highlight = vim.treesitter.highlight
            vim.treesitter.highlight = function(...)
                local status, result = pcall(orig_highlight, ...)
                if not status then
                    log_treesitter_error("Highlight error: " .. result)
                    return
                end
                return result
            end
        end,
    },
}
