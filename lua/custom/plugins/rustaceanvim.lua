return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  events = { 'VeryLazy' },
  init = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            imports = {
              granularity = { group = 'crate' },
              prefix = 'self',
            },
            cargo = {
              buildScripts = { enable = true },
            },
            procMacro = { enable = true },
          },
        },
      },
      -- DAP configuration
      dap = {},
    }
  end,
}
