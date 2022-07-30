# Riftbreaker-Lilly-Mod2
 
The_Riftbreaker_1.31533_(57451)_win_gog

# 스토리 시작시
lua\missions\campaigns\story\v2\headquarters\headquarters.lua
    logic/missions/campaigns/story/headquarters.logic
    
    lua\missions\survival\survival_jungle.lua
        logic/missions/survival/default.logic
        lua\missions\survival\v2\dom_survival_jungle_rules_default.lua
		
# 서바이벌
	missions\survival\jungle.mission # 맵,자원 배치 관련
		lua/missions/survival/survival_jungle.lua
			logic/missions/survival/default.logic
			lua/missions/survival/v2/dom_survival_jungle_rules_*
			lua/missions/v2/dom_manager.lua
		campaigns/survival/jungle.campaign # 업그레이드 참조 관련


main_menu.dat
	BUTTON_survival                         "gui/menu/new_survival"
	
	
-*.entx|-*.ent|-*.scene|-*.csv|-*.pu|-*.material|-*.mesh

health(\s*)"([1-9]\d+)"
health$1"${2}0"