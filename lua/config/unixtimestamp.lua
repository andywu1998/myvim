
-- 在您的 Neovim 配置文件中（通常是 ~/.config/nvim/init.lua）添加以下内容：

-- 将 UNIX 时间戳转换为人类可读的时间
function convertUnixTime()
  -- 获取当前光标所在行的内容
  local line = vim.api.nvim_get_current_line()

  -- 使用正则表达式匹配行中的 UNIX 时间戳
  local timestamp = line:match('%d+')

  -- 检查是否匹配到 UNIX 时间戳
  if not timestamp then
    print("No UNIX timestamp found")
    return
  end

  -- 将 UNIX 时间戳转换为人类可读的时间
  local humanReadableTime = os.date('%Y-%m-%d %H:%M:%S', tonumber(timestamp))

  -- 创建悬浮窗来显示转换后的时间
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {humanReadableTime})
  local winnr = vim.api.nvim_open_win(bufnr, true, {
    relative = 'cursor',
    row = 1,
    col = 0,
    width = #humanReadableTime + 2,  -- 设置窗口的宽度
    height = 1,
    style = 'minimal',
    border = 'single'
  })

  -- 在悬浮窗的关闭事件中移除缓冲区并关闭窗口
  vim.api.nvim_buf_attach(bufnr, false, {
    on_detach = function()
      vim.api.nvim_buf_delete(bufnr, {force = true})
      vim.api.nvim_win_close(winnr, true)
    end
  })
end

-- 创建一个命令来调用函数
vim.cmd("command! Funix lua convertUnixTime()")

vim.api.nvim_set_keymap('n', '<leader>cu', '<cmd>lua convertUnixTime()<CR>', {silent = true, noremap = true, desc = 'Convert UNIX timestamp'})
