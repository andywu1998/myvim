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

-- 启用配色
-- vim.opt.termguicolors = true
EOF

set clipboard+=unnamedplus
