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
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "nightfox" then
        require("nightfox").setup {}
        vim.cmd.colorscheme "nordfox"
      end
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      if colorscheme == "tokyonight" then
        require("tokyonight").setup {
          style = "storm",
          styles = {
            comments = { italic = false },
            keywords = { italic = false },
          },
        }

        vim.cmd.colorscheme "tokyonight"
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
          dimInactive = false,
          globalStatus = false,
          terminalColors = true,
          colors = {
            theme = {
              all = {
                ui = {
                  bg_gutter = "none",
                  float = {
                    bg = "none",
                  },
                },
              },
            },
          },
          overrides = function(colors)
            local theme = colors.theme
            return {
              -- cmp-nvim
              Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
              PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
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
          theme = "wave",
          background = {
            dark = "wave",
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
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      if colorscheme == "catppuccin" then
        require("catppuccin").setup {}
        vim.cmd.colorscheme "catppuccin"
      end
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      if colorscheme == "oxocarbon" then
        vim.cmd.colorscheme "oxocarbon"
      end
    end,
  },
  {
    "phha/zenburn.nvim",
    config = function()
      if colorscheme == "zenburn" then
        vim.cmd.colorscheme "zenburn"
      end
    end,
  },
}
