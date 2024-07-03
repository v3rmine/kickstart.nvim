return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  event = { 'VeryLazy' },
  opts = {},
  init = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
}
