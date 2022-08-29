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
        fg_dark = "#cccccc",
        fg_gutter = "#7f7f7f",

        blue = "#5AD4E6",
        green = "#7BD88F",
        orange = "#FD9353",
        purple = "#AF98E6",
        highlight = "#a86efd",
        highlight2 = "#a76efd80",
        red = "#FC618D",
        -- red = "#FF003F",
        yellow = "#fce566",
        yellow2 = "#E3CF65",
        faint = "#1c2025",

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

        faint_red = util.brighten(colors.red, 0.2),
        faint_green = util.brighten(colors.green, 0.2),
        faint_blue = util.brighten(colors.blue, 0.2),
        faint_purple = util.brighten(colors.purple, 0.2),
        faint_yellow = util.brighten(colors.yellow, 0.2),

        green100 = util.brighten("#7bd88f", 0.19),
        green200 = util.brighten("#7bd88f", 0.19),

        git = {
            change = "#5AD4E6",
            add = "#7bd88f",
            delete = "#FC618D",
            conflict = "#FF003F"
        },
        gitSigns = {
            add = "#7bd88f",
            change = "#5AD4E6",
            delete = "#FC618D"
        }
    }

    if config.style == "day" or vim.o.background == "light" then
        colors.bg_dark = "#FFFFFF"
        colors.terminal_black = "#FFFFFF"
        colors.bg = "#FFFFFF"
        colors.bg_highlight = "#cccccc"
        colors.bg_statusline = "#7f7f7f"
        colors.fg = "#0A0E14"
        colors.fg_dark = "#292e42"
        colors.fg_gutter = "#1d283a"
        colors.blue = "#005CC5"
        colors.green = "#2D972F"
        colors.orange = "#FA8D3E"
        colors.purple = "#6F42C1"
        colors.red = "#FC618D"
        colors.yellow = "#EEAE11"
        colors.yellow2 = "#FFAA33"
        colors.faint = "#C3BAAF"
        colors.faint_red = util.brighten(colors.red, 0.2)
        colors.faint_green = util.brighten(colors.green, 0.2)
        colors.faint_blue = util.brighten(colors.blue, 0.2)
        colors.faint_purple = util.brighten(colors.purple, 0.2)
        colors.faint_yellow = util.brighten(colors.yellow, 0.2)
        colors.green100 = util.brighten("#7bd88f", 0.19)
        colors.green200 = util.brighten("#7bd88f", 0.19)
    end
    util.bg = colors.bg
    util.day_brightness = config.dayBrightness

    colors.diff = {
        add = util.darken(colors.green, 0.15),
        delete = util.darken(colors.red, 0.15),
        change = util.darken(colors.blue, 0.15),
        text = colors.fg_dark
    }

    colors.gitSigns = {
        add = util.brighten(colors.gitSigns.add, 0.2),
        change = util.brighten(colors.gitSigns.change, 0.2),
        delete = util.brighten(colors.gitSigns.delete, 0.2)
    }

    colors.git.ignore = colors.gray4
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

    colors.error = colors.red
    colors.warning = colors.yellow
    colors.info = colors.blue
    colors.hint = colors.faint_green

    util.color_overrides(colors, config)

    if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
        return util.light_colors(colors)
    end

    return colors
end

return M
