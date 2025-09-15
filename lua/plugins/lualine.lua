return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Helper function to get highlight group colors
        local function get_highlight_color(group, attr)
            local hl = vim.api.nvim_get_hl(0, { name = group })
            if hl and hl[attr] then
                return string.format("#%06x", hl[attr])
            end
            return nil
        end

        -- Use colors from Neovim highlight groups (adapts to any theme)
        local colors = {
            -- theme's "ErrorMsg" is not very red (in VSCode theme)
            -- red = get_highlight_color("ErrorMsg", "fg") or "#ff0000",
            -- colors are mostly AI generated, so switching theme may not be
            -- working as great as expected - but I don't anticipate to switch
            -- the theme any time soon.
            red = '#ca1243',
            orange = '#fe8019',
            yellow = get_highlight_color("WarningMsg", "fg") or "#ffff00",
            green = get_highlight_color("String", "fg") or "#00ff00",
            blue = get_highlight_color("Function", "fg") or "#0000ff",
            purple = get_highlight_color("Statement", "fg") or "#ff00ff",
            light_purple = '#eea0ee',
            grey = get_highlight_color("Comment", "fg") or "#808080",
            white = get_highlight_color("Normal", "fg") or "#ffffff",
            black = get_highlight_color("Normal", "bg") or "#000000",
            light_green = get_highlight_color("String", "fg") or "#83a598",
        }

        -- Empty component definition
        local empty = require('lualine.component'):extend()
        function empty:draw(default_highlight)
            self.status = ''
            self.applied_separator = ''
            self:apply_highlights(default_highlight)
            self:apply_section_separators()
            return self.status
        end

        -- Put proper separators and gaps between components in sections
        local function process_sections(sections)
            for name, section in pairs(sections) do
                local left = name:sub(9, 10) < 'x'
                for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
                    table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
                end
                for id, comp in ipairs(section) do
                    if type(comp) ~= 'table' then
                        comp = { comp }
                        section[id] = comp
                    end
      comp.separator = left and { right = '' } or { left = '' }
                end
            end
            return sections
        end

        local function search_result()
            if vim.v.hlsearch == 0 then
                return ''
            end
            local last_search = vim.fn.getreg('/')
            if not last_search or last_search == '' then
                return ''
            end
            local searchcount = vim.fn.searchcount { maxcount = 9999 }
            return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
        end

        local function modified()
            if vim.bo.modified then
                return '+'
            elseif vim.bo.modifiable == false or vim.bo.readonly == true then
                return '-'
            end
            return ''
        end

        require('lualine').setup {
            -- setup taken from slanted-gaps example at
            -- https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/slanted-gaps.lua
            options = {
                component_separators = '',
            section_separators = { left = '', right = '' },
            },
            sections = process_sections {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        source = { 'nvim' },
                        sections = { 'error' },
                        diagnostics_color = { error = { bg = colors.red, fg = colors.black } },
                    },
                    {
                        'diagnostics',
                        source = { 'nvim' },
                        sections = { 'warn' },
                    diagnostics_color = { warn = { bg = colors.orange, fg = colors.black } },
                    },
                    { 'filename', file_status = false, path = 1 },
                    { modified, color = { bg = colors.light_purple} },
                    {
                        '%w',
                        cond = function()
                            return vim.wo.previewwindow
                        end,
                    },
                    {
                        '%r',
                        cond = function()
                            return vim.bo.readonly
                        end,
                    },
                    {
                        '%q',
                        cond = function()
                            return vim.bo.buftype == 'quickfix'
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { search_result, 'filetype' },
                lualine_z = { '%l:%c', '%p%%/%L' },
            },
            inactive_sections = {
                lualine_c = { '%f %y %m' },
                lualine_x = {},
            },
        }
    end
}
