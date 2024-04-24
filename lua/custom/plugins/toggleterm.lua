-- Create a floating terminal
vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float name=speedterm<CR>', { desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:q<CR>', { desc = 'Close floating terminal' })

return {
  'akinsho/toggleterm.nvim',
  opts = {
    -- SOURCE: https://github.com/akinsho/toggleterm.nvim
  },
}
