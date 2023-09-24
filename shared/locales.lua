-- /!\ WARNING : manual localizations will be required in qb-radialmenu config.lua and app.js of your inventory.

if Config.Lang == "en" then

Locales = {
    notif = {
        done = 'Done !',
        error = 'Error',
        cancel = 'Cancelled',
        removed = 'Removed !',
        pederror = 'Peds can\'t remove clothes!',
        pedprops = 'Peds can\'t remove props !',

        alremoved = 'You\'ve already removed it.',
        notwear = 'You\'re not wearing that !',

        busy = 'You are already doing something!',

        donthave = 'You dont have',
        onyou = 'on you',
    },

    progressbar = { --Only if you use progressbar
        removing = "Removing...",
        wearing = "Dressing up...",
    },

    hair = {
        saved = "Haircut saved",
        nohaircut = "Save your haircut before switching",

        manage = "Manage Haircuts",
        save1 = "Save Hair 1",
        save2 = "Save Hair 2",
        actual = "Saved : ", --Dont remove the space at the end

    }
}

elseif Config.Lang == "fr" then

end