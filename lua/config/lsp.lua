
-- default keymap for opening float is K.
-- go to next / previous diagnostic. important especially,
-- if multiple diagnostics appear on one line
vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set('n', '<leader>.',
    function()
        vim.diagnostic.jump({count=1, float=true})
    end, { desc = "Go to next diagnostic"})
vim.keymap.set('n', '<leader>,',
    function()
        vim.diagnostic.jump({count=-1, float=true})
    end, { desc = "Go to previous diagnostic"})
-- need to get type information for the symbol (i.e. usually variable)
-- under the cursor
vim.keymap.set('n', '<leader>ga',
    function()
        vim.lsp.buf.hover()
    end, { desc = "Display type information of the element under cursor"} )
-- sometimes code actions are available (such as adding an import)
-- the following shortcut will open these
vim.keymap.set('n', '<leader>ca',
    function()
        vim.lsp.buf.code_action()
    end, { desc = "Open coda actions"})
-- renaming based on LSP for refactoring a variable or function name
-- is way more efficient than :%s/name1/name2/g ...
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = "LSP rename"})

-- Some LSPs (e.g. clangd) cache project state at startup (like
-- compile_commands.json) and won't notice it changed on disk. Stop and
-- restart the affected client(s), then re-trigger their buffers so they
-- reattach, without having to restart nvim.
local function restart_lsp_clients(clients)
    if #clients == 0 then
        return {}
    end

    local bufs, names = {}, {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
        for bufnr in pairs(client.attached_buffers or {}) do
            bufs[bufnr] = true
        end
        client:stop()
    end

    vim.defer_fn(function()
        for bufnr in pairs(bufs) do
            if vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("edit")
                end)
            end
        end
    end, 500)

    return names
end

vim.keymap.set('n', '<leader>cr', function()
    local names = restart_lsp_clients(vim.lsp.get_clients({ bufnr = 0 }))
    if #names == 0 then
        vim.notify("No LSP client attached to this buffer", vim.log.levels.WARN)
    else
        vim.notify("Restarting: " .. table.concat(names, ", "))
    end
end, { desc = "Restart LSP client(s) attached to current buffer" })

-- Restarts every active LSP client across all buffers. Exposed globally so
-- it can also be triggered from outside nvim, e.g. from an automaton.nvim
-- task (via `nvim --server $NVIM --remote-expr "v:lua.RestartAllLsp()"`)
-- right after regenerating compile_commands.json.
_G.RestartAllLsp = function()
    local names = restart_lsp_clients(vim.lsp.get_clients())
    vim.notify(#names == 0 and "No active LSP clients" or "Restarting: " .. table.concat(names, ", "))
    return ""
end

