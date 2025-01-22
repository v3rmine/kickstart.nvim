return {
  'chipsenkbeil/distant.nvim',
  enabled = false,
  branch = 'v0.3',
  event = 'VeryLazy',
  config = function()
    require('distant'):setup()
  end,
}
