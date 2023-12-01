lua << EOF
-- 安装lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 设置leader
vim.g.mapleader = " "

-- 引用lua/plugins插件
require("lazy").setup("plugins")
-- 设置快捷键
require("config.keymaps")
require("config.editor")
require("config.lsp")
-- 启用配色
-- vim.opt.termguicolors = true
-- toggleterm的配置
require("config.toggleterm")

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

EOF

" 启用系统剪切板 

set clipboard+=unnamedplus
