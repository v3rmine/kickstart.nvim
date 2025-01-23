-- SOURCE: https://github.com/saghen/blink.cmp
return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {},
  },
  {
    'saghen/blink.cmp',
    lazy = false,
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      'milanglacier/minuet-ai.nvim',
      'hrsh7th/cmp-nvim-lua',
    },

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    config = function()
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      local opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
          preset = 'default',
          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<C-space>'] = {
            function(cmp)
              cmp.show {}
            end,
          },
          ['<C-h>'] = require('minuet').make_blink_map(),
        },

        appearance = {
          -- Sets the fallback highlight groups to nvim-cmp's highlight groups
          -- Useful for when your theme doesn't support blink.cmp
          -- Will be removed in a future release
          use_nvim_cmp_as_default = true,
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono',
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = {
            'lsp',
            'path',
            'nvim_lua',
            'crates',
            'snippets',
            'avante_commands',
            'avante_mentions',
            'avante_files',
            'buffer',
          },
          cmdline = {},
          providers = {
            avante_commands = {
              name = 'avante_commands',
              module = 'blink.compat.source',
              score_offset = 90, -- show at a higher priority than lsp
              opts = {},
            },
            avante_files = {
              name = 'avante_commands',
              module = 'blink.compat.source',
              score_offset = 100, -- show at a higher priority than lsp
              opts = {},
            },
            avante_mentions = {
              name = 'avante_mentions',
              module = 'blink.compat.source',
              score_offset = 1000, -- show at a higher priority than lsp
              opts = {},
            },
            minuet = {
              name = 'minuet',
              module = 'minuet.blink',
              async = true,
            },
            nvim_lua = {
              name = 'nvim_lua',
              module = 'blink.compat.source',
            },
            crates = {
              name = 'crates',
              module = 'blink.compat.source',
            },
          },
        },

        completion = {
          ghost_text = {
            enabled = false,
          },

          list = {
            selection = {
              preselect = true,
              auto_insert = false,
            },
          },

          menu = {
            draw = {
              columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { 'kind', 'source_name', gap = 1 } },
              treesitter = { 'lsp' },
            },
          },

          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
      }

      require('blink.cmp').setup(opts)
    end,

    opts_extend = { 'sources.default' },
  },
}
