function disable_belt_immunity(player, grid)
    equipmentPosition = nil
    for _, equipment in pairs(grid.equipment) do
        if equipment.name == "smart-belt-immunity-equipment" then
            equipmentPosition = equipment.position
            grid.take({position=equipmentPosition, by_player=player})
            grid.put({name="smart-belt-immunity-equipment-DISABLED", position=equipmentPosition, by_player=player})
            break
        end
    end
end

function enable_belt_immunity(player, grid)
    equipmentPosition = nil
    for _, equipment in pairs(grid.equipment) do
        if equipment.name == "smart-belt-immunity-equipment-DISABLED" then
            equipmentPosition = equipment.position
            grid.take({position=equipmentPosition, by_player=player})
            grid.put({name="smart-belt-immunity-equipment", position=equipmentPosition, by_player=player})
            break
        end
    end
end



script.on_event(defines.events.on_player_changed_position,
        function(event)
            local player = game.players[event.player_index]
            if player.get_inventory(defines.inventory.character_armor) == nil then
                return
            end

            local player_armor = player.get_inventory(defines.inventory.character_armor)[1]
            if not player_armor.valid_for_read then
                return
            end

            if player_armor.grid == nil then
                return
            end

            local character = player.character
            local area_around_player = player.character.bounding_box
            for _, v in pairs(player.surface.find_entities(area_around_player)) do
                if string.find(v.name, 'belt') then
                    if character.direction == v.direction and character.walking_state['walking']then
                        disable_belt_immunity(player, player_armor.grid)
                        break
                    else
                        enable_belt_immunity(player, player_armor.grid)
                        break
                    end
                end
            end
        end
)