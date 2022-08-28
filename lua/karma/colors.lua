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
        terminal_black = "#0A0E14",
        bg = "#0A0E14",
        bg_highlight = "#292e42",
        bg_statusline = "#292e42",

        fg = "#FFFFFF",
        fg_dark = "#a9b1d6",
        fg_gutter = "#3b4261",

        blue = "#5AD4E6",
        blue2 = "#005CC5",
        green = "#7BD88F",
        green2 = "#2D972F",
        orange = "#FD9353",
        orange2 = "#FA8D3E",
        purple = "#AF98E6",
        purple2 = "#6F42C1",
        highlight = "#a86efd",
        highlight2 = "#a76efd80",
        red = "#FC618D",
        red2 = "#FF003F",
        yellow = "#fce566",
        yellow2 = "#E3CF65",
        yellow3 = "#EEAE11",
        yellow4 = "#FFAA33",
        faint = "#1c2025",
        faint2 = "#C3BAAF",

        gray1 = "#333333",
        gray2 = "#444444",
        gray3 = "#494c59",
        gray4 = "#525053",
        gray6 = "#696969",
        gray7 = "#88898f",
        gray9 = "#bab6c0",
        gray10 = "#D7D7D7",
        gray11 = "#dfdfdf",
        gray12 = "#c3b5d3",
        gray13 = "#50505034",
        gray14 = "#f7f1ff0c",
        gray15 = "#f7f1ff12",
        gray16 = "#bab6c026",
        gray17 = "#f7f1ff19",
        gray18 = "#f7f1ff26",
        gray19 = "#fc618d19",
        gray20 = "#fc618d26",

        faint_red = "#FC618D",
        faint_green = "#7bd88f",
        faint_blue = "#5AD4E6",
        faint_purple = "#a76efd",
        faint_yellow = "#fce566",

        green100 = "#7bd88f19",
        green200 = "#7bd88f26",

        git = {
            change = "#5AD4E6",
            add = "#00000",
            delete = "#FC618D",
            conflict = "#FF003F"
        },
        gitSigns = {
            add = "#00000",
            change = "#5AD4E6",
            delete = "#FC618D"
        }
    }

    if config.style == "day" or vim.o.background == "light" then
        colors.bg = "#FFFFFF"
        colors.bg_dark = "#FFFFFF"
    end
    util.bg = colors.bg
    util.day_brightness = config.dayBrightness

    colors.diff = {
        add = util.darken(colors.green2, 0.15),
        delete = util.darken(colors.red, 0.15),
        change = util.darken(colors.blue, 0.15),
        text = colors.blue7
    }

    colors.gitSigns = {
        add = util.brighten(colors.gitSigns.add, 0.2),
        change = util.brighten(colors.gitSigns.change, 0.2),
        delete = util.brighten(colors.gitSigns.delete, 0.2)
    }

    colors.git.ignore = colors.dark3
    colors.black = util.darken(colors.bg, 0.8, "#000000")
    colors.border_highlight = colors.blue
    colors.border = colors.black

    -- Popups and statusline always get a dark background
    colors.bg_popup = colors.bg_dark
    colors.bg_statusline = colors.bg_dark

    -- Sidebar and Floats are configurable
    colors.bg_sidebar = (config.transparentSidebar and colors.none) or config.darkSidebar and colors.bg_dark or
                            colors.bg
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
