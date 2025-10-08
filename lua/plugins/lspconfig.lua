return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls.setup",{})
            vim.lsp.config("pylsp.setup",{})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})
        end
    }
}
