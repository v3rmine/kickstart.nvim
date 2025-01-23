local function lualine_config()
  local color_theme = 'duskfox'
  if vim.g.colors_name == 'dayfox' then
    color_theme = 'dayfox'
  end

  local lualine = require 'lualine'
  local colors = require('nightfox.palette').load(color_theme)

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand '%:t') ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand '%:p:h'
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Remove the background
  local config = {
    options = {
      -- Disable sections and component separators
      component_separators = '',
      section_separators = '',
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg2, bg = colors.bg2 } },
        inactive = { c = { fg = colors.fg2, bg = colors.bg2 } },
      },
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return '▊'
    end,
    color = { fg = colors.magenta.base }, -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
  }

  ins_left {
    -- mode component
    function()
      return ' '
    end,
    color = function()
      -- auto change color according to neovims mode
      local mode_color = {
        n = colors.red.base,
        i = colors.green.base,
        v = colors.blue.base,
        [''] = colors.blue.base,
        V = colors.blue.base,
        c = colors.pink.base,
        no = colors.red.base,
        s = colors.orange.base,
        S = colors.orange.base,
        [''] = colors.orange.base,
        ic = colors.yellow.base,
        R = colors.magenta.base,
        Rv = colors.magenta.base,
        cv = colors.red.base,
        ce = colors.red.base,
        r = colors.green.base,
        rm = colors.green.base,
        ['r?'] = colors.green.base,
        ['!'] = colors.red.base,
        t = colors.red.base,
      }
      return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
  }

  ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.pink.base, gui = 'bold' },
  }

  ins_left { 'location' }

  ins_left { 'progress', color = { fg = colors.green.base, gui = 'bold' } }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      error = { fg = colors.red.base },
      warn = { fg = colors.yellow.base },
      info = { fg = colors.green.base },
    },
  }

  -- Insert mid section. You can make any number of sections in neovim :)
  -- for lualine it's any number greater then 2
  ins_left {
    function()
      return '%='
    end,
  }

  ins_left {
    -- Lsp server name .
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = '  LSP:',
    color = { fg = colors.fg1, gui = 'bold' },
  }

  -- Add components to right sections
  ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green.base, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green.base, gui = 'bold' },
  }

  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.magenta.base, gui = 'bold' },
  }

  ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green.base },
      modified = { fg = colors.orange.base },
      removed = { fg = colors.red.base },
    },
    cond = conditions.hide_in_width,
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.magenta.base },
    padding = { left = 1 },
  }

  -- Now don't forget to initialize lualine
  lualine.setup(config)
end

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function()
        lualine_config()
      end,
    })
  end,
  config = lualine_config,
}
