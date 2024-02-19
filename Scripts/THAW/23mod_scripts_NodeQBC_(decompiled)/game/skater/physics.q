Skater_Default_Stats = 5.0
STATS_AIR = 0
STATS_RUN = 1
STATS_OLLIE = 2
STATS_SPEED = 3
STATS_SPIN = 4
STATS_FLIPSPEED = 5
STATS_SWITCH = 6
STATS_RAILBALANCE = 7
STATS_LIPBALANCE = 8
STATS_MANUAL = 9
standard_switch = (0.8999999761581421, 1.0)
no_switch = (1.0, 1.0)
LEAN_GRAVITY_DIFF = (0.0010000000474974513, 1.0)
LEAN_ACC_DIFF = (0.75, 1.0)
skater_physics = {
    skater_autoturn_speed = 3.0
    skater_autoturn_cancel_time = 300
    skater_autoturn_vert_angle = 5
    Physics_Standing_Air_Friction = 0.00001000
    Physics_Crouched_Air_Friction = 0.000002000
    Physics_Rolling_Friction = 0.00001000
    Skater_Max_Standing_Kick_Speed_Stat = { (394.0, 496.0) limit = 900 STATS_SPEED Switch = (0.800000011920929, 1.0) }
    Skater_Max_Crouched_Kick_Speed_Stat = { (532.0, 675.0) limit = 900 STATS_SPEED Switch = (0.800000011920929, 1.0) }
    Physics_Standing_Acceleration_Stat = { (629.0, 700.0) STATS_SPEED Switch = standard_switch }
    Physics_Crouching_Acceleration_stat = { (1057.0, 1200.0) STATS_SPEED Switch = standard_switch }
    Skater_Max_Speed_Stat = { (757.0, 900.0) STATS_SPEED Switch = no_switch }
    Skater_Max_Max_Speed_Stat = { (957.0, 1100.0) STATS_SPEED Switch = no_switch }
    Skater_Vert_Max_Max_Speed_Stat = { (957.0, 1100.0) STATS_SPEED Switch = no_switch }
    Skater_Vert_Max_Speed_Time = 1000
    Skater_default_head_height = 77
    Physics_Ground_Snap_Up = 13
    Physics_Air_Snap_Up = 15
    Physics_Ground_Snap_Down = 8.200
    Skater_First_Forward_Collision_Height = 8.100
    Skater_First_Forward_Collision_Length = 10
    Skater_Min_Distance_To_Wall = 8.0
    Physics_Ground_Rotation = 1.800
    Physics_Ground_Sharp_Rotation = 3.600
    Physics_Ground_Bert_Rotation = 9.0
    Physics_Ground_Bert_Extra_Rotation = 4.0
    Physics_Bert_Rotation_Step = 0.02000
    Physics_Bert_Rotation_Return_Step = 0.2000
    Physics_Air_No_Rotate_Time = 100
    Physics_Air_Ramp_Rotate_Time = 50
    spin_count_slop = 60
    Physics_Air_Gravity = -1350
    Physics_Ground_Gravity = -1000
    Physics_Rail_Gravity = -2000
    Wall_Ride_Gravity = -969
    Wall_Run_Gravity = -600
    Ground_stick_angle = 30
    Ground_stick_angle_forward = 30
    Physics_Brake_Acceleration = 900.0
    Physics_Air_No_Lean_Time = 200
    Physics_Air_Ramp_Lean_Time = 200
    Physics_Air_Lean_stat = { (1.0, 1.0) STATS_SPIN Switch = standard_switch }
    Physics_Air_Rotation_stat = { (6.849999904632568, 7.75) STATS_SPIN Switch = standard_switch }
    Physics_air_tap_turn_speed_stat = { (6.849999904632568, 7.75) STATS_SPIN Switch = standard_switch }
    Physics_Acid_Drop_Pop_Speed = 200
    Physics_Transfer_Speed_Limit_Override_Drop_Rate = 0.5000
    Physics_Transfer_Speed_Limit_Override_Max = 1.750
    Skater_side_collide_height = 16
    Skater_side_collide_length = 15
    Skater_air_extra_side_col = 12
}
bicycle_physics = {
    skater_autoturn_speed = 3.0
    skater_autoturn_cancel_time = 300
    skater_autoturn_vert_angle = 0
    Physics_Standing_Air_Friction = 0.000002000
    Physics_Crouched_Air_Friction = 0.000002000
    Physics_Rolling_Friction = 0.5000
    Skater_Max_Standing_Kick_Speed_Stat = { (0.0, 0.0) limit = 1 STATS_SPEED Switch = no_switch }
    Skater_Max_Crouched_Kick_Speed_Stat = { (800.0, 800.0) limit = 800 STATS_SPEED Switch = no_switch }
    Physics_Standing_Acceleration_Stat = { (0.0, 0.0) STATS_SPEED Switch = no_switch }
    Physics_Crouching_Acceleration_stat = { (500.0, 500.0) STATS_SPEED Switch = no_switch }
    Skater_Max_Speed_Stat = { (625.0, 800.0) STATS_SPEED Switch = no_switch }
    Skater_Max_Max_Speed_Stat = { (1050.0, 1050.0) STATS_SPEED Switch = no_switch }
    Skater_Vert_Max_Max_Speed_Stat = { (1050.0, 1050.0) STATS_SPEED Switch = no_switch }
    Skater_Vert_Max_Speed_Time = 1000
    Skater_default_head_height = 77
    Physics_Ground_Snap_Up = 32.20
    Physics_Air_Snap_Up = 15
    Physics_Ground_Snap_Down = 12
    Physics_Ground_Snap_Down_Skitching = 150.0
    Physics_Ground_Snap_up_Skitching = 50.0
    Skater_First_Forward_Collision_Height = 32.10
    Skater_First_Forward_Collision_Length = 25
    Skater_Min_Distance_To_Wall = 32.0
    Physics_Ground_Rotation = 2.0
    Physics_Ground_Drift_Rotation = 2.500
    Physics_Ground_Sharp_Rotation = 6.500
    Physics_Air_No_Rotate_Time = 100
    Physics_Air_Ramp_Rotate_Time = 50
    spin_count_slop = 60
    Physics_Air_Gravity = -1200
    Physics_Ground_Gravity = -1000
    Physics_Rail_Gravity = -2000
    Wall_Ride_Gravity = -500
    Ground_stick_angle = 40
    Ground_stick_angle_forward = 40
    Physics_Brake_Acceleration = 2000
    Physics_Front_Brake_Acceleration = 800
    Physics_Brake_Skid_Acceleration = 300
    Physics_Air_No_Lean_Time = 0
    Physics_Air_Ramp_Lean_Time = 0
    Physics_Ground_No_Lean_Time = 500
    Physics_manual_no_balance_frames = 20
    Physics_Air_Lean_stat = { (1.5, 1.5) STATS_SPIN Switch = no_switch }
    Physics_Air_Lean_fast_stat = { (6.5, 6.5) STATS_SPIN Switch = no_switch }
    Physics_Ground_Lean_stat = { (40.0, 40.0) STATS_SPIN Switch = no_switch }
    Physics_Air_Rotation_stat = { (5.0, 5.0) STATS_SPIN Switch = no_switch }
    Physics_Air_Rotation_fast_stat = { (7.0, 7.0) STATS_SPIN Switch = no_switch }
    Physics_air_tap_turn_speed_stat = { (5.0, 5.0) STATS_SPIN Switch = no_switch }
    Physics_Acid_Drop_Pop_Speed = 200
    Physics_Acid_Drop_Speed_Limit_Override_Duration = 5
    Physics_Transfer_Speed_Limit_Override_Drop_Rate = 0.5000
    Physics_Transfer_Speed_Limit_Override_Max = 1.750
    Skater_side_collide_height = 16
    Skater_side_collide_length = 25
    Skater_air_extra_side_col = 12
}
Skater_Flip_Speed_Stat = { (1.159999966621399, 1.2999999523162842) STATS_FLIPSPEED Switch = standard_switch }
Physics_Jump_Speed_Stat = { (414.0, 450.0) STATS_OLLIE Switch = standard_switch }
Physics_Jump_Speed_min_Stat = { (350.0, 350.0) STATS_OLLIE Switch = standard_switch }
Physics_Boneless_Jump_Speed_Stat = { (489.0, 525.0) STATS_OLLIE Switch = standard_switch }
Physics_Boneless_Jump_Speed_min_Stat = { (400.0, 400.0) STATS_OLLIE Switch = standard_switch }
Physics_Air_Jump_Speed_Stat = { (275.0, 275.0) STATS_AIR Switch = standard_switch }
Physics_Air_Jump_Speed_min_Stat = { (100.0, 100.0) STATS_AIR Switch = standard_switch }
Physics_Boneless_Air_Jump_Speed_Stat = { (264.0, 325.0) STATS_AIR Switch = standard_switch }
Physics_Boneless_Air_Jump_Speed_min_Stat = { (200.0, 200.0) STATS_AIR Switch = standard_switch }
Spine_Max_Width = 800
Physics_recover_rate_stat = { (2.0, 2.0) STATS_SPIN Switch = standard_switch }
Physics_bike_quick_level_out_rate = { (4.0, 4.0) STATS_SPIN Switch = standard_switch }
skater_xbox_shoulder_turn_no_rotate_time = 100
Physics_Air_hang_Stat = 1.0
Physics_Vert_hang_Stat = 1.100
Physics_Acid_Drop_Min_Air_Time = 0.2500
Physics_Acid_Drop_Walking_On_Ground_Search_Distance = 100
Physics_Acid_Drop_Min_Land_Speed = 500
Physics_Wallplant_Min_Approach_Angle = 50
Physics_Disallow_Rewallplant_Duration = 850
Physics_Wallplant_Speed_Loss = 125
Physics_Wallplant_Min_Exit_Speed = 200
Physics_Wallplant_Vertical_Exit_Speed = 500
Physics_Wallplant_Disallow_Grind_Duration = 200
Physics_Ignore_Ceilings_After_Wallplant_Duration = 200
Physics_Min_Wallplant_Height = 24
Physics_Wallplant_Distance_From_Wall = 27.60
Physics_Wallplant_Duration = 200
Physics_late_wallplant_frames = 8
Physics_vert_wallplant_boost = 300
Physics_Vert_wallplant_forward_tilt = 80
Physics_vert_wallplant_distance = 36
Physics_vert_wallplant_vertical_velocity_limit = -100
Physics_vert_wallplant_button_window = 0.1000
Physics_Walking_Wallplant_Speed = 500
Physics_Wallplant_Delay = 0.0
Physics_flip_bail_angle = 60
Physics_Disallow_Rewallpush_Duration = 800
Physics_Wallpush_Speed_Loss = 200
Physics_Wallpush_Min_Exit_Speed = 100
Physics_Wallpush_Vertical_Exit_Speed = 400
Physics_Point_Rail_Kick_Upward_Angle = 35
Physics_Time_Before_Free_Revert = 20
Physics_Graffiti_Wait_Frames = 60
Physics_Projectile_Targeting_Angle = 25
Physics_Projectile_Targeting_Dist = 2500
physics_bank_pop_vel = 700
physics_bank_pop_max_speed = -100
Lip_side_hop_speed = 10
Lip_side_jump_speed = 200
Lip_along_jump_speed = 100
Lip_held_jump_out_time = 300
Lip_held_jump_along_time = 300
stallangledotproduct = 0.5000
stall_slip_time = 130
skater_upright_sideways_speed = -60.0
physics_break_air_speed_scale = 0.7500
physics_break_air_up_scale = 0.7500
Skater_Break_Vert_forward_tilt = 45
Skater_Vert_Allow_break_Time = 200
Skater_vert_push_time = 130
Skater_vert_active_up_time = 250
Rail_Speed_Boost = 150
Point_Rail_Speed_Boost = 125
Skater_Drift_Upright_Speed = 0.3000
Physics_Vert_Push_Out = 3
Physics_Heavy_Air_Friction = 0.0001000
Skater_Flip_Speed = 1.0
Skater_Late_Jump_Slop = 333
Skater_max_tense_time = 200
Skater_Cam_Horiz_FOV = 72.0
Skater_Cam_Behind = 14
Skater_Cam_Above = 4.0
Skater_Cam_Tilt = 0.1800
Skater_Cam_Slerp = 0.08000
Skater_Cam_Vert_Air_Slerp = 0.02500
Physics_RunTimer_Duration = { (6.0, 12.0) STATS_RUN Switch = no_switch }
Hang_Run_Timer_Speed_Adjustment = 0.4000
focus_max_times_in_combo = 3
focus_time_limit = 15.0
focus_button_pressed_time = 100
skater_walking_camera_target_zoom = 1.100
skater_walking_camera_above_val = 65.0
Skater_Camera_Undefined = {
    horiz_fov = 0.0
    behind = 0.0
    above = 0.0
    tilt = 0.0
    slerp = 0.0
    vert_air_slerp = 0.0
    vert_air_landed_slerp = 0.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.0
    grind_zoom = 0.0
    origin_offset = 0.0
    wallride_offset_angle = 0.5000
    name = 'undefined'
}
Skater_Camera_Standard_Medium = {
    horiz_fov = 72.0
    behind = 11.20
    above = 4.100
    tilt = 0.1800
    slerp = 0.04000
    vert_air_slerp = 0.04000
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.3000
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.7000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard'
}
Skater_Camera_Standard_Far = {
    horiz_fov = 72.0
    behind = 50.0
    above = 6.0
    tilt = 0.3000
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'far'
}
Skater_Camera_Standard_Near = {
    horiz_fov = 72.0
    behind = 7.0
    above = 2.0
    tilt = 0.1800
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.9000
    lip_trick_zoom = 1.600
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'near'
}
Skater_Camera_Standard_Medium_LTG = {
    horiz_fov = 72.0
    behind = 14.0
    above = 2.0
    tilt = 0.1500
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard ltg'
}
Skater_Camera_2P_Vert_Medium = {
    horiz_fov = 72.0
    behind = 14.0
    above = 4.300
    tilt = 0.1800
    slerp = 0.04000
    vert_air_slerp = 0.04000
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.7000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard'
}
Skater_Camera_2P_Vert_Far = {
    horiz_fov = 72.0
    behind = 22.0
    above = 6.0
    tilt = 0.3000
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'far'
}
Skater_Camera_2P_Vert_Near = {
    horiz_fov = 72.0
    behind = 6
    above = 2.0
    tilt = 0.1800
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.9000
    lip_trick_zoom = 1.600
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'near'
}
Skater_Camera_2P_Vert_Medium_LTG = {
    horiz_fov = 72.0
    behind = 14.0
    above = 3.0
    tilt = 0.1500
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard ltg'
}
Skater_Camera_2P_Horiz_Medium = {
    horiz_fov = 72.0
    behind = 15.0
    above = 3.500
    tilt = 0.2000
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'far'
}
Skater_Camera_2P_Horiz_Far = {
    horiz_fov = 72.0
    behind = 25.0
    above = 3.500
    tilt = 0.3000
    slerp = 0.04000
    vert_air_slerp = 0.04000
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.7000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard'
}
Skater_Camera_2P_Horiz_Medium_LTG = {
    horiz_fov = 72.0
    behind = 15.0
    above = 3.0
    tilt = 0.1500
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard ltg'
}
Skater_Camera_2P_Horiz_Near = {
    horiz_fov = 72.0
    behind = 8.0
    above = 3.200
    tilt = 0.1800
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 1.0
    lip_trick_zoom = 1.600
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'near'
}
Skater_Camera_Bike_Medium = {
    horiz_fov = 72.0
    behind = 10.0
    above = 3.500
    tilt = 0.1800
    slerp = 0.04000
    vert_air_slerp = 0.04000
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.7000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard'
}
Skater_Camera_Bike_Far = {
    horiz_fov = 72.0
    behind = 14.0
    above = 6.0
    tilt = 0.3000
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'far'
}
Skater_Camera_Bike_Near = {
    horiz_fov = 72.0
    behind = 7.0
    above = 2.0
    tilt = 0.1800
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.9000
    lip_trick_zoom = 1.600
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'near'
}
Skater_Camera_Bike_Medium_LTG = {
    horiz_fov = 72.0
    behind = 14.0
    above = 2.0
    tilt = 0.1500
    slerp = 0.08000
    vert_air_slerp = 0.02500
    vert_air_landed_slerp = 0.3750
    lerp_xz = 0.2500
    lerp_y = 0.7500
    vert_air_lerp_xz = 1.0
    vert_air_lerp_y = 1.0
    zoom_lerp = 0.06250
    big_air_trick_zoom = 0.6000
    lip_trick_zoom = 1.0
    lip_trick_tilt = -0.8000
    lip_trick_above = 0.4000
    grind_zoom = 1.0
    origin_offset = 0.2000
    wallride_offset_angle = 0.5000
    name = 'standard ltg'
}
Skater_Camera_Array = [
    Skater_Camera_Undefined
    Skater_Camera_Standard_Near
    Skater_Camera_Standard_Medium
    Skater_Camera_Standard_Far
    Skater_Camera_Standard_Medium_LTG
]
Skater_Camera_2P_Vert_Array = [
    Skater_Camera_Undefined
    Skater_Camera_2P_Vert_Near
    Skater_Camera_2P_Vert_Medium
    Skater_Camera_2P_Vert_Far
    Skater_Camera_2P_Vert_Medium_LTG
]
Skater_Camera_2P_Horiz_Array = [
    Skater_Camera_Undefined
    Skater_Camera_2P_Horiz_Near
    Skater_Camera_2P_Horiz_Medium
    Skater_Camera_2P_Horiz_Far
    Skater_Camera_2P_Horiz_Medium_LTG
]
Skater_Camera_Bike_Array = [
    Skater_Camera_Undefined
    Skater_Camera_Bike_Near
    Skater_Camera_Bike_Medium
    Skater_Camera_Bike_Far
    Skater_Camera_Bike_Medium_LTG
]
Normal_Lerp_Speed = 0.1000
Normal_Lerp_Speed_Bike = 0.5000
Normal_Lerp_Velocity_Scale = 250.0
rail_max_snap = 40.0
climb_max_snap = 30.0
air_horiz_snap_distance = 36.0
drop_to_climb_max_snap = 36.0
Rail_jump_rerail_time = 300
Rail_minimum_rerail_time = 500
Rail_walk_rerail_time = 1000
Rail_Corner_Leave_Angle = 50
Rail_Jump_Angle = 15
Rail_Tolerance = 0.7000
Rail_Bad_Ledge_Side_Dist = 5
Rail_Bad_Ledge_Drop_Down_Dist = 24
Wall_Bounce_Angle_Multiplier = 1.100
Wall_Bounce_Dont_Slow_Angle = 30
Wall_Bounce_Dont_Flail_Speed = 100
Wall_Non_Skatable_Angle = 25
Wall_Ride_Min_Speed = 75
Wall_Ride_Max_Incident_Angle = 60
Wall_Ride_Max_Tilt = 68.50
Wall_Ride_Upside_Down_Angle = 53
Wall_Ride_Triangle_Window = 0.3330
Wall_Ride_Delay = 0.6660
Wall_Ride_Down_Collision_Check_Length = -10
Wall_Ride_Turn_Speed = 0.004000
Wall_Ride_Jump_Out_Speed = 40
Wall_Ride_Jump_Up_Speed = 80
WallRidePlant_Jump_Out_Speed = 210
WallRun_Jump_Out_Speed = 145
Skater_max_sloped_turn_speed = 300.0
Skater_max_sloped_turn_cosine = 0.5000
Skater_Slow_Turn_on_slopes = 3.0
BalanceIgnoreButtonPeriod = 0
BalanceSafeButtonPeriod = 1000
ManualParams = {
    Cheese = { (700.0, 700.0) STATS_MANUAL Switch = standard_switch }
    CheeseFrames = { (100.0, 100.0) STATS_MANUAL Switch = standard_switch }
    Lean_Gravity_Stat = { (0.019999999552965164, 0.019999999552965164) diff = LEAN_GRAVITY_DIFF STATS_MANUAL Switch = standard_switch }
    Instable_Rate = { (0.0989999994635582, 0.07000000029802322) STATS_MANUAL Switch = standard_switch diff = (0.5, 2.0) }
    Instable_Base = { (1.0, 1.0) STATS_MANUAL Switch = standard_switch }
    Lean_Min_Speed = { (5.0, 5.0) STATS_MANUAL Switch = standard_switch }
    Lean_Rnd_Speed = { (20.0, 20.0) STATS_MANUAL Switch = standard_switch }
    Repeat_Min = { (1.0, 1.0) STATS_MANUAL Switch = standard_switch }
    Repeat_Multiplier = { (0.25, 0.25) STATS_MANUAL Switch = standard_switch }
    Lean_Repeat_Multiplier = { (0.800000011920929, 0.800000011920929) STATS_MANUAL Switch = standard_switch }
    Lean_Acc = { (10.0, 10.0) diff = LEAN_ACC_DIFF STATS_MANUAL Switch = standard_switch }
    Lean_Bail_Angle = { (4000.0, 4000.0) STATS_MANUAL Switch = standard_switch }
}
SkitchParams = {
    Cheese = { (700.0, 700.0) }
    CheeseFrames = { (1.0, 1.0) }
    Lean_Gravity_Stat = { (0.009999999776482582, 0.009999999776482582) }
    Instable_Rate = { (0.03999999910593033, 0.03999999910593033) }
    Instable_Base = { (0.5, 0.5) }
    Lean_Min_Speed = { (5.0, 5.0) }
    Lean_Rnd_Speed = { (10.0, 10.0) }
    Repeat_Min = { (1.0, 1.0) }
    Repeat_Multiplier = { (0.25, 0.25) }
    Lean_Repeat_Multiplier = { (0.800000011920929, 0.800000011920929) }
    Lean_Acc = { (8.0, 8.0) }
    Lean_Bail_Angle = { (4000.0, 4000.0) }
}
GrindParams = {
    Cheese = { (2500.0, 2500.0) STATS_RAILBALANCE Switch = standard_switch }
    CheeseFrames = { (30.0, 30.0) STATS_RAILBALANCE Switch = standard_switch }
    Lean_Gravity_Stat = { (0.019999999552965164, 0.019999999552965164) diff = LEAN_GRAVITY_DIFF STATS_RAILBALANCE Switch = standard_switch }
    Instable_Rate = { (0.10400000214576721, 0.09000000357627869) STATS_RAILBALANCE Switch = standard_switch }
    Instable_Base = { (1.0, 1.0) STATS_RAILBALANCE Switch = standard_switch }
    Lean_Min_Speed = { (5.0, 5.0) STATS_RAILBALANCE Switch = standard_switch }
    Lean_Rnd_Speed = { (7.070000171661377, 6.0) limit = 6 STATS_RAILBALANCE Switch = standard_switch }
    Repeat_Min = { (1.0, 1.0) STATS_RAILBALANCE Switch = standard_switch }
    Repeat_Multiplier = { (0.3100000023841858, 0.10000000149011612) STATS_RAILBALANCE Switch = standard_switch }
    Lean_Repeat_Multiplier = { (0.6069999933242798, 0.5) STATS_RAILBALANCE Switch = standard_switch }
    Lean_Acc = { (10.0, 10.0) diff = LEAN_ACC_DIFF STATS_RAILBALANCE Switch = standard_switch }
    Lean_Bail_Angle = { (4000.0, 4000.0) STATS_RAILBALANCE Switch = standard_switch }
    Same_Grind_Add_Time = { (2.0, 2.0) STATS_RAILBALANCE Switch = standard_switch }
    New_Grind_Sub_Time = { (-0.28600001335144043, 0.0) STATS_RAILBALANCE Switch = standard_switch }
}
LipParams = {
    Cheese = { (3000.0, 1000.0) STATS_LIPBALANCE Switch = standard_switch }
    CheeseFrames = { (180.0, 180.0) STATS_LIPBALANCE Switch = standard_switch }
    Lean_Gravity_Stat = { (0.019999999552965164, 0.019999999552965164) diff = LEAN_GRAVITY_DIFF STATS_LIPBALANCE Switch = standard_switch }
    Instable_Rate = { (0.5, 0.20000000298023224) STATS_LIPBALANCE Switch = standard_switch }
    Instable_Base = { (1.0, 1.0) STATS_LIPBALANCE Switch = standard_switch }
    Lean_Min_Speed = { (10.0, 10.0) STATS_LIPBALANCE Switch = standard_switch }
    Lean_Rnd_Speed = { (20.0, 20.0) STATS_LIPBALANCE Switch = standard_switch }
    Repeat_Min = { (1.0, 1.0) STATS_LIPBALANCE Switch = standard_switch }
    Repeat_Multiplier = { (1.0, 1.0) STATS_LIPBALANCE Switch = standard_switch }
    Lean_Repeat_Multiplier = { (1.0, 1.0) STATS_LIPBALANCE Switch = standard_switch }
    Lean_Acc = { (10.0, 10.0) diff = LEAN_ACC_DIFF STATS_LIPBALANCE Switch = standard_switch }
    Lean_Bail_Angle = { (4000.0, 4000.0) STATS_LIPBALANCE Switch = standard_switch }
}
DefaultWobbleParams = {
    wobbleampa = { (0.05000000074505806, 0.05000000074505806) STATS_MANUAL }
    wobbleampb = { (0.03999999910593033, 0.03999999910593033) STATS_MANUAL }
    wobblek1 = { (0.002199999988079071, 0.002199999988079071) STATS_MANUAL }
    wobblek2 = { (0.0017000000225380063, 0.0017000000225380063) STATS_MANUAL }
    spazfactor = { (1.0, 1.0) STATS_MANUAL }
}
BashPeriod = 400
BashSpeedupFactor = 0.2000
BashMaxPercentSpeedup = 60
SkateInAble_HorizOffset = 30
SkateInAble_DownOffset = 7
SkateInAble_LipHorizOffset = 20
SkateInAble_LipDownOffset = 7
SkateInAble_LipExtraCheckHorizOffset = 13
SkateInAble_LipExtraCheckDownOffset = 2400
LipAllowAngle = 15
LipAllowAngle_Override = 60
LipPlayerHorizontalAngle = 47
LipRampVertAngle = 68.50
CarPlant_Forward_boost = 400
CarPlant_Upward_boost = 100
min_car_height_diff = 60
min_car_height_downwards = 30
NewSpecial = 1
Skate_min_wall_lean_push_speed = 1000
Skate_wall_lean_push_time = 0.4000
Skate_wall_lean_push_length = 35
Skate_wall_lean_push_height = 30
Skitch_Max_Distance = 120
Skitch_Offset = 27
skitch_suck_speed = 200
skitch_speed_match = 1.0
skitch_hold_time = 200
SnowBoard_Friction = 0.3000
Snowboard_turn_multiplier = 2.0
cess_turn_min_speed = 40
cess_turn_cap_speed = 500
cess_turn_multiplier = 1.500
cess_Friction = 0.06000
Skater_cess_Flip_Speed = 10000.0
slomo_speed = 0.5000
Matrix_speed = 0.1500
Sim_speed = 1.250
Moon_gravity = 0.5000
rubber_acc = 0.001000
rubber_friction = 0.04000
rubber_limit = 1000
InternetClientCollCoefficient = 180.0
InternetServerCollCoefficient = 120.0
InternetClientCollRadius = 120.0
InternetServerCollRadius = 94.0
LanClientCollCoefficient = 100.0
LanServerCollCoefficient = 55.0
LanClientCollRadius = 70.0
LanServerCollRadius = 70.0
ClientCollCoefficient = 20.0
ServerCollCoefficient = 20.0
ClientCollRadius = 70.0
ServerCollRadius = 70.0
DrivingRadiusBoostFactor = 0.1000
DrivingCoefficientBoostFactor = 0.1000
ped_push_dist = 24
ped_push_skater_speed = 400
walk_camera_parameters = {
    matrix_slerp_rate = 0.01200
    lookaround_slerp_rate = 0.04000
    run_slerp_factor = 1.750
    min_slerp_speed = 130
    full_slerp_speed = 450
    dpad_min_slerp_speed = 50
    dpad_full_slerp_speed = 150
    flush_slerp_factor = 3
    lock_angle = 135
    facing_control = 1.700
    control_slerp_factor = 1.300
    camera_pos_max_vert_dist = 20.0
    focus_pos_max_offset_up = 20.0
    focus_pos_max_offset_down = 30.0
}
walk_parameters = {
    walk_speed = 193
    run_speed = 518
    combo_run_speed = 575
    run_adjust_rate = 1
    decel_factor = 2
    low_speed_decel_factor = 13.50
    run_accel_rate = 500
    walk_accel_rate = 225
    walk_point = 0.5000
    stop_skidding_speed = 50
    pegged_duration_for_skid = 0.2000
    rotate_upright_duration = 0.3000
    initial_vert_vel_boost = 80
    lerp_upright_rate = 6
    dpad_control_damping_factor = 1.300
    jump_velocity = 400
    min_jump_factor = 0.9000
    gravity = 1750
    hold_time_for_max_jump = 100
    hang_jump_factor = 0.8500
    jump_horiz_speed = 250
    jump_obstruction_check_height = 102
    jump_obstruction_check_back = 24
    jump_obstruction_extra_control_suppression_delay = 0
    sticky_land_threshold_speed = 200
    rotate_in_place_rate = 750
    max_rotate_in_place_speed = 125
    max_rotate_in_place_angle = 20
    walk_rotate_factor = 0.5000
    wall_rotate_factor = 0.3000
    slop_lock_angle = 0.4000
    ignore_velocity_threshold = 151
    max_pop_speed = 100
    worse_turn_factor = 10
    worse_worse_turn_factor = 1
    dpad_worse_turn_factor = 5
    dpad_worse_worse_turn_factor = 1
    best_turn_factor = 25
    jump_adjust_speed = 200
    jump_accel_factor = 12
    jump_decel_factor = 4
    snap_up_height = 24
    snap_down_height = 24
    max_unnoticed_ground_snap = 4
    feeler_length = 12
    feeler_length_air = 35
    feeler_height = 23
    push_feeler_length = 13
    push_feeler_length_air = 36
    push_strength = 10
    graffiti_feeler_length = 40
    sticker_feeler_length = 40
    vert_plant_feeler_length = 40
    whack_feeler_length = 6
    curb_float_lerp_up_rate = 54
    curb_float_lerp_down_rate = 18
    curb_float_feeler_length = 24
    min_curb_height_adjust_vel = 50
    walker_height = 70
    min_skid_speed = 175
    skid_accel = 1400
    max_reverse_angle = 45
    wall_turn_factor = 5
    wall_turn_speed_threshold = 20
    max_wall_turn_speed_threshold = 400
    forward_tolerance = 15
    stand_pos_search_depth = 18
    hang_move_speed = 80
    hang_move_lerp_rate = 6
    hang_move_cutoff = 20
    hang_vert_control_tolerance = 45
    hang_control_debounce_time = 0.5000
    hang_hop_max_rail_angle = 45
    hang_max_rail_ascent = 30
    ledge_top_feeler_up = 6
    ledge_top_feeler_down = 6
    ledge_front_feeler_forward = 12
    ledge_front_feeler_back = 12
    hang_obstruction_feeler_side = 6
    hang_obstruction_feeler_up = 6
    pull_up_obstruction_height = 12
    rehang_delay = 300
    hang_init_anim_feeler_height = -36
    hang_init_anim_feeler_length = 20
    hang_move_collision_up = 48
    hang_move_collision_back = 8
    hang_move_collision_side_length = 18
    hang_move_collision_side_height = 48
    hang_critical_point_vert_offset = 6
    hang_critical_point_horiz_offset = -14
    drop_to_hang_speed_factor = 0.8000
    hop_obstruction_feeler_up = 24
    barrier_jump_highest_barrier = 60
    barrier_jump_delay = 0
    barrier_jump_min_clearance = 3
    barrier_jump_max_angle = 45
    barrier_jump_min_vault_height = 40
    barrier_vault_stick_frames = 6
    max_horiz_snap_distance = 24
    button_horiz_snap_distance = 48
    max_vert_snap_distance = 24
    max_onto_ladder_angle = 60
    ladder_move_speed = 125
    ladder_control_tolerance = 45
    ladder_climb_offset = 4
    ladder_slide_speed = -5
    acid_drop_jump_velocity = 400
    vert_wall_jump_speed = 450
    horiz_wall_jump_speed = 0
    vert_wall_flip_speed = 260
    horiz_wall_flip_speed = 275
    wall_flip_stick_frames = 22
    wall_flip_vert_ramp_frames = 22
    wall_flip_horiz_ramp_frames = 6
    wall_run_up_stick_frames = 50
    max_slow_walk_speed = 120
    max_fast_walk_speed = 250
    max_slow_run_speed = 500
    min_anim_run_speed = 50
    hang_vert_origin_offset = 0
    hang_detection_vert_origin_offset = 91
    hang_horiz_origin_offset = 1.500
    pull_up_offset_forward = 10.84
    pull_up_offset_up = 0
    drop_to_hang_rotate_factor = 0.1000
    hang_anim_wait_speed = 1.600
    ladder_top_offset_forward = 6.004
    ladder_top_offset_up = 59.60
    ladder_bottom_offset_forward = 23.99
    ladder_bottom_offset_up = 13.04
    ladder_anim_wait_speed = 1.500
    hang_move_animation_speed = 46.20
    display_offset_restore_rate = 10
    max_cas_scaling = 0.2000
    min_ground_time_between_wallruns = 500
}
robot_rail_nudge = 400.0
robot_rail_add_time = 1.0
robot_kick_in_count = 10
uber_frig_default_height = 400.0
uber_frig_current_height = 400.0
trick_mult_degrade_start = 10
natas_spin_factor = 10.0
Physics_Natas_Delay = 0.3000
bike_forward_jump_boost = 100
