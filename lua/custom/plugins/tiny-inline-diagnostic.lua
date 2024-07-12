return {
  'rachartier/tiny-inline-diagnostic.nvim',
  enabled = false,
  event = 'VeryLazy',
  dependencies = { 'neovim/nvim-lspconfig' },
  init = function()
    vim.diagnostic.config { virtual_text = false }
  end,
  config = function()
    require('tiny-inline-diagnostic').setup()
  end,
}
