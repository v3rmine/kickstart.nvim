local ignore_filetypes = {
  ['neo-tree'] = true,
  Trouble = true,
}

return {
  'nvim-focus/focus.nvim',
  version = false,
  event = 'WinEnter',
  opts = {
    ui = {
      cursorline = false,
      signcolumn = false,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        vim.w.focus_disable = ignore_filetypes[vim.bo.filetype]
      end,
    })
  end,
}
