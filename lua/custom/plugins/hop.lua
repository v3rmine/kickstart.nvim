return {
  'smoka7/hop.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- HACK: Required because of https://github.com/smoka7/hop.nvim/issues/63
  },
  keys = {
    {
      'f',
      function()
        local hop = require 'hop'
        local directions = require('hop.hint').HintDirection
        hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
      end,
      desc = 'Hop forward in current line',
    },
    {
      'F',
      function()
        local hop = require 'hop'
        local directions = require('hop.hint').HintDirection
        hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
      end,
      desc = 'Hop backward in current line',
    },
    {
      't',
      function()
        local hop = require 'hop'
        local directions = require('hop.hint').HintDirection
        hop.hint_char1 { direction = directions.AFTER_CURSOR }
      end,
      desc = 'Hop forward',
    },
    {
      'T',
      function()
        local hop = require 'hop'
        local directions = require('hop.hint').HintDirection
        hop.hint_char1 { direction = directions.BEFORE_CURSOR }
      end,
      desc = 'Hop backward',
    },
  },
  init = function()
    local hop = require 'hop'
    hop.setup {
      keys = 'etovxqpdygfblzhckisuran',
    }
  end,
}
