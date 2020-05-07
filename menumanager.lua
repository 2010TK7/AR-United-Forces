Hooks:Add('LocalizationManagerPostInit', 'AR_LocalizationManagerPostInit', function(loc)
	UnitedForces:Load()
	if UnitedForces.settings.AR_Lang == 2 then
		loc:load_localization_file(UnitedForces._path .. 'loc/zh_cn.json', false)
	else
		loc:load_localization_file(UnitedForces._path .. 'loc/en.json', false)
	end
end)

Hooks:Add('MenuManagerInitialize', 'AR_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.ARCheck = function(this, item)
		UnitedForces.settings[item:name()] = item:value() == 'on'
		UnitedForces:Save()
	end

	MenuCallbackHandler.ARLang = function(this, item)
		UnitedForces.settings.AR_Lang = tonumber(item:value())
		UnitedForces:Save()
	end

	MenuCallbackHandler.ARSave = function(this, item)
		UnitedForces:Save()
	end

	UnitedForces:Load()
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'menu/main.json', UnitedForces, UnitedForces.settings)
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'menu/america.json', UnitedForces, UnitedForces.settings)
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'menu/russia.json', UnitedForces, UnitedForces.settings)
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'menu/zombie.json', UnitedForces, UnitedForces.settings)
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'menu/murkywater.json', UnitedForces, UnitedForces.settings)
end)