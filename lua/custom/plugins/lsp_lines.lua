return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {},
  init = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
}
