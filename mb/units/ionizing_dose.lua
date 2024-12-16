local Unit = require "mb.units.base.unit"
local Type = require "mb.units.base.type"

local Prefix = require "mb.units.prefix"

--- Ionizing dose units.
local IonizingDose = Type.new()

IonizingDose:register_base(Unit.BASE .. "Sv") -- Sievert.
IonizingDose:register(IonizingDose["Sv"] * 0.01 ~ "rem") -- Roentgen Equivalent Man.

--- Apply prefxes to the unit.
---@param unit string
---@param prefixes string[]
local function apply_prefixes(unit, prefixes)
  for _, prefix in ipairs(prefixes) do
    IonizingDose:register(Prefix[prefix] * IonizingDose[unit])
  end
end

apply_prefixes("Sv", {"n", "u", "m", "k", "M"})

return IonizingDose
