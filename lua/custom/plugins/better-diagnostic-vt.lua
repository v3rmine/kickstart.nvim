return {
  'sontungexpt/better-diagnostic-virtual-text',
  enabled = true,
  event = 'LspAttach',
  init = function()
    vim.diagnostic.config { virtual_text = false }
  end,
  config = function()
    require('better-diagnostic-virtual-text').setup {
      inline = false,
    }
  end,
}
