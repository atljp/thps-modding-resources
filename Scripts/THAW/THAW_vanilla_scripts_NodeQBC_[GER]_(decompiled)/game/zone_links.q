showpakmap = 0
showpakmapexpand = 0
SkateZones = {
    z_ho = {
        name = 'Z_HO'
        params_struct = Z_HO_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_hobh z_hodt z_ho_skateshop z_ho_barbershop ]
    }
    z_ho_skateshop = {
        name = 'Z_HO_SkateShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_ho ]
    }
    z_ho_barbershop = {
        name = 'Z_HO_BarberShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_ho ]
    }
    z_bh = {
        name = 'Z_BH'
        params_struct = Z_BH_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [
            z_bhho
            z_bhsm
            z_bhsr
            z_bh_cas_shop
            z_bh_skateshop
        ]
    }
    z_bh_cas_shop = {
        name = 'Z_BH_Cas_Shop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_bh ]
    }
    z_bh_skateshop = {
        name = 'Z_BH_SkateShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_bh ]
    }
    z_dt = {
        name = 'Z_DT'
        params_struct = Z_DT_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [
            z_dtho
            z_dtel
            z_dtsv
            z_dt_skateshop
            z_dt_accshop
        ]
    }
    z_dt_skateshop = {
        name = 'Z_DT_SkateShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_dt ]
    }
    z_dt_accshop = {
        name = 'Z_DT_AccShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_dt ]
    }
    z_oi = {
        name = 'Z_OI'
        params_struct = Z_OI_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [ z_oism z_smoi ]
    }
    z_hobh = {
        name = 'Z_HOBH'
        params_struct = Z_HO_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_ho z_bhho ]
    }
    z_bhho = {
        name = 'Z_BHHO'
        params_struct = Z_BH_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_bh z_hobh ]
    }
    z_hodt = {
        name = 'Z_HODT'
        params_struct = Z_HO_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_ho z_dtho ]
    }
    z_dtho = {
        name = 'Z_DTHO'
        params_struct = Z_DT_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_dt z_hodt ]
    }
    z_el = {
        name = 'Z_EL'
        params_struct = Z_EL_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_eldt z_ellv ]
    }
    z_eldt = {
        name = 'Z_ELDT'
        params_struct = Z_EL_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_el z_dtel ]
    }
    z_dtel = {
        name = 'Z_DTEL'
        params_struct = Z_DT_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_dt z_eldt ]
    }
    z_sm = {
        name = 'Z_SM'
        params_struct = Z_SM_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_smbh z_smoi z_sm_skateshop z_sm_tattooshop ]
    }
    z_sm_skateshop = {
        name = 'Z_SM_SkateShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_sm ]
    }
    z_sm_tattooshop = {
        name = 'Z_SM_TattooShop'
        params_struct = Z_Shop_Params
        extra_size = 1000
        anim_size = 12009
        model_size = 15056
        scene_size = 455590
        zones = [ z_sm ]
    }
    z_smbh = {
        name = 'Z_SMBH'
        params_struct = Z_SM_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_sm z_bhsm ]
    }
    z_bhsm = {
        name = 'Z_BHSM'
        params_struct = Z_BH_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_bh z_smbh ]
    }
    z_smoi = {
        name = 'Z_SMOI'
        params_struct = Z_SM_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_sm z_oism ]
    }
    z_oism = {
        name = 'Z_OISM'
        params_struct = Z_OI_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_smoi z_oi ]
    }
    z_sr = {
        name = 'Z_SR'
        params_struct = Z_SR_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_srbh ]
    }
    z_srbh = {
        name = 'Z_SRBH'
        params_struct = Z_SR_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_sr z_bhsr ]
    }
    z_bhsr = {
        name = 'Z_BHSR'
        params_struct = Z_BH_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_bh z_srbh ]
    }
    z_lv = {
        params_struct = Z_LV_Params
        name = 'Z_LV'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_lvel ]
    }
    z_lvel = {
        name = 'Z_LVEL'
        params_struct = Z_LV_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_lv z_ellv ]
    }
    z_ellv = {
        name = 'Z_ELLV'
        params_struct = Z_EL_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_el z_lvel ]
    }
    z_test_nn = {
        name = 'Z_Test_NN'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    Z_TestLevel = {
        name = 'Z_TestLevel'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_at = {
        name = 'Z_AT'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_ch = {
        name = 'Z_CH'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_dn = {
        name = 'Z_DN'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_ja = {
        name = 'Z_JA'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_ma = {
        name = 'Z_MA'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_ms = {
        name = 'Z_MS'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_sv = {
        name = 'Z_SV'
        params_struct = Z_SV_Params
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        transitionzones = [ z_svdt ]
    }
    z_dtsv = {
        name = 'Z_DTSV'
        params_struct = Z_DT_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_dt z_svdt ]
    }
    z_svdt = {
        name = 'Z_SVDT'
        params_struct = Z_SV_Transition_Params
        extra_size = 500
        anim_size = 6005
        model_size = 7528
        scene_size = 227795
        zones = [ z_sv z_dtsv ]
    }
    z_sv2 = {
        name = 'Z_SV2'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_sz = {
        name = 'Z_SZ'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    Z_Mainmenu = {
        name = 'Z_Mainmenu'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
    }
    z_viewer = {
        name = 'Z_Viewer'
        extra_size = 19000
        anim_size = 228167
        model_size = 286064
        scene_size = 8656217
        zones = [
        ]
        pak_optional
    }
}
NetSkateZones = {
    z_ho_net = {
        name = 'Z_HO_Net'
        params_struct = Z_HO_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_bh_net = {
        name = 'Z_BH_Net'
        params_struct = Z_BH_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_dt_net = {
        name = 'Z_DT_Net'
        params_struct = Z_DT_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_oi_net = {
        name = 'Z_OI_Net'
        params_struct = Z_OI_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_el_net = {
        name = 'Z_EL_Net'
        params_struct = Z_EL_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_sm_net = {
        name = 'Z_SM_Net'
        params_struct = Z_SM_Params
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_sr_net = {
        name = 'Z_SR_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_lv_net = {
        name = 'Z_LV_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_testlevel_net = {
        name = 'Z_TestLevel_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_at_net = {
        name = 'Z_AT_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_ch_net = {
        name = 'Z_CH_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_dn_net = {
        name = 'Z_DN_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_ja_net = {
        name = 'Z_JA_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_ma_net = {
        name = 'Z_MA_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_ms_net = {
        name = 'Z_MS_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_sv_net = {
        name = 'Z_SV_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_sv2_net = {
        name = 'Z_SV2_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_sz_net = {
        name = 'Z_SZ_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
    z_mainmenu_net = {
        name = 'Z_Mainmenu_Net'
        anim_size = 240176
        model_size = 1729904
        scene_size = 7900001
        zones = [
        ]
    }
}
SkateZonesStoryOpening = {
    z_ho_net = {
        name = 'Z_HO_NET'
        params_struct = Z_Shop_Params
        extra_size = 1000000
        anim_size = 0
        model_size = 1000000
        scene_size = 3000000
        zones = [ z_storyselect ]
    }
    z_storyselect = {
        name = 'Z_STORYSELECT'
        params_struct = Z_Shop_Params
        extra_size = 1000000
        anim_size = 0
        model_size = 1000000
        scene_size = 3000000
        zones = [ z_ho_net ]
    }
}
MainMenuZones = {
    Z_Mainmenu = {
        name = 'Z_Mainmenu'
        extra_size = 1058487
        anim_size = 0
        model_size = 0
        scene_size = 1058487
        zones = [
        ]
    }
}
CAPZones = {
    CAP_assets = {
        name = 'CAP_assets'
        extra_size = 0
        anim_size = 0
        model_size = 0
        scene_size = 0
        zones = [
        ]
    }
}
ZonePakDir = 'd:\data\Worlds\WorldZones\'
ZonePakOmit = [ 'z_world.pak' ]
