-- SOURCE: https://github.com/folke/twilight.nvim
return {
  'folke/twilight.nvim',
  config = function()
    local twilight = require 'twilight'

    twilight.setup {
      context = 10,
      -- SOURCE: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/typescript/highlights.scm
      -- Replace typescript with your lang of choice
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        'function',
        -- 'function_definition', -- python functions
        -- 'function_declaration', -- go functions
        -- 'function_signature', -- typescript functions
        -- 'function_item', -- rust functions
        'method',
        -- 'method_definition', -- python methods
        -- 'method_signature', -- typescript methods
        'table',
        'if_statement',
      },
    }

    vim.api.nvim_create_autocmd('BufEnter', {
      callback = function(args)
        twilight.enable()
      end,
    })
  end,
}
