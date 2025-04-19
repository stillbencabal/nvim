vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.cmd("set number relativenumber")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set smartindent")
vim.cmd("set showmatch")
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false
vim.opt.scrolloff = 8
vim.opt.guicursor = ""

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true}),
    callback = function()
    vim.highlight.on_yank()
    end,
})
