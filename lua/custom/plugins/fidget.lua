return {
  'j-hui/fidget.nvim',
  event = { 'VeryLazy' },
  opts = {
    progress = {
      ignore = { 'ltex' },
      display = {
        render_limit = 5,
      },
    },
    notification = {
      override_vim_notify = true,
      window = {
        winblend = 0,
      },
    },
  },
}
