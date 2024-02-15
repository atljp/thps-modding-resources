Default_Life_Max_Objects = 10
Life_Max_Objects = 10
block_pedspawn = 0
default_spawn_params = {
    max_distance = 4000.0
    optimal_distance = 2000.0
    vision_weight = 0.2000
    min_relevance = 0.7500
    cooldown_time = 3.0
}
default_ped_profile_list = [
]

script LoadZonePedProfiles \{ ped_profile_list = default_ped_profile_list }
    SetZoneProfiles <ped_profile_list>
endscript

script spawn_nearby_ped 
    ped = {
        ped_type = ped_life
        priority = 2
        nearby
        profile = <profile>
    }
    SpawnPed <ped>
endscript

script PedlifeSpawner 
    begin 
    if CompositeObjectExists skater
        break 
    endif
    printf 'PedlifeSpawner - No Skater yet'
    wait 1 seconds
    repeat 
    if (InMultiPlayerGame)
        return 
    endif
    printf 'PedlifeSpawner - starting runtime ped spawning checks on LifeNodes'
    begin 
    if NOT (disable_pedlife = 1)
        GetNumPedLifeObjects
        if ((block_pedspawn = 0)& (ShouldSpawnPed priority = COIM_Priority_PedLife extra_heap = GoalHeap)& (<num_objects> < Life_Max_Objects))
            new_ped = {
                priority = (COIM_Priority_PedLife)
                ped_type = ped_life
            }
            if NOT SpawnPed <new_ped> extra_heap = GoalHeap
                wait 1 seconds
            else
                wait 1 seconds
            endif
        else
            wait 1 seconds
        endif
    else
        wait 2 seconds
    endif
    repeat 
endscript
