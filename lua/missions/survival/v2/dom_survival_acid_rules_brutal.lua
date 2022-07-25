return function()
    local rules = require("lua/missions/survival/v2/dom_survival_acid_rules_default.lua")()

	rules.timeToNextDifficultyLevel = 
	{			
		20, -- difficulty level 1
		50, -- difficulty level 2
		50, -- difficulty level 3	
		50, -- difficulty level 4
		50, -- difficulty level 5
		50, -- difficulty level 6
		50, -- difficulty level 7
		50, -- difficulty level 8
		50, -- difficulty level 9
	}

	rules.prepareSpawnTime = 
	{			
		36,  -- difficulty level 1
		36,  -- difficulty level 2
		36,  -- difficulty level 3
		36,  -- difficulty level 4	
		36,  -- difficulty level 5	
		36,  -- difficulty level 6	
		36,  -- difficulty level 7
		36,  -- difficulty level 8	
		36,  -- difficulty level 9	
	}

	rules.maxAttackCountPerDifficulty = 
	{			
		2,  -- difficulty level 1
		2,  -- difficulty level 2
		2,  -- difficulty level 3		
		3,  -- difficulty level 4
		3,  -- difficulty level 5
		3,  -- difficulty level 6
		3,  -- difficulty level 7
		3,  -- difficulty level 8
		4,  -- difficulty level 9
	}
	
	rules.buildingsUpgradeStartsLogic = 
	{			
		{ name = "headquarters_lvl_2", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_1_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_1_exit.logic" },   
		{ name = "headquarters_lvl_3", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_2_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_2_exit.logic" },   
		{ name = "headquarters_lvl_4", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_5", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_6", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_7", level = 1, prepareTime = 12, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
	}
	
	rules.objectivesLogic = 
	{
		{ name = "logic/objectives/kill_elite.logic", minDifficultyLevel = 3 },
		{ name = "logic/objectives/destroy_nest_granan_single.logic", minDifficultyLevel = 3, maxDifficultyLevel = 5 },
		{ name = "logic/objectives/destroy_nest_granan_multiple.logic", minDifficultyLevel = 5 },
		{ name = "logic/objectives/destroy_creeper.logic", minDifficultyLevel = 4 } 
	}

    return rules;
end