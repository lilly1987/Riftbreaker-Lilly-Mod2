# Riftbreaker-Lilly-Mod2
 

# 스토리 시작시
lua\missions\campaigns\story\v2\headquarters\headquarters.lua
    logic/missions/campaigns/story/headquarters.logic
    
    lua\missions\survival\survival_jungle.lua
        logic/missions/survival/default.logic
        lua\missions\survival\v2\dom_survival_jungle_rules_default.lua
		
# 서바이벌
missions\survival\jungle.mission
	lua/missions/survival/survival_jungle.lua
		logic/missions/survival/default.logic
		lua/missions/survival/v2/dom_survival_jungle_rules_*
		lua/missions/v2/dom_manager.lua
	campaigns/survival/jungle.campaign


main_menu.dat
	BUTTON_survival                         "gui/menu/new_survival"
	
	
