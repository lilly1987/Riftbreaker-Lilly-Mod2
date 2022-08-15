require("lua/utils/table_utils.lua")
require("lua/utils/rules_utils.lua")

local survival_base = require( "lua/missions/survival/survival_base.lua" )
class 'CreeperHunter' ( survival_base )

function CreeperHunter:__init()
    survival_base.__init(self,self)
end

function CreeperHunter:init()

----------------------------------------------------------------------------------------------------------------------------
	
	self:PrepareSpawnPoints();

	local database = self.data

    	MissionService:ActivateMissionFlow("", "logic/missions/survival/default.logic", "default", database )
	local rules = require( GetRulesForDifficulty( "lua/missions/survival/dom_survival_jungle_rules_" ) )()
	MissionService:AddGameRule( "lua/missions/dom_manager.lua", rules )

	self:RegisterHandler( event_sink, "DestroyRequest",  "_OnDestroyRequest" )

end

------------------------------------------------------------------------------------------------------------------------------

local function SpawnCreeperLoot( entity, blueprint, minAmount, maxAmount, packageSize )

	local spawnCount = RandInt( minAmount, maxAmount )

	while ( spawnCount > 0 )
	do
	        local count = math.min( spawnCount, packageSize )
        	spawnCount = spawnCount - count

	        ItemService:SpawnLoot( entity, blueprint, count )
    	end
end


function CreeperHunter:_OnDestroyRequest( evt )
	
	local entity = evt:GetEntity()
	local blueprint = EntityService:GetBlueprintName( entity )
	local randomExtraLoot

	--creeper_branch loot
	if (blueprint == "units/ground/creeper_branch_01") or
	   (blueprint == "units/ground/creeper_branch_02") or
	   (blueprint == "units/ground/creeper_branch_03") then
		--common resources
		SpawnCreeperLoot( entity, "items/loot/resources/shard_carbonium_item", 0, 3, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/shard_steel_item", 0, 3, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/biomass_plant_item", 1, 2, 2 )	

	end


	--creeper_root loot
	if (blueprint == "units/ground/creeper_root_01") or
	   (blueprint == "units/ground/creeper_root_02") or
	   (blueprint == "units/ground/creeper_root_03") then

		--common resources
		SpawnCreeperLoot( entity, "items/loot/resources/shard_carbonium_item", 5, 10, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/shard_steel_item", 5, 10, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/biomass_plant_item", 10, 20, 3 )

		--rare resources
		randomExtraLoot = RandInt( 1, 8 )
		if randomExtraLoot == 1 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_cobalt_item", 10, 20, 3 )
		elseif randomExtraLoot == 2 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_ferdonite_item", 10, 20, 3 )
		elseif randomExtraLoot == 3 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_hazenite_item", 10, 20, 3 )
		elseif randomExtraLoot == 4 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_palladium_item", 10, 20, 3 )
		elseif randomExtraLoot == 5 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_rhodonite_item", 10, 20, 3 )
		elseif randomExtraLoot == 6 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_tanzanite_item", 10, 20, 3 )
		elseif randomExtraLoot == 7 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_titanium_item", 10, 20, 3 )
		elseif randomExtraLoot == 8 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_uranium_ore_item", 10, 20, 3 )
		end

	end

	--creeper_root_origin loot
	if (blueprint == "units/ground/ch_creeper_root_origin_01") or
	   (blueprint == "units/ground/ch_creeper_root_origin_02") or
	   (blueprint == "units/ground/ch_creeper_root_origin_03") then

		--common resources
		SpawnCreeperLoot( entity, "items/loot/resources/shard_carbonium_item", 50, 100, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/shard_steel_item", 50, 100, 3 )
		SpawnCreeperLoot( entity, "items/loot/resources/biomass_plant_item", 100, 200, 3 )

		--rare resources
		randomExtraLoot = RandInt( 1, 8 )
		if randomExtraLoot == 1 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_cobalt_item", 100, 200, 3 )
		elseif randomExtraLoot == 2 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_ferdonite_item", 100, 200, 3 )
		elseif randomExtraLoot == 3 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_hazenite_item", 100, 200, 3 )
		elseif randomExtraLoot == 4 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_palladium_item", 100, 200, 3 )
		elseif randomExtraLoot == 5 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_rhodonite_item", 100, 200, 3 )
		elseif randomExtraLoot == 6 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_tanzanite_item", 100, 200, 3 )
		elseif randomExtraLoot == 7 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_titanium", 100, 200, 3 )
		elseif randomExtraLoot == 8 then
			SpawnCreeperLoot( entity, "items/loot/resources/shard_uranium_ore_item", 100, 200, 3 )
		end

		--extreme weapon mods (limited resource)
		randomExtraLoot = RandInt( 1, 24 )
		if randomExtraLoot == 1 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_ammo_cost_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 2 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_ammo_spread_add_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 3 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_ammo_spread_sub_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 4 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_autoaim_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 5 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_autoaim_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 6 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_cluster_projectiles_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 7 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_cluster_projectiles_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 8 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_critical_chance_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 9 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_damage_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 10 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_damage_over_time_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 11 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_damage_over_time_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 12 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_damage_penetration_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 13 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_damage_penetration_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 14 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_fire_per_shot_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 15 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_fire_rate_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 16 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_homing_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 17 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_homing_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 18 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_lifesteal_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 19 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_lifesteal_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 20 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_range_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 21 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_splash_damage_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 22 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_splash_damage_enable_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 23 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_stun_chance_extreme_item", 1, 1, 1 )
		elseif randomExtraLoot == 24 then
			SpawnCreeperLoot( entity, "items/loot/weapon_mods/mod_stun_chance_enable_extreme_item", 1, 1, 1 )
		end

	end


end

return CreeperHunter
