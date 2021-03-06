local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedForces = _G.UnitedForces or {}
UnitedForces._path = ModPath
UnitedForces._data_path = SavePath .. 'Tmod_TAR.txt'
UnitedForces.settings = UnitedForces.settings or {
	AR_AA = true,
	AR_AR = false,
	AR_AZ = false,
	AR_AM = false,
	AR_AF = false,

	AR_RA = false,
	AR_RR = true,
	AR_RZ = false,
	AR_RM = false,
	AR_RF = false,

	AR_ZA = false,
	AR_ZR = false,
	AR_ZZ = true,
	AR_ZM = false,
	AR_ZF = false,

	AR_MA = false,
	AR_MR = false,
	AR_MZ = false,
	AR_MM = true,
	AR_MF = false,

	AR_FA = false,
	AR_FR = false,
	AR_FZ = false,
	AR_FM = false,
	AR_FF = true,

	AR_AO = false,
	AR_RO = false,
	AR_ZO = false,
	AR_MO = false,
	AR_FO = false,

	AR_Lang = 1
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

function UnitedForces:zeal_unit(difficulty_index)
	UnitedForces.zeal = {}
	UnitedForces.zeal.FBI_swat_M4 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")}
	UnitedForces.zeal.FBI_swat_R870 = UnitedForces.zeal.FBI_swat_M4
	UnitedForces.zeal.CS_swat_MP5 = UnitedForces.zeal.FBI_swat_M4
	UnitedForces.zeal.CS_swat_R870 = UnitedForces.zeal.FBI_swat_M4
	UnitedForces.zeal.FBI_heavy_G36 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")}
	UnitedForces.zeal.FBI_heavy_R870 = UnitedForces.zeal.FBI_heavy_G36
	UnitedForces.zeal.CS_heavy_M4 = UnitedForces.zeal.FBI_heavy_G36
	UnitedForces.zeal.CS_heavy_R870 = UnitedForces.zeal.FBI_heavy_G36
	UnitedForces.zeal.CS_heavy_M4_w = UnitedForces.zeal.FBI_heavy_G36
	UnitedForces.zeal.FBI_heavy_G36_w = UnitedForces.zeal.FBI_heavy_G36
	UnitedForces.zeal.FBI_shield = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")}
	UnitedForces.zeal.CS_shield = UnitedForces.zeal.FBI_shield
	UnitedForces.zeal.CS_tazer = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")}
	if difficulty_index <= 4 then
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
	UnitedForces.zeal.spooc = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")}

	if CommonModifiers and CommonModifiers.Checker then
		CommonModifiers:Load()
		local _CM = CommonModifiers.settings
		if _CM.BlackDozer == 2 and difficulty_index <= 4 then
			table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"))
		end--(BlackDozer)
		if _CM.dozer_lmg == 1 and difficulty_index <= 6 then
			table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"))
		end--Skulldozers
		if _CM.dozer_minigun == 1 and difficulty_index <= 6 then
			table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"))
		end--DozerMinigun
		if _CM.dozer_medic == 1 and difficulty_index <= 7 then
			table.insert(UnitedForces.zeal.FBI_tank, Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"))
		end--DozerMedic
	end
end

function UnitedForces:ARUnitedForces(u_type_name, current_unit_type)
	UnitedForces:Load()

	local _ARA = UnitedForces.settings.AR_AA
	local _ARR = UnitedForces.settings.AR_AR
	local _ARZ = UnitedForces.settings.AR_AZ
	local _ARM = UnitedForces.settings.AR_AM
	local _ARF = UnitedForces.settings.AR_AF
	local _ARO = UnitedForces.settings.AR_AO
	if current_unit_type == "russia" then
		_ARA = UnitedForces.settings.AR_RA
		_ARR = UnitedForces.settings.AR_RR
		_ARZ = UnitedForces.settings.AR_RZ
		_ARM = UnitedForces.settings.AR_RM
		_ARF = UnitedForces.settings.AR_RF
		_ARO = UnitedForces.settings.AR_RO
	elseif current_unit_type == "zombie" then
		_ARA = UnitedForces.settings.AR_ZA
		_ARR = UnitedForces.settings.AR_ZR
		_ARZ = UnitedForces.settings.AR_ZZ
		_ARM = UnitedForces.settings.AR_ZM
		_ARF = UnitedForces.settings.AR_ZF
		_ARO = UnitedForces.settings.AR_ZO
	elseif current_unit_type == "murkywater" then
		_ARA = UnitedForces.settings.AR_MA
		_ARR = UnitedForces.settings.AR_MR
		_ARZ = UnitedForces.settings.AR_MZ
		_ARM = UnitedForces.settings.AR_MM
		_ARF = UnitedForces.settings.AR_MF
		_ARO = UnitedForces.settings.AR_MO
	elseif current_unit_type == "federales" then
		_ARA = UnitedForces.settings.AR_FA
		_ARR = UnitedForces.settings.AR_FR
		_ARZ = UnitedForces.settings.AR_FZ
		_ARM = UnitedForces.settings.AR_FM
		_ARF = UnitedForces.settings.AR_FF
		_ARO = UnitedForces.settings.AR_FO
	end

	if not (_ARA or _ARR or _ARZ or _ARM or _ARF or _ARO and UnitedForces.zeal[u_type_name] and Global.game_settings.difficulty ~= "sm_wish") then
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
	if _ARF then
		table.insert(ARbucket, "federales")
	end
	if _ARO and UnitedForces.zeal[u_type_name] and Global.game_settings.difficulty ~= "sm_wish" then
		table.insert(ARbucket, "zeal")
	end

	local ARtype = ARbucket[math.random(#ARbucket)]
	if ARtype ~= "zeal" then return tweak_data.group_ai.unit_categories[u_type_name].unit_types[ARtype] end
	return UnitedForces.zeal[u_type_name]
end