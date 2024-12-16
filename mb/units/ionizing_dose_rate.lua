local Type = require "mb.units.base.type"

local IonizingDose = require "mb.units.ionizing_dose"
local Time = require "mb.units.time"

--- Ionizing dose rate units.
local IonizingDoseRate = Type.new()

--- Units cross product.
---@param a string[] Ionizing dose units.
---@param b string[] Time units.
local function cross_product(a, b)
  for _, temperature in ipairs(a) do
    for _, time in ipairs(b) do
      IonizingDoseRate:register(IonizingDose[temperature] / Time[time])
    end
  end
end

IonizingDoseRate:register_base(IonizingDose["base"] / Time["base"])
cross_product({"nSv", "uSv", "mSv", "Sv", "kSv", "MSv"}, {"t", "s", "min", "h", "d"})

return IonizingDoseRate
