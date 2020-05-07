local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedForces = _G.UnitedForces or {}
UnitedForces._path = ModPath
UnitedForces._data_path = SavePath .. 'TAR.txt'
UnitedForces.settings = {
	AR_ZEAL = 1,
	AR_AA = true,
	AR_AR = false,
	AR_AZ = false,
	AR_AM = false,
	AR_RA = false,
	AR_RR = true,
	AR_RZ = false,
	AR_RM = false,
	AR_ZA = false,
	AR_ZR = false,
	AR_ZZ = true,
	AR_ZM = false,
	AR_MA = false,
	AR_MR = false,
	AR_MZ = false,
	AR_MM = true
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

Hooks:Add('LocalizationManagerPostInit', 'AR_LocalizationManagerPostInit', function(loc)
	loc:load_localization_file(UnitedForces._path .. 'english.txt', false)
end)

Hooks:Add('MenuManagerInitialize', 'AR_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.ARCheck = function(this, item)
		UnitedForces.settings[item:name()] = item:value() == 'on'
		UnitedForces:Save()
	end

	MenuCallbackHandler.ARZEAL = function(this, item)
		UnitedForces.settings.AR_ZEAL = tonumber(item:value())
		UnitedForces:Save()
	end

	MenuCallbackHandler.ARSave = function(this, item)
		UnitedForces:Save()
	end

	UnitedForces:Load()
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'options.txt', UnitedForces, UnitedForces.settings)
end)

local _AR = UnitedForces.settings

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "AR_init_unit_categories", function(self, difficulty_index)
	if difficulty_index < 4 then
		self.unit_categories.FBI_swat_M4 = self.unit_categories.CS_swat_MP5
		self.unit_categories.FBI_swat_R870 = self.unit_categories.CS_swat_R870
		self.unit_categories.FBI_heavy_G36 = self.unit_categories.CS_swat_MP5
		self.unit_categories.FBI_heavy_R870 = self.unit_categories.CS_swat_R870
		self.unit_categories.FBI_shield = self.unit_categories.CS_shield
	end

	AR_UNIT = {A = {}, R = {}, Z = {}, M = {}, O = {}}
	AR_UNIT.O.FBI_swat_M4 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")}
	AR_UNIT.O.FBI_swat_R870 = AR_UNIT.O.FBI_swat_M4
	AR_UNIT.O.FBI_heavy_G36 = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")}
	AR_UNIT.O.FBI_heavy_R870 = AR_UNIT.O.FBI_heavy_G36
	AR_UNIT.O.FBI_shield = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")}
	AR_UNIT.O.spooc = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")}
	AR_UNIT.O.CS_tazer = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")}
	if difficulty_index < 5 then
		AR_UNIT.O.FBI_tank = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer")}
	elseif difficulty_index <= 6 then
		AR_UNIT.O.FBI_tank = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2")
		}
	elseif difficulty_index <= 7 then
		AR_UNIT.O.FBI_tank = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
	else
		AR_UNIT.O.FBI_tank = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
	end

	UnitedForces:Load()

	for k, v in pairs(self.unit_categories or {}) do
		if (k == "FBI_swat_M4") or (k == "FBI_swat_R870") or (k == "FBI_heavy_G36") or (k == "FBI_heavy_R870") or (k == "FBI_shield") or (k == "spooc") or (k == "CS_tazer") or (k == "FBI_tank") or (k == "medic_M4") or (k == "medic_R870") then
			AR_UNIT.A[k] = {}
			AR_UNIT.R[k] = {}
			AR_UNIT.Z[k] = {}
			AR_UNIT.M[k] = {}

			for key, valve in pairs(v.unit_types.america) do
				if _AR.AR_AA then
					table.insert(AR_UNIT.A[k], valve)
				end
				if _AR.AR_RA then
					table.insert(AR_UNIT.R[k], valve)
				end
				if _AR.AR_ZA then
					table.insert(AR_UNIT.Z[k], valve)
				end
				if _AR.AR_MA then
					table.insert(AR_UNIT.M[k], valve)
				end
			end
			for key, valve in pairs(v.unit_types.russia) do
				if _AR.AR_AR then
					table.insert(AR_UNIT.A[k], valve)
				end
				if _AR.AR_RR then
					table.insert(AR_UNIT.R[k], valve)
				end
				if _AR.AR_ZR then
					table.insert(AR_UNIT.Z[k], valve)
				end
				if _AR.AR_MR then
					table.insert(AR_UNIT.M[k], valve)
				end
			end
			for key, valve in pairs(v.unit_types.zombie) do
				if _AR.AR_AZ then
					table.insert(AR_UNIT.A[k], valve)
				end
				if _AR.AR_RZ then
					table.insert(AR_UNIT.R[k], valve)
				end
				if _AR.AR_ZZ then
					table.insert(AR_UNIT.Z[k], valve)
				end
				if _AR.AR_MZ then
					table.insert(AR_UNIT.M[k], valve)
				end
			end
			for key, valve in pairs(v.unit_types.murkywater) do
				if _AR.AR_AM then
					table.insert(AR_UNIT.A[k], valve)
				end
				if _AR.AR_RM then
					table.insert(AR_UNIT.R[k], valve)
				end
				if _AR.AR_ZM then
					table.insert(AR_UNIT.Z[k], valve)
				end
				if _AR.AR_MM then
					table.insert(AR_UNIT.M[k], valve)
				end
			end

			if AR_UNIT.O[k] and difficulty_index >= 7 * (3 - _AR.AR_ZEAL) + 1 then
				self.unit_categories[k].unit_types.america = AR_UNIT.O[k]
				self.unit_categories[k].unit_types.russia = AR_UNIT.O[k]
				self.unit_categories[k].unit_types.zombie = AR_UNIT.O[k]
				self.unit_categories[k].unit_types.murkywater = AR_UNIT.O[k]
			else
				if _AR.AR_AA or _AR.AR_AR or _AR.AR_AZ or _AR.AR_AM then
					self.unit_categories[k].unit_types.america = AR_UNIT.A[k]
				end
				if _AR.AR_RA or _AR.AR_RR or _AR.AR_RZ or _AR.AR_RM then
					self.unit_categories[k].unit_types.russia = AR_UNIT.R[k]
				end
				if _AR.AR_ZA or _AR.AR_ZR or _AR.AR_ZZ or _AR.AR_ZM then
					self.unit_categories[k].unit_types.zombie = AR_UNIT.Z[k]
				end
				if _AR.AR_MA or _AR.AR_MR or _AR.AR_MZ or _AR.AR_MM then
					self.unit_categories[k].unit_types.murkywater = AR_UNIT.M[k]
				end
			end
		end
	end

	self.unit_categories.CS_swat_MP5 = self.unit_categories.FBI_swat_M4
	self.unit_categories.CS_swat_R870 = self.unit_categories.FBI_swat_R870
	self.unit_categories.CS_heavy_M4 = self.unit_categories.FBI_heavy_G36
	self.unit_categories.CS_heavy_R870 = self.unit_categories.FBI_heavy_R870
	self.unit_categories.CS_heavy_M4_w.unit_types = self.unit_categories.FBI_heavy_G36.unit_types
	self.unit_categories.CS_shield = self.unit_categories.FBI_shield
	self.unit_categories.FBI_heavy_G36_w.unit_types = self.unit_categories.FBI_heavy_G36.unit_types
end)