local util = require("karma.util")

-- credits to folke/tokyonight and the amazing theme tokyonight

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("karma.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    bg_dark = "#0A0E14",
    bg = "#24283b",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#FFFFFF",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue = "#3d59a1",
    cyan = "#7dcfff",
    blue6 = "#B4F9F8",
    magenta = "#bb9af7",
    purple = "#9d7cd8",
    magenta2 = "#ff007c",
    yellow2 = "#e3cf65",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
    colors.bg_dark = "#16161e"
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

  colors.bg_visual = util.darken(colors.blue, 0.7)
  colors.bg_search = colors.blue
  colors.fg_sidebar = colors.fg_dark

  colors.error = colors.red1
  colors.warning = colors.yellow
  colors.info = colors.blue
  colors.hint = colors.teal

  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
