-- enables surrounding a word (or motion, really) with characters,
-- e.g. have
--  my word
-- hover cursor at the 'y', use sa2w) (i.e: [s]urround [a]dd [2w]ords parantheses, closing such that no space is added)
-- and it will turn into 
--  (my word)
-- in contrast, using sa2w( will add spaces around the parantheses
--  ( my word )
-- can also be used by selecting words (in visual mode) first
-- and thereby can also work over several lines
return {
    'nvim-mini/mini.surround',
    version = '*',

    config = function()
        local pairs = { ['('] = ')', ['['] = ']', ['{'] = '}', ['<'] = '>' }
        require('mini.surround').setup({
            -- makes linewise visual selection (V) put surroundings on their own
            -- line and auto-indent them using each line's own indent
            respect_selection_type = true,
        })
    end
}
