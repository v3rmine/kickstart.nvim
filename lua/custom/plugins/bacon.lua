return {
  'Canop/nvim-bacon',
  events = { 'VeryLazy' },
  config = function()
    require('bacon').setup {
      quickfix = {
        enabled = true, -- Enable Quickfix integration
        event_trigger = true, -- Trigger QuickFixCmdPost after populating Quickfix list
      },
    }
  end,
}
