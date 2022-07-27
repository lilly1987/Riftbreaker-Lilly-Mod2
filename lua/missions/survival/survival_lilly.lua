require("lua/utils/table_utils.lua")
require("lua/utils/rules_utils.lua")

local survival_base = require( "lua/missions/survival/survival_base.lua" )
class 'survival_lilly' ( survival_base )

function survival_lilly:__init()
    survival_base.__init(self,self)
end

function survival_lilly:init()
	survival_base.init( self )
	LogService:Log( "survival_lilly:init()" )
	
    self:PrepareSpawnPoints();

    local database = self.data
	
	database:SetFloat("mission_duration", DifficultyService:GetMissionDuration() )
	database:SetFloat("final_wave_time", DifficultyService:GetMissionDuration() - 300 )
	database:SetFloat("warmup_duration", DifficultyService:GetWarmupDuration() )

	if ( DifficultyService:IsMissionInfinite() == true ) then
		database:SetString("mission_infinite", "1" )
    else
		database:SetString("mission_infinite", "0" )
	end

    MissionService:ActivateMissionFlow("", "logic/missions/survival/default.logic", "default", database );

    local rulesPath = GetRulesForDifficulty( "lua/missions/survival/v2/dom_survival_lilly_rules_" )

	MissionService:AddGameRule( "lua/missions/v2/dom_manager.lua", rulesPath )
end

return survival_lilly
