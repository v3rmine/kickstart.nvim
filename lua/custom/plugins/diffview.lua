return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen' },
  opts = {
    view = {
      merge_tool = {
        layout = 'diff3_horizontal',
      },
    },
    keymaps = {
      disable_defaults = true,
    },
  },
}
