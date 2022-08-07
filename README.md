# Riftbreaker-Lilly-Mod2
 
The_Riftbreaker_1.31533_(57451)_win_gog


# include mod
All Pumps
https://www.nexusmods.com/theriftbreaker/mods/189
Expanded Arsenal  
https://www.nexusmods.com/theriftbreaker/mods/122  
Extended Tower Arsenal 확장된 무기고  
https://www.nexusmods.com/theriftbreaker/mods/106  

Initial Radar Scan-fullmap  
https://www.nexusmods.com/theriftbreaker/mods/147  
Jungle more Variation mod  
https://www.nexusmods.com/theriftbreaker/mods/150  
Mod Compatibility Framework 모드 호환성 프레임워크  
https://www.nexusmods.com/theriftbreaker/mods/141  
More Towers 4 more Taktik  
https://www.nexusmods.com/theriftbreaker/mods/84  
New Mod Categories in the Build Menu 빌드 메뉴의 새로운 모드 카테고리  
https://www.nexusmods.com/theriftbreaker/mods/101  
Nite Synthesizers and Rare synthesizers v3.0  
https://www.nexusmods.com/theriftbreaker/mods/114  
No Random Weapon Stats  
https://www.nexusmods.com/theriftbreaker/mods/198  
Specialized Pumps
https://www.nexusmods.com/theriftbreaker/mods/110
Tower Pack - Awarded  
https://www.nexusmods.com/theriftbreaker/mods/204  

# memo

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

#
main_menu.dat
	BUTTON_survival                         "gui/menu/new_survival"


#-
*.entx|-*.ent|-*.scene|-*.csv|-*.pu|-*.material|-*.mesh

#
health(\s*)"([1-9]\d*)"
health$1"${2}0"

#
EntityTemplate\n\{\n\tbase_blueprint "logic/spawn_player([\S\s]+?)\t\t\t\}\n\n\t\t\}\n\n\t\}\n\n\}\n
EntityTemplate\n\{\n\tbase_blueprint "props/rocks([\S\s]+?)\t\t\t\}\n\n\t\t\}\n\n\t\}\n\n\}\n
EntityTemplate\n\{\n\tbase_blueprint "resources/volume_random_resources([\S\s]+?)\t\t\t\}\n\n\t\t\}\n\n\t\}\n\n\}\n


#
debug_recreate_buildings 1


EntityTemplate\n{\n\tbase_blueprint "props/rocks[.\n]+

is_hidden "1"
is_hidden "0"

base_blueprint "props/rocks

base_blueprint "resources/volume_resource.*"
base_blueprint "resources/volume_random_resources_liquid"

base_blueprint "resources/volume_random_resources"

magma
morphium
mud
sludge
water

## 연구

가로 최대 600
세로 최대 

### 아이콘 크기
44
### 가운데 최상단 
		        x "-16.000"
		        y "-369.000"
### 가운데 두번째
		        x "-16.000"
		        y "-305.000"
				
				
				"648.000"
				54
				x "594.000" palladium_synthesizer
				x "540.000" titanium_synthesizer
				x "486.000" cobalt_synthesizer
				432
				
				684	630	639	693
				599	545	545	599
				234	179
				99	45
				324	269