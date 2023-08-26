local colorscheme = "kanagawa"

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "gruvbox" then
        require("gruvbox").setup { contrast = "dark", italics = false }
        vim.cmd.colorscheme "gruvbox"
      end
    end,
  },
  {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
      if colorscheme == "ayu" then
        local mirage = false
        local colors = require "ayu.colors"
        colors.generate(mirage)

        local ayu = require "ayu"

        ayu.setup {
          mirage = mirage,
          overrides = function()
            return { Comment = { fg = colors.comment } }
          end,
        }

        ayu.colorscheme()
      end
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "kanagawa" then
        require("kanagawa").setup {
          compile = false,
          undercurl = true,
          commentStyle = { italic = false },
          functionStyle = { italic = false },
          keywordStyle = { italic = false },
          statementStyle = { italic = false, bold = true },
          typeStyle = { italic = false },
          variablebuiltinStyle = { italic = false },
          specialReturn = true,
          specialException = true,
          transparent = true,
          dimInactive = true,
          globalStatus = false,
          terminalColors = true,
          colors = {
            theme = {
              all = {
                ui = {
                  -- bg_gutter = "none",
                  -- float = {
                  -- bg = "none",
                  -- },
                },
              },
            },
          },
          overrides = function(colors)
            local theme = colors.theme

            return {
              -- cmp-nvim
              Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
              PmenuSel = { fg = "none", bg = theme.ui.bg_p2 },
              PmenuSbar = { bg = theme.ui.bg_m1 },
              PmenuThumb = { bg = theme.ui.bg_p2 },
              -- transparent floats
              NormalFloat = { bg = "none" },
              FloatBorder = { bg = "none" },
              FloatTitle = { bg = "none" },
              NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
              LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
              MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            }
          end,
          theme = "dragon",
          background = {
            dark = "dragon",
            light = "lotus",
          },
        }

        vim.cmd.colorscheme "kanagawa"

        -- transparent telescope
        vim.cmd "highlight TelescopeBorder guibg=none"
        vim.cmd "highlight TelescopeTitle guibg=none"
      end
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "oxocarbon" then
        vim.cmd.colorscheme "oxocarbon"
      end
    end,
  },
  {
    "phha/zenburn.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "zenburn" then
        vim.cmd.colorscheme "zenburn"
      end
    end,
  },
}
