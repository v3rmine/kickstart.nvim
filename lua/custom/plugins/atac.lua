return {
  'NachoNievaG/atac.nvim',
  dependencies = { 'akinsho/toggleterm.nvim' },
  cmd = { 'Atac' },
  opts = {
    dir = vim.loop.cwd() .. '/.atac', -- By default, the dir will be set as /tmp/atac
  },
}
