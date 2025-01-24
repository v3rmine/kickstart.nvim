return {
  'RaafatTurki/hex.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    is_file_binary_pre_read = function()
      local binary_ext = { 'out', 'bin', 'png', 'jpg', 'jpeg', 'gif', 'exe', 'dll', 'raw' }
      -- only work on normal buffers
      if vim.bo.ft ~= '' then
        return false
      end
      -- check -b flag
      if vim.bo.bin then
        return true
      end
      -- check ext within binary_ext
      local ext = vim.fn.expand '%:e'
      if vim.tbl_contains(binary_ext, ext) then
        return true
      end
      -- none of the above
      return false
    end,
    is_file_binary_post_read = function()
      return false
    end,
  },
}
