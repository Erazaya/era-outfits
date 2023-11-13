Config = {}

Config.Lang = "en" ---Availables : en, fr, es / Default : en

Config.ProgressBar = "circle" --circle for ox ProgressCircle (Recommended), ox for ox progressbar, qb for qb-progressbar

Config.Duration = { -- Remove/Wear time, in MS
    pant = math.random(1900, 2400),
    shirt = math.random(800, 1300),
    hat = math.random(600, 800),
    glasses = math.random(600, 800),
    kevlar = math.random(1400, 1700),
    shoes = 1200,
    chains = math.random(700, 1500),
    mask = math.random(700, 1100),
    bags = math.random(1100, 1300),
    bracelet = math.random(900, 1200),
    watch = math.random(800, 1200),
    ears = math.random(850, 935),
    decals = math.random(800, 1300),
    outfit  = math.random(2800, 3300)
}

--Anims config

Config.Anims = {
    pant = {
        AnimDict = 're@construction',
        Anim = 'out_of_breath',
        flag = 51
    },
    shirt = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },
    hat = {
        AnimDict = 'missheist_agency2ahelmet',
        Anim = 'take_off_helmet_stand',
        flag = 33
    },
    glasses = {
        AnimDict = 'clothingspecs',
        Anim = 'take_off',
        flag = 33
    },
    kevlar = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },
    shoes = {
        AnimDict = 'random@domestic',
        Anim = 'pickup_low',
        flag = 0
    },
    chains = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },
    mask = {
        AnimDict = 'missfbi4',
        Anim = 'takeoff_mask',
        flag = 33
    },
    bags = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },
    bracelet = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },  
    watch = {
        AnimDict = 'nmt_3_rcm',
        Anim = 'cs_nigel_dual',
        flag = 51
    },  
    ears = {
        AnimDict = 'mp_cp_stolen_tut',
        Anim = 'b_think',
        flag = 33
    },  
    decals = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },  
    outfit  = {
        AnimDict = 'mp_safehouseshower@male@',
        Anim = 'male_shower_idle_c',
        flag = 33
    }
}
