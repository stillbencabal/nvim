return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local neogit = require('neogit')
        vim.keymap.set(
            'n',
            '<C-g>',
            function() neogit.open({kind = "vsplit" }) end,
            { desc = "Open Neogit UI in another window" })
    end
}
