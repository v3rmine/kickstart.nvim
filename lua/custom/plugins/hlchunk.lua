return {
  'shellRaining/hlchunk.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
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
