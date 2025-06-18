-- plugin for auto suggestions
return {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = "InsertEnter",

    config = function()
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" }
            },
            mapping = cmp.mapping.preset.insert({
                -- navigate between auto complete suggestions
                ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

                -- accept selected suggestion
                ['<C-y>'] = cmp.mapping.confirm({select = false}),

                -- open/close autosuggestion menu
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.close(),

                -- scroll up and down in the auto complete documentation
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
            }),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            }
        })
    end
}
