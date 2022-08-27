local util = require("karma.util")
local theme = require("karma.theme")

local M = {}

function M.colorscheme()
  util.load(theme.setup())
end

return M
