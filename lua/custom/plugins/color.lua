return {
  dir = 'custom.diy.color',
  virtual = true,
  lazy = false,
  priority = 900,
  config = function()
    require('custom.diy.color').setup()

    vim.keymap.set('n', '<leader>tT', function()
      if vim.g.colors_name == 'dayfox' then
        vim.cmd [[colorscheme duskfox]]
      else
        vim.cmd [[colorscheme dayfox]]
      end
    end, { desc = '[T]oggle [T]heme' })
  end,
}
