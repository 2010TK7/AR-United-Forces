Hooks:PostHook(GroupAITweakData, "_init_unit_categories", "AR_init_unit_categories", function(self, difficulty_index)
	if difficulty_index == 8 then
		self.unit_categories.spooc.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_cloaker/ene_zeal_cloaker"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
		}
	else
		self.unit_categories.spooc.unit_types.america = {
			Idstring("units/payday2/characters/ene_spook_1/ene_spook_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_spooc_asval_smg/ene_akan_fbi_spooc_asval_smg")
		}
	end

	self.unit_categories.CS_cop_C45_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
		Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
		Idstring("units/payday2/characters/ene_cop_4/ene_cop_4"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_r870/ene_akan_cs_cop_r870")
	}
	self.unit_categories.CS_cop_stealth_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_cop_2/ene_cop_2"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_akmsu_smg/ene_akan_cs_cop_akmsu_smg")
	}

	if difficulty_index == 8 then
		self.unit_categories.CS_swat_MP5.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		self.unit_categories.CS_swat_R870.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
	else
		self.unit_categories.CS_swat_MP5.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_ak47_ass/ene_akan_cs_swat_ak47_ass")
		}
		self.unit_categories.CS_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_swat_r870/ene_akan_cs_swat_r870")
		}
	end

	if difficulty_index == 8 then
		self.unit_categories.CS_heavy_M4.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
		self.unit_categories.CS_heavy_R870.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
		}
		self.unit_categories.CS_heavy_M4_w.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
	else
		self.unit_categories.CS_heavy_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
		self.unit_categories.CS_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_r870/ene_swat_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_r870/ene_akan_cs_heavy_r870")
		}
		self.unit_categories.CS_heavy_M4_w.unit_types.america = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_heavy_ak47_ass/ene_akan_cs_heavy_ak47_ass")
		}
	end

	if difficulty_index == 8 then
		self.unit_categories.CS_tazer.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_tazer/ene_zeal_tazer"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
		}
	else
		self.unit_categories.CS_tazer.unit_types.america = {
			Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_tazer_ak47_ass/ene_akan_cs_tazer_ak47_ass")
		}
	end

	if difficulty_index == 8 then
		self.unit_categories.CS_shield.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
		}
	else
		self.unit_categories.CS_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_shield_c45/ene_akan_cs_shield_c45")
		}
	end

	self.unit_categories.FBI_suit_C45_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_ak47_ass/ene_akan_cs_cop_ak47_ass")
	}
	self.unit_categories.FBI_suit_M4_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
	}
	self.unit_categories.FBI_suit_stealth_MP5.unit_types.america = {
		Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_cs_cop_asval_smg/ene_akan_cs_cop_asval_smg")
	}

	if difficulty_index < 6 then
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_ak47_ass/ene_akan_fbi_swat_ak47_ass")
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
	else
		self.unit_categories.FBI_swat_M4.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_ak47_ass/ene_akan_fbi_swat_dw_ak47_ass")
		}
	end

	if difficulty_index < 6 then
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_r870/ene_akan_fbi_swat_r870")
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_swat_r870/ene_city_swat_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
	else
		self.unit_categories.FBI_swat_R870.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat/ene_zeal_swat"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_swat_dw_r870/ene_akan_fbi_swat_dw_r870")
		}
	end

	if difficulty_index < 6 then
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_g36/ene_city_heavy_g36"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
	else
		self.unit_categories.FBI_heavy_G36.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
	end

	if difficulty_index < 6 then
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_r870/ene_fbi_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_heavy_r870/ene_city_heavy_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
	else
		self.unit_categories.FBI_heavy_R870.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_r870/ene_akan_fbi_heavy_r870")
		}
	end

	if difficulty_index < 8 then
		self.unit_categories.FBI_heavy_G36_w.unit_types.america = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
	else
		self.unit_categories.FBI_heavy_G36_w.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_heavy/ene_zeal_swat_heavy"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_heavy_g36/ene_akan_fbi_heavy_g36")
		}
	end

	if difficulty_index < 6 then
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_sr2_smg/ene_akan_fbi_shield_sr2_smg")
		}
	elseif difficulty_index < 8 then
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/payday2/characters/ene_city_shield/ene_city_shield"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
		}
	else
		self.unit_categories.FBI_shield.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_swat_shield/ene_zeal_swat_shield"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_shield_dw_sr2_smg/ene_akan_fbi_shield_dw_sr2_smg")
		}
	end

	if difficulty_index < 5 then
		self.unit_categories.FBI_tank.unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
		}
	elseif difficulty_index <= 6 then
		self.unit_categories.FBI_tank.unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870")
		}
	elseif difficulty_index <= 7 then
		self.unit_categories.FBI_tank.unit_types.america = {
			Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
			Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
			Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun_classic/ene_bulldozer_minigun_classic")
		}
	else
		self.unit_categories.FBI_tank.unit_types.america = {
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer/ene_zeal_bulldozer"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_2/ene_zeal_bulldozer_2"),
			Idstring("units/pd2_dlc_gitgud/characters/ene_zeal_bulldozer_3/ene_zeal_bulldozer_3"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_r870/ene_akan_fbi_tank_r870"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_saiga/ene_akan_fbi_tank_saiga"),
			Idstring("units/pd2_dlc_mad/characters/ene_akan_fbi_tank_rpk_lmg/ene_akan_fbi_tank_rpk_lmg"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_medic/ene_bulldozer_medic"),
			Idstring("units/pd2_dlc_drm/characters/ene_bulldozer_minigun/ene_bulldozer_minigun")
		}
	end

	self.unit_categories.medic_M4.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_m4/ene_medic_m4"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_ak47_ass/ene_akan_medic_ak47_ass")
	}
	self.unit_categories.medic_R870.unit_types.america = {
		Idstring("units/payday2/characters/ene_medic_r870/ene_medic_r870"),
		Idstring("units/pd2_dlc_mad/characters/ene_akan_medic_r870/ene_akan_medic_r870")
	}

	for k, v in pairs(self.unit_categories or {}) do
		if v.unit_types and v.unit_types.america and v.unit_types.russia then
			self.unit_categories[k].unit_types.russia = v.unit_types.america
		end
	end
end)