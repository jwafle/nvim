local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
vim.api.nvim_set_hl(0, "Red", { fg = "#B31942" }) -- Red
vim.api.nvim_set_hl(0, "White", { fg = "#FFFFFF" }) -- White
vim.api.nvim_set_hl(0, "Blue", { fg = "#0A3161" }) -- Blue
dashboard.section.header.type = "group"
dashboard.section.header.val = {
  {
    type = "text",
    val = "|* * * * * * * * * * |OOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"Red", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "| * * * * * * * * *  |::::::::::::::::::::::::|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"White", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|* * * * * * * * * * |OOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"Red", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "| * * * * * * * * *  |::::::::::::::::::::::::|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"White", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|* * * * * * * * * * |OOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"Red", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "| * * * * * * * * *  |::::::::::::::::::::::::|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"White", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|* * * * * * * * * * |OOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Blue", 0, 1}, {"White", 1, 21}, {"Blue", 21, 22}, {"Red", 22, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|:::::::::::::::::::::::::::::::::::::::::::::|",
    opts = { hl = { {"White", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Red", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|:::::::::::::::::::::::::::::::::::::::::::::|",
    opts = { hl = { {"White", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Red", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|:::::::::::::::::::::::::::::::::::::::::::::|",
    opts = { hl = { {"White", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "text",
    val = "|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|",
    opts = { hl = { {"Red", 0, 47} }, shrink_margin = true, position = "center" },
  },
  {
    type = "padding",
    val = 1,
  },
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
-- local fortune = require("alpha.fortune") 
-- dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
