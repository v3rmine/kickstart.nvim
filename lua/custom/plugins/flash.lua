-- SOURCE: https://github.com/folke/flash.nvim
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  config = function()
    require('flash').setup {
      modes = {
        char = {
          enabled = false,
        },
      },
    }

    for _, motion in ipairs { 'f', 't', 'F', 'T' } do
      vim.keymap.set({ 'n', 'x', 'o' }, motion, function()
        require('flash').jump()
      end)
    end
  end,
}
