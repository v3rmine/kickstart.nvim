return {
  'milanglacier/minuet-ai.nvim',
  -- event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'Saghen/blink.cmp',
  },
  config = function()
    require('minuet').setup {
      provider = 'openai_compatible',
      provider_options = {
        openai_compatible = {
          api_key = 'OPENROUTER_API_KEY',
          end_point = 'https://openrouter.ai/api/v1/chat/completions',
          name = 'OpenRouter',
          model = 'google/gemini-flash-1.5',
          stream = true,
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
    }
  end,
}
