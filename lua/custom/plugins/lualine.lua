return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
    },
    sections = {
      lualine_y = { 'searchcount' },
    },
  },
}
