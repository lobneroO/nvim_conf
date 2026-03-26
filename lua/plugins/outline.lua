-- plugin that adds an outline side bar with functions and positions
-- which allows quicker navigation and better overview of where in the file
-- the cursor is currently positioned
return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<C-s>", "<cmd>Outline<CR>", desc = "Toggle Outline (\"Solution Explorer\")" },
    },
    opts = {
        -- any custom opts
    },
 }
