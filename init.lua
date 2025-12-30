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

-- NOTE: C++ LSP (clangd) is now handled automatically in lspconfig.lua
-- You do not need a manual setup call here anymore.

function CompileAndRun()
    vim.cmd("silent write")

    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%:p")
    -- We no longer need 'rootname' for C/C++ since we aren't using the file's name for the binary

    local cmd
    if filetype == "c" then
        -- Compiles to 'output' and runs './output'
        cmd = string.format("gcc '%s' -o output && ./output", filename)
    elseif filetype == "cpp" then
        -- Compiles to 'output' and runs './output'
        cmd = string.format("g++ '%s' -o output && ./output", filename)
    elseif filetype == "python" then
        cmd = string.format("python '%s'", filename)
    elseif filetype == "java" then
        local dir = vim.fn.expand("%:p:h")
        local classname = vim.fn.expand("%:t:r")
        cmd = string.format("javac '%s' && java -cp '%s' %s", filename, dir, classname)
    elseif filetype == "kotlin" then
        -- Compiles to 'output.jar' and runs it
        cmd = string.format("kotlinc '%s' -include-runtime -d output.jar && java -jar output.jar", filename)
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
