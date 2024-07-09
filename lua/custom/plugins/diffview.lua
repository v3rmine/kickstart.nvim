return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen' },
  opts = {
    view = {
      merge_tool = {
        layout = 'diff2_horizontal',
      },
    },
    keymaps = {
      disable_defaults = true,
    },
  },
}
