vim.api.nvim_set_keymap("n", "<S-c>", "<cmd>lua require('mini.bufremove').delete(0, true)<CR>",
    { noremap = true, silent = true })
local M  = {}

M.dap    = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add Breakpoint at line"
        },
        ["<leadaer>dus"] = {
            function()
                local wigets = require("dap.ui.widgets");
                local sidebar = wigets.sidebar(wigets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        },
    }
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require("dap-go").debug_test()
            end,
            "Debug go test"
        },
        ["<leader>dgl"] = {
            function()
                require("dap-go").debug_last()
            end,
        }
    }
}

return M
