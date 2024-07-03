return {
  'shellRaining/hlchunk.nvim',
  event = { 'VeryLazy' },
  opts = {
    indent = {
      enable = false,
      use_treesitter = true,
    },
    chunk = {
      enable = true,
      notify = true,
      use_treesitter = true,
      chars = {
        right_arrow = '─',
      },
      duration = 200,
      delay = 150,
    },
  },
}
