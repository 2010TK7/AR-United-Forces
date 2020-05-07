local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.UnitedForces = _G.UnitedForces or {}
UnitedForces._path = ModPath
UnitedForces._data_path = SavePath .. 'TAR.txt'
UnitedForces.settings = {
	AR_ZEAL = false,
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

	MenuCallbackHandler.ARSave = function(this, item)
		UnitedForces:Save()
	end

	UnitedForces:Load()
	MenuHelper:LoadFromJsonFile(UnitedForces._path .. 'options.txt', UnitedForces, UnitedForces.settings)
end)

local _AR = UnitedForces.settings

Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "AR_init_unit_categories", function(self, difficulty_index)
	for k, v in pairs(self.unit_categories or {}) do
		if v.unit_types then
			self.unit_categories[k].unit_types.comA = {}
			self.unit_categories[k].unit_types.comR = {}
			self.unit_categories[k].unit_types.comZ = {}
			self.unit_categories[k].unit_types.comM = {}
		end
	end

	UnitedForces:Load()

	for k, v in pairs(self.unit_categories or {}) do
		if v.unit_types then
			for key, valve in pairs(v.unit_types.america) do
				if _AR.AR_AA then
					table.insert(self.unit_categories[k].unit_types.comA, valve)
				end
				if _AR.AR_RA then
					table.insert(self.unit_categories[k].unit_types.comR, valve)
				end
				if _AR.AR_ZA then
					table.insert(self.unit_categories[k].unit_types.comZ, valve)
				end
				if _AR.AR_MA then
					table.insert(self.unit_categories[k].unit_types.comM, valve)
				end
			end
			for key, valve in pairs(v.unit_types.russia) do
				if _AR.AR_AR then
					table.insert(self.unit_categories[k].unit_types.comA, valve)
				end
				if _AR.AR_RR then
					table.insert(self.unit_categories[k].unit_types.comR, valve)
				end
				if _AR.AR_ZR then
					table.insert(self.unit_categories[k].unit_types.comZ, valve)
				end
				if _AR.AR_MR then
					table.insert(self.unit_categories[k].unit_types.comM, valve)
				end
			end
			for key, valve in pairs(v.unit_types.zombie) do
				if _AR.AR_AZ then
					table.insert(self.unit_categories[k].unit_types.comA, valve)
				end
				if _AR.AR_RZ then
					table.insert(self.unit_categories[k].unit_types.comR, valve)
				end
				if _AR.AR_ZZ then
					table.insert(self.unit_categories[k].unit_types.comZ, valve)
				end
				if _AR.AR_MZ then
					table.insert(self.unit_categories[k].unit_types.comM, valve)
				end
			end
			for key, valve in pairs(v.unit_types.murkywater) do
				if _AR.AR_AM then
					table.insert(self.unit_categories[k].unit_types.comA, valve)
				end
				if _AR.AR_RM then
					table.insert(self.unit_categories[k].unit_types.comR, valve)
				end
				if _AR.AR_ZM then
					table.insert(self.unit_categories[k].unit_types.comZ, valve)
				end
				if _AR.AR_MM then
					table.insert(self.unit_categories[k].unit_types.comM, valve)
				end
			end
		end
	end

	for k, v in pairs(self.unit_categories or {}) do
		if v.unit_types then
			if _AR.AR_AA or _AR.AR_AR or _AR.AR_AZ or _AR.AR_AM then
				self.unit_categories[k].unit_types.america = v.unit_types.comA
			end
			if _AR.AR_RA or _AR.AR_RR or _AR.AR_RZ or _AR.AR_RM then
				self.unit_categories[k].unit_types.russia = v.unit_types.comR
			end
			if _AR.AR_ZA or _AR.AR_ZR or _AR.AR_ZZ or _AR.AR_ZM then
				self.unit_categories[k].unit_types.zombie = v.unit_types.comZ
			end
			if _AR.AR_MA or _AR.AR_MR or _AR.AR_MZ or _AR.AR_MM then
				self.unit_categories[k].unit_types.murkywater = v.unit_types.comM
			end
		end
	end

	if _AR.AR_ZEAL and difficulty_index == 8 then
		self.unit_categories.spooc.unit_types.america = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker")}
		self.unit_categories.CS_swat_MP5.unit_types.america = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat")}
		self.unit_categories.CS_swat_R870.unit_types.america = self.unit_categories.CS_swat_MP5.unit_types.america
		self.unit_categories.CS_heavy_M4.unit_types.america = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy")}
		self.unit_categories.CS_heavy_R870.unit_types.america = self.unit_categories.CS_heavy_M4.unit_types.america
		self.unit_categories.CS_heavy_M4_w.unit_types.america = self.unit_categories.CS_heavy_M4.unit_types.america
		self.unit_categories.CS_tazer.unit_types.america = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer")}
		self.unit_categories.CS_shield.unit_types.america = {Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield")}
		self.unit_categories.FBI_swat_M4.unit_types.america = self.unit_categories.CS_swat_MP5.unit_types.america
		self.unit_categories.FBI_swat_R870.unit_types.america = self.unit_categories.CS_swat_MP5.unit_types.america
		self.unit_categories.FBI_heavy_G36.unit_types.america = self.unit_categories.CS_heavy_M4.unit_types.america
		self.unit_categories.FBI_heavy_R870.unit_types.america = self.unit_categories.CS_heavy_M4.unit_types.america
		self.unit_categories.FBI_heavy_G36_w.unit_types.america = self.unit_categories.CS_heavy_M4.unit_types.america
		self.unit_categories.FBI_shield.unit_types.america = self.unit_categories.CS_shield.unit_types.america
		self.unit_categories.FBI_tank.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}

		for k, v in pairs(self.unit_categories or {}) do
			if v.unit_types then
				self.unit_categories[k].unit_types.russia = v.unit_types.america
				self.unit_categories[k].unit_types.zombie = v.unit_types.america
				self.unit_categories[k].unit_types.murkywater = v.unit_types.america
			end
		end
	end
end)