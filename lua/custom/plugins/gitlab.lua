return {
  'harrisoncramer/gitlab.nvim',
  enabled = vim.fn.executable 'go' == 1,
  event = { 'VeryLazy' },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'stevearc/dressing.nvim', -- Recommended but not required. Better UI for pickers.
    'nvim-tree/nvim-web-devicons', -- Recommended but not required. Icons in discussion tree.
  },
  build = function()
    require('gitlab.server').build()
  end, -- Builds the Go binary
  opts = {
    config_path = '~/.gitlab.nvim',
  },
}
