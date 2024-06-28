require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "vendor",
            "build"
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    local search_term = vim.fn.input("Grep > ")
    vim.notify("Searching for: " .. search_term)
    builtin.grep_string({ search = search_term })
end)
