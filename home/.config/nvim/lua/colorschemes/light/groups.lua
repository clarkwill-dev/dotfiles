local M = {}

-- lua/colorschemes/light/groups.lua
local colors = require 'colorschemes.light.palette'

local M = {}

M.setup = function()
  return {
    Normal = { bg = colors.bg, fg = colors.fg },
    -- add more groups here:
    -- Comment = { fg = colors.comment, italic = false },
    -- Keyword = { fg = colors.keyword },
    -- etc.
  }
end

return M
