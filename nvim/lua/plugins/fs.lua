return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require "oil"
      local utils = require "config.utils"

      oil.setup {
        default_file_explorer = true,
        keymaps = {
          ["g?"] = "actions.show_help",

          ["<CR>"] = "actions.select",
          ["<C-S>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
          ["<C-H>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-t>"] = false,
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",

          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },

          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",

          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              DETAIL = not DETAIL

              if DETAIL then
                require("oil").set_columns { "icon", "permissions", "size", "mtime" }
              else
                require("oil").set_columns { "icon" }
              end
            end,
          },
        },
      }

      vim.keymap.set("n", "<leader>e", function()
        oil.open(vim.loop.cwd())
      end, {
        desc = "Explore CWD (VSplit)",
      })

      vim.keymap.set("n", "<leader>E", function()
        utils.vsplit()
        oil.open(vim.loop.cwd())
      end, {
        desc = "Explore CWD (VSplit)",
      })

      vim.keymap.set("n", "<leader>o", function()
        oil.open()
      end, {
        desc = "Explore parent directory (VSplit)",
      })

      vim.keymap.set("n", "<leader>O", function()
        utils.vsplit()
        oil.open()
      end, {
        desc = "Explore parent directory (VSplit)",
      })
    end,
  },
}
