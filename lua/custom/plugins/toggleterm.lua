vim.keymap.set('n', '<leader>ttb', function()
  local original_win = vim.api.nvim_get_current_win()
  vim.cmd 'split | term'
  local term_buf = vim.api.nvim_get_current_buf()
  vim.cmd 'setlocal nonumber norelativenumber'
  vim.api.nvim_buf_set_keymap(term_buf, 'n', '<Esc>', '<cmd>close<CR>', { noremap = true, silent = true })
  vim.api.nvim_win_close(original_win, false)
  vim.cmd 'startinsert!'
end, { desc = '[t]oggle [t]erminal [b]uffer' })

return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'ToggleTermToggleAll' },
  opts = {
    -- SOURCE: https://github.com/akinsho/toggleterm.nvim
  },
  init = function()
    local Terminal = require('toggleterm.terminal').Terminal

    -- Create a floating terminal
    local quickTerm = Terminal:new {
      display_name = 'QuickTerm',
      direction = 'float',
      hidden = true,
      on_open = function(term)
        vim.cmd 'startinsert!'
        vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
      end,
    }
    vim.keymap.set('n', '<leader>ttf', function()
      quickTerm:toggle()
    end, { desc = '[T]oggle [T]erminal [F]loating' })

    local function close_on_esc(term)
      vim.cmd 'startinsert!'
      vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<Esc>', '<cmd>close<CR>', { noremap = true, silent = true })
    end
    local hterm = Terminal:new {
      direction = 'horizontal',
      hidden = true,
      on_open = close_on_esc,
    }
    vim.keymap.set('n', '<leader>tth', function()
      hterm:toggle()
    end, { desc = '[T]oggle [T]erminal [H]orizontal' })

    local vterm = Terminal:new {
      direction = 'vertical',
      hidden = true,
      on_open = close_on_esc,
    }
    vim.keymap.set('n', '<leader>ttv', function()
      vterm:toggle()
    end, { desc = '[T]oggle [T]erminal [V]ertical' })
  end,
}
