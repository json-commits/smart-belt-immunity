function disable_belt_immunity(grid)
    for _, equipment in pairs(grid.equipment) do
        if equipment.name == 'belt-immunity-equipment' then
            equipment.energy = 0
            break
        end
    end
end

script.on_event(defines.events.on_tick,
    function()
        for _, val in pairs(game.connected_players) do
            local player = val

            if player.get_inventory(defines.inventory.character_armor) == nil then
                return
            end

            local player_armor = player.get_inventory(defines.inventory.character_armor)[1]
            if not player_armor.valid_for_read then
                return
            end

            local character = player.character
            local area_around_player = player.character.bounding_box
            for _, v in pairs(player.surface.find_entities(area_around_player)) do
                if string.find(v.name, 'belt') then
                    if character.direction == v.direction and character.walking_state['walking']then
                        disable_belt_immunity(player_armor.grid)
                        break
                    end
                end
            end

        end
    end
)
