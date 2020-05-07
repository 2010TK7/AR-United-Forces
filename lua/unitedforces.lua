local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedForces = _G.UnitedForces or {}
UnitedForces._path = ModPath
UnitedForces._data_path = SavePath .. 'TAR.txt'
UnitedForces.settings = UnitedForces.settings or {
	AR_Lang = 1,

	AR_AA = true,
	AR_AR = false,
	AR_AZ = false,
	AR_AM = false,
	AR_AO = false,

	AR_RA = false,
	AR_RR = true,
	AR_RZ = false,
	AR_RM = false,
	AR_RO = false,

	AR_ZA = false,
	AR_ZR = false,
	AR_ZZ = true,
	AR_ZM = false,
	AR_ZO = false,

	AR_MA = false,
	AR_MR = false,
	AR_MZ = false,
	AR_MM = true,
	AR_MO = false
}

function UnitedForces:Save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function UnitedForces:Load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end

UnitedForces.zeal = {
	CS_swat_MP5 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")},
	CS_heavy_M4 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")},
	CS_shield = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")},
	CS_tazer = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")},
	spooc = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")}
}
UnitedForces.zeal.CS_swat_R870 = UnitedForces.zeal.CS_swat_MP5
UnitedForces.zeal.FBI_swat_M4 = UnitedForces.zeal.CS_swat_MP5
UnitedForces.zeal.FBI_swat_R870 = UnitedForces.zeal.CS_swat_MP5
UnitedForces.zeal.CS_heavy_R870 = UnitedForces.zeal.CS_heavy_M4
UnitedForces.zeal.CS_heavy_M4_w = UnitedForces.zeal.CS_heavy_M4
UnitedForces.zeal.FBI_heavy_G36 = UnitedForces.zeal.CS_heavy_M4
UnitedForces.zeal.FBI_heavy_R870 = UnitedForces.zeal.CS_heavy_M4
UnitedForces.zeal.FBI_heavy_G36_w = UnitedForces.zeal.CS_heavy_M4
UnitedForces.zeal.FBI_shield = UnitedForces.zeal.CS_shield
local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)
if difficulty_index < 5 then
	UnitedForces.zeal.FBI_tank = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")}
elseif difficulty_index <= 6 then
	UnitedForces.zeal.FBI_tank = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3")
	}
elseif difficulty_index <= 7 then
	UnitedForces.zeal.FBI_tank = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	}
else
	UnitedForces.zeal.FBI_tank = {
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
		Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
		Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
	}
end
if CommonModifiers and CommonModifiers.Checker then
	if _CM.CM_BlackDozer and difficulty_index <= 4 then
		table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"))
	end
	if _CM.dozer_lmg and difficulty_index <= 6 then
		table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"))
	end
	if _CM.dozer_minigun and difficulty_index <= 6 then
		table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
	end
	if _CM.dozer_medic and difficulty_index <= 7 then
		table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
	end
end

function UnitedForces:ARUnitedForces(u_type_name, current_unit_type)
	local _ARA = UnitedForces.settings.AR_AA
	local _ARR = UnitedForces.settings.AR_AR
	local _ARZ = UnitedForces.settings.AR_AZ
	local _ARM = UnitedForces.settings.AR_AM
	local _ARO = UnitedForces.settings.AR_AO
	if current_unit_type == "russia" then
		_ARA = UnitedForces.settings.AR_RA
		_ARR = UnitedForces.settings.AR_RR
		_ARZ = UnitedForces.settings.AR_RZ
		_ARM = UnitedForces.settings.AR_RM
		_ARO = UnitedForces.settings.AR_RO
	elseif current_unit_type == "zombie" then
		_ARA = UnitedForces.settings.AR_ZA
		_ARR = UnitedForces.settings.AR_ZR
		_ARZ = UnitedForces.settings.AR_ZZ
		_ARM = UnitedForces.settings.AR_ZM
		_ARO = UnitedForces.settings.AR_ZO
	elseif current_unit_type == "murkywater" then
		_ARA = UnitedForces.settings.AR_MA
		_ARR = UnitedForces.settings.AR_MR
		_ARZ = UnitedForces.settings.AR_MZ
		_ARM = UnitedForces.settings.AR_MM
		_ARO = UnitedForces.settings.AR_MO
	end

	UnitedForces:Load()
	if not (_ARA or _ARR or _ARZ or _ARM or _ARO and UnitedForces.zeal[u_type_name] and Global.game_settings.difficulty ~= "sm_wish") then
		return tweak_data.group_ai.unit_categories[u_type_name].unit_types[current_unit_type]
	end

	local ARbucket = {}
	if _ARA then
		table.insert(ARbucket, "america")
	end
	if _ARR then
		table.insert(ARbucket, "russia")
	end
	if _ARZ then
		table.insert(ARbucket, "zombie")
	end
	if _ARM then
		table.insert(ARbucket, "murkywater")
	end
	if _ARO and UnitedForces.zeal[u_type_name] and Global.game_settings.difficulty ~= "sm_wish" then
		table.insert(ARbucket, "zeal")
	end

	local ARtype = ARbucket[math.random(#ARbucket)]
	if ARtype ~= "zeal" then return tweak_data.group_ai.unit_categories[u_type_name].unit_types[ARtype] end
	return UnitedForces.zeal[u_type_name]
end