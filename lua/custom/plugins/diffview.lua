return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  config = function()
    local actions = require 'diffview.actions'

    require('diffview').setup {
      view = {
        default = {
          layout = 'diff2_vertical',
        },
        merge_tool = {
          layout = 'diff3_mixed',
        },
        file_history = {
          layout = 'diff2_vertical',
        },
      },
      keymaps = {
        disable_defaults = true,

        view = {
          { 'n', '<leader>g<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
          { 'n', '<leader>g<s-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
          { 'n', '<leader>g[', actions.prev_conflict, { desc = 'In the merge-tool: jump to the previous conflict' } },
          { 'n', '<leader>g]', actions.next_conflict, { desc = 'In the merge-tool: jump to the next conflict' } },
          { 'n', '<leader>gc', { group = 'Conflict actions' } },
          { 'n', '<leader>gco', actions.conflict_choose 'ours', { desc = 'Choose the OURS version of a conflict' } },
          { 'n', '<leader>gct', actions.conflict_choose 'theirs', { desc = 'Choose the THEIRS version of a conflict' } },
          { 'n', '<leader>gcb', actions.conflict_choose 'base', { desc = 'Choose the BASE version of a conflict' } },
          { 'n', '<leader>gca', actions.conflict_choose 'all', { desc = 'Choose all the versions of a conflict' } },
          { 'n', '<leader>gdx', actions.conflict_choose 'none', { desc = 'Delete the conflict region' } },
        },
      },
    }
  end,
  keys = {
    { '<leader>go', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'Open Diffview file history' },
    { '<leader>gd', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
    { 'leader>g\\', '<cmd>DiffviewToggleFiles<cr>', desc = 'Toggle DiffviewPanel' },
  },
}
