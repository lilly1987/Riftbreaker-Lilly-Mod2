return function()
    local rules = require("lua/missions/survival/v2/dom_survival_jungle_rules_default.lua")()

	rules.maxObjectivesAtOnce = 1

	rules.timeToNextDifficultyLevel = 
	{			
		30, -- difficulty level 1
		72, -- difficulty level 2
		72, -- difficulty level 3	
		72, -- difficulty level 4
		72, -- difficulty level 5
		72, -- difficulty level 6
		72, -- difficulty level 7
		72, -- difficulty level 8
		72, -- difficulty level 9
	}
	
	rules.prepareSpawnTime = 
	{			
		48,  -- difficulty level 1
		48,  -- difficulty level 2
		48,  -- difficulty level 3
		48,  -- difficulty level 4	
		48,  -- difficulty level 5	
		48,  -- difficulty level 6	
		48,  -- difficulty level 7
		48,  -- difficulty level 8	
		48,  -- difficulty level 9	
	}

	rules.maxAttackCountPerDifficulty = 
	{			
		1,  -- difficulty level 1
		1,  -- difficulty level 2
		1,  -- difficulty level 3		
		1,  -- difficulty level 4
		1,  -- difficulty level 5
		2,  -- difficulty level 6
		2,  -- difficulty level 7
		2,  -- difficulty level 8
		2,  -- difficulty level 9
	}
	
	rules.buildingsUpgradeStartsLogic = 
	{			
		{ name = "headquarters_lvl_2", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_1_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_1_exit.logic" },   
		{ name = "headquarters_lvl_3", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_2_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_2_exit.logic" },   
		{ name = "headquarters_lvl_4", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_5", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_6", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
		{ name = "headquarters_lvl_7", level = 1, prepareTime = 18, entryLogic = "logic/dom/hq_upgrade_level_3_entry.logic", exitLogic = "logic/dom/hq_upgrade_level_3_exit.logic" },   
	}
	
		rules.objectivesLogic = 
	{
		{ name = "logic/objectives/kill_elite.logic", minDifficultyLevel = 4 },
		{ name = "logic/objectives/destroy_nest_canoptrix_single.logic", minDifficultyLevel = 3 },
		{ name = "logic/objectives/destroy_creeper.logic", minDifficultyLevel = 7 } 
	}

    return rules;
end