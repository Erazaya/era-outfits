-- /!\ WARNING : manual localizations will be required in qb-radialmenu config.lua and app.js of your inventory.
--Any contributions on localizations are welcome !


if Config.Lang == 'en' then

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
        removing = 'Removing...',
        wearing = 'Dressing up...',
    },

    hair = {
        saved = 'Haircut saved',
        nohaircut = 'Save your haircut before switching',

        manage = 'Manage Haircuts',
        save1 = 'Save Hair 1',
        save2 = 'Save Hair 2',
        actual = 'Saved : ', --Dont remove the space at the end

    }
}

elseif Config.Lang == 'fr' then
    Locales = {
        notif = {
            done = 'Terminé !',
            error = 'Erreur',
            cancel = 'Annulé',
            removed = 'Retiré !',
            pederror = 'Ce n\'est pas accessible aux peds !',
            pedprops = 'Ce n\'est pas accessible aux peds !',
    
            alremoved = 'Vous l\'avez déjà enlevé !',
            notwear = 'Vous n\'en portez pas !',
    
            busy = 'Vous êtes déjà occupé !',
    
            donthave = 'Vous n\'avez pas',
            onyou = 'sur vous',
        },
    
        progressbar = { --Only if you use progressbar
            removing = 'Déshabillage...',
            wearing = 'Vous vous habillez...',
        },
    
        hair = {
            saved = 'Coupe sauvegardée',
            nohaircut = 'Sauvegarder une coupe avant de de lchanger !',
    
            manage = 'Gérer vos cheveux',
            save1 = 'Sauvegarder Coupe 1',
            save2 = 'Sauvegarder Coupe 2',
            actual = 'Actuelle : ', --Dont remove the space at the end
    
        }
    }
    
elseif Config.Lang == 'es' then -- Translation by RS 

Locales = {
    notif = {
        done = 'Hecho !',
        error = 'Error',
        cancel = 'Cancelado',
        removed = 'Eliminado !',
        pederror = 'Los peds no pueden quitarse la ropa.!',
        pedprops = 'Los peds no pueden quitar los accesorios. !',

        alremoved = 'Ya lo has eliminado.',
        notwear = 'No estás usando eso !',

        busy = 'Ya estas haciendo algo!',

        donthave = 'no tienes',
        onyou = 'en ti',
    },

    progressbar = { --Only if you use progressbar
        removing = 'Eliminando...',
        wearing = 'Vistiendote...',
    },

    hair = {
        saved = 'Corte de pelo guardado',
        nohaircut = 'Guarda tu corte de pelo antes de cambiar',

        manage = 'Cortes de pelo',
        save1 = 'Peinado 1',
        save2 = 'Peinado 2',
        actual = 'Guardado : ', --Dont remove the space at the end

    }
}
end
