-- crushed in typing 'f' -> fixed ???
-- WARNING! too dangerour that it could be accidental input mode when there is no word found.
return {
    "folke/flash.nvim",
    -- event = "VeryLazy",
    ---@type Flash.Config
    opts = {
        modes = {
            search = { enabled = false }
        }
        -- search = {
        --     -- If no match is found, this will show a message
        --     no_match_msg = "No match found",
        -- },
        -- -- You can add a custom callback for when no match is found
        -- on_no_match = function()
        --     -- You could trigger a fallback search here
        --     vim.cmd("normal! /")
        -- end,
    },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      --
      -- Interfere 'global search'
      { "/", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "?", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
