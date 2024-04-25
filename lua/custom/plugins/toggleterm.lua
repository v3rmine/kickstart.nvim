return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'ToggleTermToggleAll' },
  opts = {
    -- SOURCE: https://github.com/akinsho/toggleterm.nvim
  },
  init = function()
    -- Create a floating terminal
    vim.keymap.set('n', '<leader>tt', ':ToggleTerm direction=float name=speedterm<CR>', { desc = '[t]oggle floating [t]erminal' })

    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>:q<CR>', { desc = 'Close floating terminal' })

    vim.keymap.set('n', '<leader>tht', ':ToggleTerm direction=horizontal name=horizterm<CR>', { desc = '[t]oggle [h]orizontal [t]erminal' })
    vim.keymap.set('n', '<leader>tvt', ':ToggleTerm direction=vertical name=vertterm<CR>', { desc = '[t]oggle [v]ertical [t]erminal' })
  end,
}
