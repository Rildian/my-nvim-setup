return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  -- In LazyVim, we configure via keys and config hooks, not a raw setup call
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Setup the UI
    dapui.setup()

    -- Configure Mason-Nvim-Dap (The Bridge)
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        -- Add debuggers you need here if Mason doesn't auto-install them
        -- "python",
        -- "cpptools",
      },
    })

    -- Listeners to open UI automatically
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Keymaps
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
  end,
}
