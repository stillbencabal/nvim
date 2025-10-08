local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

-- C++ LSP
-- require"lspconfig".clangd.setup{}

function CompileAndRun()
    vim.cmd("silent write")

    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%:p")  
    local rootname = vim.fn.expand("%:r")   

    local cmd
    if filetype == "c" then
        cmd = string.format("gcc '%s' -o '%s' && '%s'", filename, rootname, rootname)
    elseif filetype == "cpp" then
        cmd = string.format("g++ '%s' -o '%s' && './%s'", filename, rootname, rootname)
    elseif filetype == "python" then
        cmd = string.format("python '%s'", filename)
    elseif filetype == "java" then
        local dir = vim.fn.expand("%:p:h")  
        local classname = vim.fn.expand("%:t:r")  
        cmd = string.format("javac '%s' && java -cp '%s' %s", filename, dir, classname)
    elseif filetype == "javascript" then
        cmd = string.format("node '%s'", filename)
    else
        print("Filetype '" .. filetype .. "' not supported")
        return
    end

    vim.cmd("split | terminal " .. cmd)
    vim.cmd("startinsert")  
end

vim.api.nvim_set_keymap(
    'n',
    '<F5>',
    '<cmd>lua CompileAndRun()<CR>',
    { noremap = true, silent = true }
)
