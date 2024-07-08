return {
  'NvChad/nvim-colorizer.lua',
  event = { 'VeryLazy' },
  opts = {
    filetypes = {
      '*',
      html = { names = true },
      css = { names = true },
      sass = { names = true },
    },
    user_default_options = {
      mode = 'virtualtext',
      RGB = true,
      RRGGBB = true,
      names = false,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      tailwind = true,
    },
  },
}
