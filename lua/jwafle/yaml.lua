vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})

