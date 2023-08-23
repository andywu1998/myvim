return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                gopls = {
                    keys = {
                        -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
                        { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
                    },
                    settings = {
                        gopls = {
                            gofumpt = true,
                            codelenses = {
                                gc_details = false,
                                generate = true,
                                regenerate_cgo = true,
                                run_govulncheck = true,
                                test = true,
                                tidy = true,
                                upgrade_dependency = true,
                                vendor = true,
                            },
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                            analyses = {
                                fieldalignment = true,
                                nilness = true,
                                unusedparams = true,
                                unusedwrite = true,
                                useany = true,
                            },
                            usePlaceholders = true,
                            completeUnimported = false,
                            staticcheck = true,
                            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                            semanticTokens = true,
                        },
                    },
                },
            },
            setup = {
                gopls = function(_, opts)
                    -- workaround for gopls not supporting semanticTokensProvider
                    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
                    require("lazyvim.util").on_attach(function(client, _)
                        if client.name == "gopls" then
                            if not client.server_capabilities.semanticTokensProvider then
                                local semantic = client.config.capabilities.textDocument.semanticTokens
                                client.server_capabilities.semanticTokensProvider = {
                                    full = true,
                                    legend = {
                                        tokenTypes = semantic.tokenTypes,
                                        tokenModifiers = semantic.tokenModifiers,
                                    },
                                    range = true,
                                }
                            end
                        end
                    end)
                    -- end workaround
                end,
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            if type(opts.sources) == "table" then
                local nls = require("null-ls")
                vim.list_extend(opts.sources, {
                    nls.builtins.code_actions.gomodifytags,
                    nls.builtins.code_actions.impl,
                    nls.builtins.formatting.gofumpt,
                    nls.builtins.formatting.goimports_reviser,
                    nls.builtins.formatting.golines,
                })
            end
        end,
    },
    {
        "mfussenegger/nvim-dap",

        dependencies = {

            -- fancy UI for the debugger
            {
                "rcarriga/nvim-dap-ui",
                -- stylua: ignore
                keys = {
                    { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
                    { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
                },
                opts = {},
                config = function(_, opts)
                    local dap = require("dap")
                    local dapui = require("dapui")
                    dapui.setup(opts)
                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open({})
                    end
                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close({})
                    end
                    dap.listeners.before.event_exited["dapui_config"] = function()
                        dapui.close({})
                    end
                end,
            },

            -- virtual text for the debugger
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },

            -- which key integration

            -- mason.nvim integration
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "mason.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    -- Makes a best effort to setup the various debuggers with
                    -- reasonable debug configurations
                    automatic_installation = true,

                    -- You can provide additional configuration to the handlers,
                    -- see mason-nvim-dap README for more information
                    handlers = {},

                    -- You'll need to check that you have the required things installed
                    -- online, please don't ask me how to install them :)
                    ensure_installed = {
                        -- Update this to ensure that you have the debuggers for the langs you want
                    },
                },
            },
        },
        -- stylua: ignore
        keys = {
            {
                "<leader>dB",
                function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
                desc =
                "Breakpoint Condition"
            },
            {
                "<leader>db",
                function() require("dap").toggle_breakpoint() end,
                desc =
                "Toggle Breakpoint"
            },
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc =
                "Continue"
            },
            {
                "<leader>dC",
                function() require("dap").run_to_cursor() end,
                desc =
                "Run to Cursor"
            },
            {
                "<leader>dg",
                function() require("dap").goto_() end,
                desc =
                "Go to line (no execute)"
            },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc =
                "Step Into"
            },
            { "<leader>dj", function() require("dap").down() end, desc = "Down" },
            { "<leader>dk", function() require("dap").up() end,   desc = "Up" },
            {
                "<leader>dl",
                function() require("dap").run_last() end,
                desc =
                "Run Last"
            },
            {
                "<leader>do",
                function() require("dap").step_out() end,
                desc =
                "Step Out"
            },
            {
                "<leader>dO",
                function() require("dap").step_over() end,
                desc =
                "Step Over"
            },
            {
                "<leader>dp",
                function() require("dap").pause() end,
                desc =
                "Pause"
            },
            {
                "<leader>dr",
                function() require("dap").repl.toggle() end,
                desc =
                "Toggle REPL"
            },
            {
                "<leader>ds",
                function() require("dap").session() end,
                desc =
                "Session"
            },
            {
                "<leader>dt",
                function() require("dap").terminate() end,
                desc =
                "Terminate"
            },
            {
                "<leader>dw",
                function() require("dap.ui.widgets").hover() end,
                desc =
                "Widgets"
            },
        },

        config = function()
            local Config = require("lazyvim.config")
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

            for name, sign in pairs(Config.icons.dap) do
                sign = type(sign) == "table" and sign or { sign }
                vim.fn.sign_define(
                    "Dap" .. name,
                    { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
                )
            end
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = "go",
        opts = function()
            return require("config.null-ls")
        end,
    },
    {},
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end,
        dependencies = "mfussenegger/nvim-dap",
    },
    {
        "nvim-neotest/neotest",
        optional = true,
        dependencies = {
            "nvim-neotest/neotest-go",
        },
        opts = {
            adapters = {
                ["neotest-go"] = {
                    -- Here we can set options for neotest-go, e.g.
                    -- args = { "-tags=integration" }
                },
            },
        },
    },

    {
        "nvim-neotest/neotest-go",
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd([[silent! GoInstallDeps]])
        end,
    },
}
