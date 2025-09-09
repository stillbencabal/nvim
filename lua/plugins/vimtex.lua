return
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_progname = "nvr"
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_compiler_latexmk = {
                out_dir = "build",
                options = { "-pdf", "-synctex=1", "-interaction=nonstopmode", "-file-line-error"},
            }
            vim.g.vimtex_view_automatic = 1
        end
    }
