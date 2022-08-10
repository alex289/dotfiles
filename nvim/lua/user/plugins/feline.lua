local hl = require("core.status").hl
local provider = require("core.status").provider
local vi_mode_utils = require('feline.providers.vi_mode')

local function TableConcat(t1,t2)
  for i=1,#t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

return function(leTable)
  local original_active = leTable.components.active[1]
  local spacer_and_mode = {
    { provider = provider.spacer(), hl = hl.mode() },
    {
      provider = function()
        return vi_mode_utils.get_vim_mode()
      end,
      hl = hl.mode()
    }
  }


  local new_active = TableConcat(spacer_and_mode, original_active)
  leTable.components.active[1] = new_active

  return leTable
end