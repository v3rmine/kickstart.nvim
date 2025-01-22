return {
  dir = 'custom.diy.color',
  virtual = true,
  lazy = false,
  priority = 900,
  config = function()
    require('custom.diy.color').setup()
  end,
}
