return function()
    local rules = {}

	rules.maxObjectivesAtOnce = 2
	rules.eventsPerIdleState = 0
	rules.eventsPerPrepareState = 1 -- [0,1]
	rules.pauseAttacks = false
	rules.prepareAttacks = false

	rules.gameEvents = 
	{
		{ action = "new_objective", type = "POSITIVE", gameStates="IDLE|STREAMING", minEventLevel = 3 }, -- new_objective is only an option in the streaming mode; do not try to pass it as NO_STREAMING
		{ action = "change_time_of_day", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 3 },
		{ action = "add_resource", type = "POSITIVE", gameStates = "ATTACK|IDLE|STREAMING", minEventLevel = 1, basePercentage = 30 },
		{ action = "remove_resource", type = "NEGATIVE", gameStates = "ATTACK|IDLE|STREAMING", minEventLevel = 1, basePercentage = 20 },
		{ action = "stronger_attack", type = "NEGATIVE", gameStates = "ATTACK|STREAMING", minEventLevel = 1, amount = 2 },
		{ action = "cancel_the_attack", type = "POSITIVE", gameStates = "ATTACK|STREAMING", minEventLevel = 1 },
		{ action = "unlock_research", type = "POSITIVE", gameStates = "ATTACK|IDLE|STREAMING", minEventLevel = 1 },
		{ action = "full_ammo", type = "POSITIVE", gameStates = "ATTACK|STREAMING", minEventLevel = 2 },
		{ action = "remove_ammo", type = "NEGATIVE", gameStates = "ATTACK|STREAMING", minEventLevel = 2 },
		{ action = "boss_attack", type = "NEGATIVE", gameStates = "ATTACK|STREAMING", minEventLevel = 4 },
		{ action = "shegret_attack", type = "NEGATIVE", gameStates="IDLE|STREAMING", minEventLevel = 3, logicFile="logic/event/shegret_attack.logic", weight = 3 },
		{ action = "shegret_attack", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/event/shegret_attack.logic", weight = 3 },
		-- { action = "spawn_earthquake", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 1, logicFile="logic/weather/earthquake.logic", minTime = 60, maxTime = 60 },
		-- { action = "spawn_earthquake", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 1, logicFile="logic/weather/earthquake.logic", minTime = 60, maxTime = 60 },		
		{ action = "spawn_blood_moon", type = "NEGATIVE", gameStates="IDLE|STREAMING", minEventLevel = 3, logicFile="logic/weather/blood_moon.logic", minTime = 60, maxTime = 120, weight = 0.5 },
		{ action = "spawn_blood_moon", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/weather/blood_moon.logic", minTime = 60, maxTime = 120, weight = 0.5 },
		{ action = "spawn_blue_moon", type = "POSITIVE", gameStates="IDLE|STREAMING", minEventLevel = 3, logicFile="logic/weather/blue_moon.logic", minTime = 60, maxTime = 120, weight = 0.5 },
		{ action = "spawn_blue_moon", type = "POSITIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/weather/blue_moon.logic", minTime = 60, maxTime = 120, weight = 0.5 },
		{ action = "spawn_solar_burn", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 1, logicFile="logic/weather/solar_burn.logic", minTime = 15, maxTime = 30, weight = 4 },
		{ action = "spawn_solar_burn", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 1, logicFile="logic/weather/solar_burn.logic", minTime = 15, maxTime = 30, weight = 4 },
		{ action = "spawn_solar_eclipse", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 4, logicFile="logic/weather/solar_eclipse.logic", minTime = 60, maxTime = 120, weight = 0.25 },
		{ action = "spawn_solar_eclipse", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 4, logicFile="logic/weather/solar_eclipse.logic", minTime = 60, maxTime = 120, weight = 0.25  },
		{ action = "spawn_super_moon", type = "POSITIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 4, logicFile="logic/weather/super_moon.logic", minTime = 60, maxTime = 120, weight = 0.25  },
		{ action = "spawn_super_moon", type = "POSITIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 4, logicFile="logic/weather/super_moon.logic", minTime = 60, maxTime = 120, weight = 0.25  },				
		-- { action = "spawn_ion_storm", type = "POSITIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 3, logicFile="logic/weather/ion_storm.logic", minTime = 60, maxTime = 120, weight = 0.5 },
		-- { action = "spawn_ion_storm", type = "POSITIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/weather/ion_storm.logic", minTime = 60, maxTime = 120, weight = 0.5 },				
		-- { action = "spawn_volcanic_rock_rain", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 1, logicFile="logic/weather/volcanic_rock_rain.logic", minTime = 40, maxTime = 90 },
		-- { action = "spawn_volcanic_rock_rain", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 1, logicFile="logic/weather/volcanic_rock_rain.logic", minTime = 40, maxTime = 90 },
		-- { action = "spawn_volcanic_ash_clouds", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 1, logicFile="logic/weather/volcanic_ash_clouds.logic", minTime = 60, maxTime = 120 },
		-- { action = "spawn_volcanic_ash_clouds", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 1, logicFile="logic/weather/volcanic_ash_clouds.logic", minTime = 60, maxTime = 120 },	
		{ action = "spawn_resource_comet", type = "POSITIVE", gameStates = "IDLE|STREAMING", minEventLevel = 3, logicFile="logic/weather/resource_comet.logic"  },
		{ action = "spawn_resource_comet", type = "POSITIVE", gameStates = "IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/weather/resource_comet.logic"  },
		-- { action = "spawn_resource_earthquake", type = "POSITIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 3, logicFile="logic/weather/resource_earthquake.logic" },
		-- { action = "spawn_resource_earthquake", type = "POSITIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 3, logicFile="logic/weather/resource_earthquake.logic" },		
		{ action = "spawn_meteor_shower", type = "NEGATIVE", gameStates="ATTACK|IDLE|STREAMING", minEventLevel = 4, logicFile="logic/weather/meteor_shower.logic", minTime = 40, maxTime = 90, weight = 0.5 },
		{ action = "spawn_meteor_shower", type = "NEGATIVE", gameStates="IDLE|NO_STREAMING", minEventLevel = 4, logicFile="logic/weather/meteor_shower.logic", minTime = 40, maxTime = 90, weight = 0.5 },
	}

	rules.addResourcesOnRunOut = 
	{
		{ name = "carbon_vein", runOutPercentageOnMap = 45, minToSpawn = 10000, maxToSpawn = 20000 },
		{ name = "iron_vein", runOutPercentageOnMap = 45, minToSpawn = 10000, maxToSpawn = 20000 },

	}

	rules.timeToNextDifficultyLevel = 
	{			
		200, -- difficulty level 1
		600, -- difficulty level 2
		600, -- difficulty level 3	
		600, -- difficulty level 4
		600, -- difficulty level 5
		600, -- difficulty level 6
		600, -- difficulty level 7
		600, -- difficulty level 8
		600, -- difficulty level 9
	}

	rules.prepareSpawnTime = 
	{			
		360,  -- difficulty level 1
		360,  -- difficulty level 2
		360,  -- difficulty level 3
		360,  -- difficulty level 4	
		360,  -- difficulty level 5	
		360,  -- difficulty level 6	
		360,  -- difficulty level 7
		360,  -- difficulty level 8	
		360,  -- difficulty level 9	
	}

	rules.buildingsUpgradeStartsLogic = 
	{			
		{ name = "headquarters_lvl_2", level = 1, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_1_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_1_exit.logic" },   
		{ name = "headquarters_lvl_3", level = 1, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_2_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_2_exit.logic" },   
		{ name = "headquarters_lvl_4", level = 1, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_5", level = 2, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_6", level = 2, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_7", level = 2, prepareTime = 120, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
	}

	rules.objectivesLogic = 
	{
		{ name = "logic/objectives/destroy_nest_morirot_single.logic", minDifficultyLevel = 3, maxDifficultyLevel = 6 }, 
		{ name = "logic/objectives/destroy_nest_morirot_multiple.logic", minDifficultyLevel = 6 },
		{ name = "logic/objectives/kill_elite_krocoon.logic", minDifficultyLevel = 3 },
		{ name = "logic/objectives/destroy_nest_wingmite_single.logic", minDifficultyLevel = 3, maxDifficultyLevel = 5 }, 
		{ name = "logic/objectives/destroy_nest_wingmite_multiple.logic", minDifficultyLevel = 5 },
		{ name = "logic/objectives/destroy_nest_bradron_single.logic", minDifficultyLevel = 4, maxDifficultyLevel = 6 }, 
		{ name = "logic/objectives/destroy_nest_bradron_multiple.logic", minDifficultyLevel = 6 },
		{ name = "logic/objectives/destroy_nest_octabit_single.logic", minDifficultyLevel = 5, maxDifficultyLevel = 7 }, 
		{ name = "logic/objectives/destroy_nest_octabit_multiple.logic", minDifficultyLevel = 7 },
		{ name = "logic/objectives/destroy_nest_flurian_single.logic", minDifficultyLevel = 6, maxDifficultyLevel = 8 }, 
		{ name = "logic/objectives/destroy_nest_flurian_multiple.logic", minDifficultyLevel = 8 },
		{ name = "logic/objectives/kill_elite.logic", minDifficultyLevel = 3 },
		{ name = "logic/objectives/destroy_nest_canoptrix_single.logic", minDifficultyLevel = 3 },
		{ name = "logic/objectives/destroy_creeper.logic", minDifficultyLevel = 6 },
		{ name = "logic/objectives/destroy_nest_granan_single.logic", minDifficultyLevel = 3, maxDifficultyLevel = 5 },
		{ name = "logic/objectives/destroy_nest_granan_multiple.logic", minDifficultyLevel = 5 },
		{ name = "logic/objectives/destroy_creeper.logic", minDifficultyLevel = 6 },
		{ name = "logic/objectives/destroy_nest_mushbit_single.logic", minDifficultyLevel = 3, maxDifficultyLevel = 6 }, 
		{ name = "logic/objectives/destroy_nest_mushbit_multiple.logic", minDifficultyLevel = 3 } 

	}

	rules.cooldownAfterAttacks = 
	{			
		60,  -- difficulty level 1
		90,  -- difficulty level 2
		120,  -- difficulty level 3
		180,  -- difficulty level 4	
		180,  -- difficulty level 5	
		180,  -- difficulty level 6	
		240,  -- difficulty level 7
		240,  -- difficulty level 8	
		240,  -- difficulty level 9	
	}

	rules.idleTime = 
	{			
		0,  -- difficulty level 1
		0,  -- difficulty level 2
		0,  -- difficulty level 3
		0,  -- difficulty level 4	
		0,  -- difficulty level 5	
		0,  -- difficulty level 6	
		0,  -- difficulty level 7
		0,  -- difficulty level 8	
		0,  -- difficulty level 9	
	}

	rules.maxAttackCountPerDifficulty = 
	{			
		1,  -- difficulty level 1
		2,  -- difficulty level 2
		2,  -- difficulty level 3		
		3,  -- difficulty level 4
		3,  -- difficulty level 5
		3,  -- difficulty level 6
		3,  -- difficulty level 7
		3,  -- difficulty level 8
		4,  -- difficulty level 9
	}
	
	rules.wavesEntryDefinitions =
	{
		 -- difficulty level 1
			"logic/missions/survival/attack_level_1_entry.logic",
		 -- difficulty level 2
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 3		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 4		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 5		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 6		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 7		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 8		
			"logic/missions/survival/attack_level_2_entry.logic",
		 -- difficulty level 9		
			"logic/missions/survival/attack_level_2_entry.logic",		
	}

	rules.waves =
	{
		["default"] =
		{
			 -- difficulty level 1
			{
				"logic/missions/survival/attack_level_1_id_1.logic",
				"logic/missions/survival/attack_level_1_id_1_acid.logic",
				"logic/missions/survival/attack_level_1_id_1_desert.logic",
				"logic/missions/survival/attack_level_1_id_1_magma.logic",
				"logic/missions/survival/attack_level_1_id_2.logic",
				"logic/missions/survival/attack_level_1_id_2_acid.logic",
				"logic/missions/survival/attack_level_1_id_2_desert.logic",
				"logic/missions/survival/attack_level_1_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_1_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_1_id_2_metallic.logic",

			

			},

			 -- difficulty level 2
			{
				"logic/missions/survival/attack_level_2_id_1.logic",
				"logic/missions/survival/attack_level_2_id_1_acid.logic",
				"logic/missions/survival/attack_level_2_id_1_desert.logic",
				"logic/missions/survival/attack_level_2_id_1_magma.logic",
				"logic/missions/survival/attack_level_2_id_2.logic",
				"logic/missions/survival/attack_level_2_id_2_acid.logic",
				"logic/missions/survival/attack_level_2_id_2_desert.logic",
				"logic/missions/survival/attack_level_2_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_2_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_2_id_2_metallic.logic",

			},

			 -- difficulty level 3
			{
				"logic/missions/survival/attack_level_3_id_1.logic",
				"logic/missions/survival/attack_level_3_id_1_acid.logic",
				"logic/missions/survival/attack_level_3_id_1_desert.logic",
				"logic/missions/survival/attack_level_3_id_1_magma.logic",
				"logic/missions/survival/attack_level_3_id_2.logic",
				"logic/missions/survival/attack_level_3_id_2_acid.logic",
				"logic/missions/survival/attack_level_3_id_2_desert.logic",
				"logic/missions/survival/attack_level_3_id_2_magma.logic",

				"logic/missions/survival/attack_level_3_id_1.logic",
				"logic/missions/survival/attack_level_3_id_1_acid.logic",
				"logic/missions/survival/attack_level_3_id_1_desert.logic",
				"logic/missions/survival/attack_level_3_id_1_magma.logic",
				"logic/missions/survival/attack_level_3_id_2.logic",
				"logic/missions/survival/attack_level_3_id_2_acid.logic",
				"logic/missions/survival/attack_level_3_id_2_desert.logic",
				"logic/missions/survival/attack_level_3_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_3_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_3_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_3_id_3_metallic.logic", -- double wave to increase octabit probability
				"logic/missions/survival/metallic/attack_level_3_id_3_metallic.logic", -- double wave to increase octabit probability

			},

			 -- difficulty level 4
			{
				"logic/missions/survival/attack_level_4_id_1.logic",
				"logic/missions/survival/attack_level_4_id_1_acid.logic",
				"logic/missions/survival/attack_level_4_id_1_desert.logic",
				"logic/missions/survival/attack_level_4_id_1_magma.logic",
				"logic/missions/survival/attack_level_4_id_2.logic",
				"logic/missions/survival/attack_level_4_id_2_acid.logic",
				"logic/missions/survival/attack_level_4_id_2_desert.logic",
				"logic/missions/survival/attack_level_4_id_2_magma.logic",

				"logic/missions/survival/attack_level_4_id_1.logic",
				"logic/missions/survival/attack_level_4_id_1_acid.logic",
				"logic/missions/survival/attack_level_4_id_1_desert.logic",
				"logic/missions/survival/attack_level_4_id_1_magma.logic",
				"logic/missions/survival/attack_level_4_id_2.logic",
				"logic/missions/survival/attack_level_4_id_2_acid.logic",
				"logic/missions/survival/attack_level_4_id_2_desert.logic",
				"logic/missions/survival/attack_level_4_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_4_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_4_id_1_metallic.logic",				
				"logic/missions/survival/metallic/attack_level_4_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_4_id_3_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_4_id_4_metallic.logic",

			},

			 -- difficulty level 5
			{
				"logic/missions/survival/attack_level_5_id_1.logic",
				"logic/missions/survival/attack_level_5_id_1_acid.logic",
				"logic/missions/survival/attack_level_5_id_1_desert.logic",
				"logic/missions/survival/attack_level_5_id_1_magma.logic",
				"logic/missions/survival/attack_level_5_id_2.logic",
				"logic/missions/survival/attack_level_5_id_2_acid.logic",
				"logic/missions/survival/attack_level_5_id_2_desert.logic",
				"logic/missions/survival/attack_level_5_id_2_magma.logic",

				"logic/missions/survival/attack_level_5_id_1.logic",
				"logic/missions/survival/attack_level_5_id_1_acid.logic",
				"logic/missions/survival/attack_level_5_id_1_desert.logic",
				"logic/missions/survival/attack_level_5_id_1_magma.logic",
				"logic/missions/survival/attack_level_5_id_2.logic",
				"logic/missions/survival/attack_level_5_id_2_acid.logic",
				"logic/missions/survival/attack_level_5_id_2_desert.logic",
				"logic/missions/survival/attack_level_5_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_5_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_5_id_2_metallic.logic",	
				"logic/missions/survival/metallic/attack_level_5_id_2_metallic.logic",					
				"logic/missions/survival/metallic/attack_level_5_id_3_metallic.logic",			
				--"logic/missions/survival/metallic/attack_level_5_id_4_metallic.logic",			

			},

			 -- difficulty level 6
			{
				"logic/missions/survival/attack_level_6_id_1.logic",
				"logic/missions/survival/attack_level_6_id_1_acid.logic",
				"logic/missions/survival/attack_level_6_id_1_desert.logic",
				"logic/missions/survival/attack_level_6_id_1_magma.logic",
				"logic/missions/survival/attack_level_6_id_2.logic",
				"logic/missions/survival/attack_level_6_id_2_acid.logic",
				"logic/missions/survival/attack_level_6_id_2_desert.logic",
				"logic/missions/survival/attack_level_6_id_2_magma.logic",

				"logic/missions/survival/attack_level_6_id_1.logic",
				"logic/missions/survival/attack_level_6_id_1_acid.logic",
				"logic/missions/survival/attack_level_6_id_1_desert.logic",
				"logic/missions/survival/attack_level_6_id_1_magma.logic",
				"logic/missions/survival/attack_level_6_id_2.logic",
				"logic/missions/survival/attack_level_6_id_2_acid.logic",
				"logic/missions/survival/attack_level_6_id_2_desert.logic",
				"logic/missions/survival/attack_level_6_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_6_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_6_id_2_metallic.logic",			
				"logic/missions/survival/metallic/attack_level_6_id_3_metallic.logic",		
				"logic/missions/survival/metallic/attack_level_6_id_3_metallic.logic",				
				--"logic/missions/survival/metallic/attack_level_6_id_4_metallic.logic",			
				--"logic/missions/survival/metallic/attack_level_6_id_5_metallic.logic",			

			},

			 -- difficulty level 7
			{
				"logic/missions/survival/attack_level_7_id_1.logic",
				"logic/missions/survival/attack_level_7_id_1_acid.logic",
				"logic/missions/survival/attack_level_7_id_1_desert.logic",
				"logic/missions/survival/attack_level_7_id_1_magma.logic",
				"logic/missions/survival/attack_level_7_id_2.logic",
				"logic/missions/survival/attack_level_7_id_2_acid.logic",
				"logic/missions/survival/attack_level_7_id_2_desert.logic",
				"logic/missions/survival/attack_level_7_id_2_magma.logic",

				"logic/missions/survival/attack_level_7_id_1.logic",
				"logic/missions/survival/attack_level_7_id_1_acid.logic",
				"logic/missions/survival/attack_level_7_id_1_desert.logic",
				"logic/missions/survival/attack_level_7_id_1_magma.logic",
				"logic/missions/survival/attack_level_7_id_2.logic",
				"logic/missions/survival/attack_level_7_id_2_acid.logic",
				"logic/missions/survival/attack_level_7_id_2_desert.logic",
				"logic/missions/survival/attack_level_7_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_7_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_7_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_7_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_7_id_3_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_7_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_7_id_5_metallic.logic",

			},

			 -- difficulty level 8
			{
				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_8_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_3_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_5_metallic.logic",

			},

			 -- difficulty level 9
			{
				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_8_id_1_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_2_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_3_metallic.logic",
				"logic/missions/survival/metallic/attack_level_8_id_3_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_5_metallic.logic",

			},
		},
	}

	rules.extraWaves =
	{
		 -- difficulty level 1
			{
				"logic/missions/survival/attack_level_1_id_1.logic",
				"logic/missions/survival/attack_level_1_id_1_acid.logic",
				"logic/missions/survival/attack_level_1_id_1_desert.logic",
				"logic/missions/survival/attack_level_1_id_1_magma.logic",
				"logic/missions/survival/attack_level_1_id_2.logic",
				"logic/missions/survival/attack_level_1_id_2_acid.logic",
				"logic/missions/survival/attack_level_1_id_2_desert.logic",
				"logic/missions/survival/attack_level_1_id_2_magma.logic",
				"logic/missions/survival/attack_boss_nurglax.logic",

				"logic/missions/survival/metallic/attack_level_1_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_1_id_2_metallic_alpha.logic",
	

			},

			 -- difficulty level 2
			{
				"logic/missions/survival/attack_level_2_id_1.logic",
				"logic/missions/survival/attack_level_2_id_1_acid.logic",
				"logic/missions/survival/attack_level_2_id_1_desert.logic",
				"logic/missions/survival/attack_level_2_id_1_magma.logic",
				"logic/missions/survival/attack_level_2_id_2.logic",
				"logic/missions/survival/attack_level_2_id_2_acid.logic",
				"logic/missions/survival/attack_level_2_id_2_desert.logic",
				"logic/missions/survival/attack_level_2_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_2_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_2_id_2_metallic_alpha.logic",
	
			},

			 -- difficulty level 3
			{
				"logic/missions/survival/attack_level_3_id_1.logic",
				"logic/missions/survival/attack_level_3_id_1_acid.logic",
				"logic/missions/survival/attack_level_3_id_1_desert.logic",
				"logic/missions/survival/attack_level_3_id_1_magma.logic",
				"logic/missions/survival/attack_level_3_id_2.logic",
				"logic/missions/survival/attack_level_3_id_2_acid.logic",
				"logic/missions/survival/attack_level_3_id_2_desert.logic",
				"logic/missions/survival/attack_level_3_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_3_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_3_id_2_metallic_alpha.logic",
	
			},

			 -- difficulty level 4
			{
				"logic/missions/survival/attack_level_4_id_1.logic",
				"logic/missions/survival/attack_level_4_id_1_acid.logic",
				"logic/missions/survival/attack_level_4_id_1_desert.logic",
				"logic/missions/survival/attack_level_4_id_1_magma.logic",
				"logic/missions/survival/attack_level_4_id_2.logic",
				"logic/missions/survival/attack_level_4_id_2_acid.logic",
				"logic/missions/survival/attack_level_4_id_2_desert.logic",
				"logic/missions/survival/attack_level_4_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_4_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_4_id_2_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_4_id_3_metallic_alpha.logic",
	
			},

			 -- difficulty level 5
			{
				"logic/missions/survival/attack_level_5_id_1.logic",
				"logic/missions/survival/attack_level_5_id_1_acid.logic",
				"logic/missions/survival/attack_level_5_id_1_desert.logic",
				"logic/missions/survival/attack_level_5_id_1_magma.logic",
				"logic/missions/survival/attack_level_5_id_2.logic",
				"logic/missions/survival/attack_level_5_id_2_acid.logic",
				"logic/missions/survival/attack_level_5_id_2_desert.logic",
				"logic/missions/survival/attack_level_5_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_5_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_5_id_2_metallic_alpha.logic",			
				"logic/missions/survival/metallic/attack_level_5_id_3_metallic_alpha.logic",			
				--"logic/missions/survival/metallic/attack_level_5_id_4_metallic.logic",			
	
			},

			 -- difficulty level 6
			{
				"logic/missions/survival/attack_level_6_id_1.logic",
				"logic/missions/survival/attack_level_6_id_1_acid.logic",
				"logic/missions/survival/attack_level_6_id_1_desert.logic",
				"logic/missions/survival/attack_level_6_id_1_magma.logic",
				"logic/missions/survival/attack_level_6_id_2.logic",
				"logic/missions/survival/attack_level_6_id_2_acid.logic",
				"logic/missions/survival/attack_level_6_id_2_desert.logic",
				"logic/missions/survival/attack_level_6_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_6_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_6_id_2_metallic_alpha.logic",			
				"logic/missions/survival/metallic/attack_level_6_id_3_metallic_alpha.logic",			
				--"logic/missions/survival/metallic/attack_level_6_id_4_metallic.logic",			
				--"logic/missions/survival/metallic/attack_level_6_id_5_metallic.logic",			
	
			},

			 -- difficulty level 7
			{
				"logic/missions/survival/attack_level_7_id_1.logic",
				"logic/missions/survival/attack_level_7_id_1_acid.logic",
				"logic/missions/survival/attack_level_7_id_1_desert.logic",
				"logic/missions/survival/attack_level_7_id_1_magma.logic",
				"logic/missions/survival/attack_level_7_id_2.logic",
				"logic/missions/survival/attack_level_7_id_2_acid.logic",
				"logic/missions/survival/attack_level_7_id_2_desert.logic",
				"logic/missions/survival/attack_level_7_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_7_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_7_id_2_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_7_id_3_metallic_alpha.logic",
				--"logic/missions/survival/metallic/attack_level_7_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_7_id_5_metallic.logic",
	
			},

			 -- difficulty level 8
			{
				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_8_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_8_id_2_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_8_id_3_metallic_alpha.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_5_metallic.logic",
	
			},

			 -- difficulty level 9
			{
				"logic/missions/survival/attack_level_8_id_1.logic",
				"logic/missions/survival/attack_level_8_id_1_acid.logic",
				"logic/missions/survival/attack_level_8_id_1_desert.logic",
				"logic/missions/survival/attack_level_8_id_1_magma.logic",
				"logic/missions/survival/attack_level_8_id_2.logic",
				"logic/missions/survival/attack_level_8_id_2_acid.logic",
				"logic/missions/survival/attack_level_8_id_2_desert.logic",
				"logic/missions/survival/attack_level_8_id_2_magma.logic",

				"logic/missions/survival/metallic/attack_level_8_id_1_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_8_id_2_metallic_alpha.logic",
				"logic/missions/survival/metallic/attack_level_8_id_3_metallic_alpha.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_4_metallic.logic",
				--"logic/missions/survival/metallic/attack_level_8_id_5_metallic.logic",
	
			},
	}

	rules.bosses =
	{
		 -- difficulty level 1
		{

			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 2
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 3
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 4
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 5
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 6
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 7
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 8
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},

		 -- difficulty level 9
		{
			"logic/missions/survival/attack_boss_arachnoid.logic",
			"logic/missions/survival/attack_boss_baxmoth.logic",
			"logic/missions/survival/attack_boss_nurglax.logic",
			"logic/missions/survival/attack_boss_stregaros.logic",
			"logic/missions/survival/attack_boss_magmoth.logic",
			"logic/missions/survival/attack_boss_gnerot.logic",
			"logic/missions/survival/attack_boss_nerilian.logic",
			"logic/missions/survival/attack_boss_krocoon.logic",
		},
	}

    return rules;
end