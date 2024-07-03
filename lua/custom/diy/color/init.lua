local M = {}

local colorscheme_file = '~/.config/nvim/lua/custom/diy/color/colorscheme.lua'

M.setup = function()
  vim.cmd [[colorscheme default]]

  -- try load custom._color.colorscheme and if not found create the file with current colorscheme
  local ok, set_colourscheme = pcall(require, 'custom.diy.color.colorscheme')
  if ok then
    set_colourscheme()
  else
    vim.fn.jobstart('echo "return function()\n  vim.cmd [[colorscheme ' .. vim.g.colors_name .. ']]\nend" > ' .. colorscheme_file)
  end

  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function(args)
      vim.notify('Saved colorscheme: ' .. args.match, vim.log.levels.INFO, { title = 'ColorScheme' })
      vim.fn.jobstart("sed -i '' -e 's/\\[\\[colorscheme .*\\]\\]/[[colorscheme " .. args.match .. "]]/' " .. colorscheme_file)
      -- vim.fn.jobstart("sed -i '' -e 's/include colorscheme_.*/include colorscheme_" .. args.match .. "/' ~/.config/kitty/kitty.conf")
    end,
  })
end

return M
