--require('vesper').setup({
--    transparent = true, -- Boolean: Sets the background to transparent
--    italics = {
--        comments = false, -- Boolean: Italicizes comments
--        keywords = false, -- Boolean: Italicizes keywords
--        functions = false, -- Boolean: Italicizes functions
--        strings = false, -- Boolean: Italicizes strings
--        variables = false, -- Boolean: Italicizes variables
--    },
--    overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
--    palette_overrides = {}
--})

--vim.cmd[[colorscheme vesper]]
require('rose-pine').setup({
    disable_italics = true,
    styles={
        transparency = true,
    }
})

vim.cmd('colorscheme rose-pine')
