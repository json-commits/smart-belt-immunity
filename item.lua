-- Smart Belt Immunity Equipment [Item]
local smartBeltImmunityItem = table.deepcopy(data.raw["item"]["belt-immunity-equipment"])
smartBeltImmunityItem.name = "smart-belt-immunity-equipment"
smartBeltImmunityItem.icons = {
    {
        icon = smartBeltImmunityItem.icon,
        tint = {r=1,g=0.5,b=1,a=1}
    },
}
smartBeltImmunityItem.placed_as_equipment_result = "smart-belt-immunity-equipment"

-- Smart Belt Immunity Equipment [Equipment]

    -- ENABLED
    local smartBeltImmunity = table.deepcopy(data.raw["belt-immunity-equipment"]["belt-immunity-equipment"])
    smartBeltImmunity.name = "smart-belt-immunity-equipment"
    smartBeltImmunity.sprite = {
        filename = "__base__/graphics/equipment/belt-immunity-equipment.png",
        width = 32,
        height = 32,
        tint = {r=1,g=0.5,b=1,a=1}
    }

    -- DISABLED
    local smartBeltImmunityDisabled = table.deepcopy(smartBeltImmunity)
    smartBeltImmunityDisabled.name = "smart-belt-immunity-equipment-DISABLED"
    smartBeltImmunityDisabled.type = "movement-bonus-equipment"
    smartBeltImmunityDisabled.movement_bonus = 0
    smartBeltImmunityDisabled.background_color = {r=1,g=0,b=0,a=0.3}
    smartBeltImmunityDisabled.take_result = "smart-belt-immunity-equipment"

-- Smart Belt Immunity Equipment [Recipe]

local smartBeltImmunityRecipe = table.deepcopy(data.raw["recipe"]["effectivity-module"])
smartBeltImmunityRecipe.name = "smart-belt-immunity-equipment"
smartBeltImmunityRecipe.ingredients = {{"belt-immunity-equipment",1},{"effectivity-module",1}}
smartBeltImmunityRecipe.result = "smart-belt-immunity-equipment"

-- Extending the data.raw table
data:extend{smartBeltImmunityItem, smartBeltImmunity, smartBeltImmunityDisabled, smartBeltImmunityRecipe}


-- Smart Belt Immunity Equipment [Extending the data.raw.technology table]

data.raw.technology["belt-immunity-equipment"].effects = {
    data.raw.technology["belt-immunity-equipment"].effects[1],
    {
        type = "unlock-recipe",
        recipe = "smart-belt-immunity-equipment"
    }
}

