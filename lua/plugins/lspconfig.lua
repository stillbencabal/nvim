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
                ensure_installed = { "lua_ls", "pylsp", "kotlin_lsp", "clangd", "ts_ls", "html", "cssls"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls.setup",{})
            vim.lsp.config("pylsp.setup",{})
            vim.lsp.config("kotlin_lsp.setup",{})
            vim.lsp.config("ts_ls", {})
            vim.lsp.config("html", {})
            vim.lsp.config("cssls", {})
            vim.diagnostic.config({virtual_text = true})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        end
    }
}
