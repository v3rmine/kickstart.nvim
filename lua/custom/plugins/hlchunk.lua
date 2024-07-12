return {
  'shellRaining/hlchunk.nvim',
  event = { 'VeryLazy' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {
    indent = {
      enable = false,
    },
    chunk = {
      enable = true,
      notify = false,
      use_treesitter = true,
      textobject = 'ic',
      chars = {
        right_arrow = '─',
      },
      duration = 150,
      delay = 100,
    },
  },
}
