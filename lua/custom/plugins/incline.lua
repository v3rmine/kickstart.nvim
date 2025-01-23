return {
  'b0o/incline.nvim',
  event = { 'VeryLazy' },
  dependencies = { 'nvim-tree/nvim-web-devicons', 'SmiteshP/nvim-navic' },
  config = function()
    local helpers = require 'incline.helpers'
    local navic = require 'nvim-navic'
    local devicons_ok, devicons = pcall(require, 'nvim-web-devicons')

    local init = function(guibg)
      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0, vertical = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then
            filename = '[No Name]'
          end

          local modified = vim.bo[props.buf].modified
          local res = {}

          if devicons_ok then
            local ft_icon, ft_color = devicons.get_icon_color(filename)
            res = {
              ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
              ' ',
              { filename, gui = modified and 'bold,italic' or 'bold' },
              guibg = guibg,
            }
          else
            res = {
              ' ',
              { filename, gui = modified and 'bold,italic' or 'bold' },
              guibg = guibg,
            }
          end

          if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
              table.insert(res, {
                { ' > ', group = 'NavicSeparator' },
                { item.icon, group = 'NavicIcons' .. item.type },
                { item.name, group = 'NavicText' },
              })
            end
          end
          table.insert(res, ' ')
          return res
        end,
      }
    end

    if vim.g.colors_name == 'dayfox' then
      init '#E5D9F2'
    elseif vim.g.colors_name == 'nightfox' then
      init '#8967B3'
    else
      init '#44406e'
    end

    vim.api.nvim_create_autocmd('ColorScheme', {
      callback = function(args)
        if args.match == 'dayfox' then
          init '#E5D9F2'
        elseif args.match == 'nightfox' then
          init '#8967B3'
        end
      end,
    })
  end,
}
