return
    {
        "tronikelis/ts-autotag.nvim",
        config = function()
            require('ts-autotag').setup({
                filetypes =
                    {
                        "typescript",
                        "javascript",
                        "typescriptreact",
                        "javascriptreact",
                        "html"
                    },
                autoclose =
                    {
                        enabled = true
                    },
                autorename =
                    {
                        enabled = true
                    }
            })
        end
    }
