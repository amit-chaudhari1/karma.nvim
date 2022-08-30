local config = require("karma.config")
local colors = require("karma.colors").setup(config)
local util = require("karma.util")

local karma = {}

karma.normal = {
  a = { bg = colors.blue, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.fg },
  c = { bg = colors.bg_highlight, fg = colors.fg_sidebar },
}

karma.insert = {
  a = { bg = colors.green, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.green },
}

karma.command = {
  a = { bg = colors.yellow, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.yellow },
}

karma.visual = {
  a = { bg = colors.bg_highlight, fg = colors.fg },
  b = { bg = colors.bg_highlight, fg = colors.fg },
}

karma.replace = {
  a = { bg = colors.red, fg = colors.black },
  b = { bg = colors.bg_highlight, fg = colors.red },
}

karma.inactive = {
  a = { bg = colors.bg_highlight, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.bg_highlight, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.bg_highlight },
}

if vim.o.background == "light" then
  for _, mode in pairs(karma) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

if vim.g.karma_lualine_bold then
  for _, mode in pairs(karma) do
    mode.a.gui = "bold"
  end
end

return karma
