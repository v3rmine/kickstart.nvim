return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  enabled = false,
  event = 'LspAttach',
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {},
  init = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
}
