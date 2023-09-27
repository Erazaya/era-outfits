Config = {}

Config.Lang = "en" ---Availables : en, fr / Default : en

Config.ProgressBar = "qb" --circle for ox ProgressCircle (Recommended), ox for ox progressbar, qb for qb-progressbar

Config.Duration = { -- Remove/Wear time, in MS
    pant = math.random(1900, 2400),
    shirt = math.random(800, 1300),
    hat = math.random(600, 800),
    glasses = math.random(600, 800),
    kevlar = math.random(1400, 1700),
    shoes = math.random(1800, 2200),
    chains = math.random(700, 1500),
    mask = math.random(700, 1100),
    bags = math.random(1100, 1300),
    bracelet = math.random(900, 1200),
    watch = math.random(800, 1200),
    ears = math.random(600, 800),
    decals = math.random(800, 1300),
    outfit  = math.random(2800, 3300)
}

--Anims config

Config.Anims = {
    pant = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
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
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
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
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
        flag = 33
    },  
    ears = {
        AnimDict = 'clothingtie',
        Anim = 'try_tie_positive_a',
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
