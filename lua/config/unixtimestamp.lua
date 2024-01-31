
-- 在您的 Neovim 配置文件中（通常是 ~/.config/nvim/init.lua）添加以下内容：

-- 将 UNIX 时间戳转换为人类可读的时间
function convertUnixTime()
  -- 获取当前光标所在行的内容
  local lnum = vim.api.nvim_get_current_line()

  -- 使用正则表达式匹配行中的 UNIX 时间戳
  local timestamp = lnum:match('%d+')
  local virt_text_pos = 'eol'
  -- 检查是否匹配到 UNIX 时间戳
  if not timestamp then
    print("No UNIX timestamp found")
  end

  -- 将 UNIX 时间戳转换为人类可读的时间
  local humanReadableTime = os.date('%Y-%m-%d %H:%M:%S', tonumber(timestamp))


  local current_buf = vim.api.nvim_get_current_buf()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  
  local namespace_id = vim.api.nvim_create_namespace("my_namespace")
  local text = humanReadableTime
  local start_col = 0
  local line_text = vim.api.nvim_buf_get_lines(current_buf, current_line - 1, current_line, false)[1]
  local end_col = start_col + #line_text - 1
  local mark_id = vim.api.nvim_buf_set_extmark(current_buf, namespace_id, current_line - 1, start_col, {
    end_line = current_line - 1,
    end_col = end_col,
    virt_text = {{text, "Error"}}
  })
end

-- 创建一个命令来调用函数
vim.cmd("command! Funix lua convertUnixTime()")

vim.api.nvim_set_keymap('n', '<leader>cu', '<cmd>lua convertUnixTime()<CR>', {silent = true, noremap = true, desc = 'Convert UNIX timestamp'})
