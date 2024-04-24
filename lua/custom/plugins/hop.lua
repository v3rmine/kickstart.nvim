return {
  'smoka7/hop.nvim',
  opts = {
    -- HACK: Required because of https://github.com/smoka7/hop.nvim/issues/63
  },
  config = function()
    local hop = require 'hop'
    hop.setup {
      keys = 'etovxqpdygfblzhckisuran',
    }
    local directions = require('hop.hint').HintDirection

    vim.keymap.set('', 'f', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true })
    vim.keymap.set('', 't', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR }
    end, { remap = true })
    vim.keymap.set('', 'T', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR }
    end, { remap = true })
  end,
}
