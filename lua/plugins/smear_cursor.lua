return {
    "sphamba/smear-cursor.nvim",
    config = function()
        require("smear_cursor").setup({
        opts = {
            smear_between_buffers = true,
            smear_betwen_neighbor_lines = true,
            scroll_buffer_space = true,
            smear_insert_mode = true,
            smear_to_cmd = true,
            legacy_computing_symbols_support = true,
            legacy_computing_symbols_support_vertical_bars = true,
        }
        })
    end
}
