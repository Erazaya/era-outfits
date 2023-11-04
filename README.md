Please consider donating (link to the bottom) ! ♥

# era-outfits
Clothing in Inventory for QB-Core, featuring outfit management and alternatives haircuts for your players

Requirements : [ox_lib](https://github.com/overextended/ox_lib), any qb-inventory, qb-radialmenu, illenium-appaerance (optional) 

# Installation

Install and ensure era-outfits in your server.cfg like any scripts.

1.**load `playerhairs.sql` in your database**

2. **Go to qb-radialmenu config.lua and copy over line 170 to line 298 :**

```lua
                    id = 'clothesmenu',
                    title = 'Clothes',
                    icon = 'shirt',
                    items = {
                        {
                            id = 'Outfit',
                            title = 'Outfit',
                            icon = 'person-half-dress',
                            items = {
                                {
                                    id = 'removeall',
                                    title = 'Remove all Clothes',
                                    icon = 'person-dress',
                                    type = 'client',
                                    event = 'eraoutfits:client:removeall',
                                    shouldClose = true
                                }, {
                                    id = 'makeoutfit',
                                    title = 'Make Outfit',
                                    icon = 'bag-shopping',
                                    type = 'client',
                                    event = 'eraoutfits:client:makeoutfit',
                                    shouldClose = true  
                                }
                            }
                        }, {
                            id = 'Ear',
                            title = 'Ear',
                            icon = 'headphones',
                            type = 'client',
                            event = 'eraoutfits:client:ears',
                            shouldClose = false
                        }, {
                            id = 'Neck',
                            title = 'Chains',
                            icon = 'user-tie',
                            type = 'client',
                            event = 'eraoutfits:client:chains',
                            shouldClose = false
                        }, {
                            id = 'Top',
                            title = 'Top',
                            icon = 'shirt',
                            type = 'client',
                            event = 'eraoutfits:client:shirt',
                            shouldClose = false
                        }, {
                            id = 'Pants',
                            title = 'Pants',
                            icon = 'user',
                            type = 'client',
                            event = 'eraoutfits:client:pant',
                            shouldClose = false
                        }, {
                            id = 'Shoes',
                            title = 'Shoes',
                            icon = 'shoe-prints',
                            type = 'client',
                            event = 'eraoutfits:client:shoes',
                            shouldClose = false
                        }, {
                            id = 'Kevlar',
                            title = 'Kevlar',
                            icon = 'vest',
                            type = 'client',
                            event = 'eraoutfits:client:kevlar',
                            shouldClose = false
                        }, {
                            id = 'Hair',  -- If you want to use Alternatives Hairscuts
                            title = 'Hairs',
                            icon = 'user',
                            items = {
                                {
                                    id = 'sethair',
                                    title = 'Manage Hairs',
                                    icon = 'scissors',
                                    type = 'client',
                                    event = 'eraoutfits:client:openHairMenu',
                                    shouldClose = true
                                }, {
                                    id = 'togglehair',
                                    title = 'Switch Hairs ',
                                    icon = 'arrows-rotate',
                                    type = 'client',
                                    event = 'eraoutfits:client:switchHair',
                                    shouldClose = false  
                                }
                            }
                        }, {
                            id = 'meer',
                            title = 'Extras',
                            icon = 'plus',
                            items = {
                                {
                                    id = 'Hat',
                                    title = 'Hat',
                                    icon = 'hat-cowboy-side',
                                    type = 'client',
                                    event = 'eraoutfits:client:hat',
                                    shouldClose = false
                                }, {
                                    id = 'Glasses',
                                    title = 'Glasses',
                                    icon = 'glasses',
                                    type = 'client',
                                    event = 'eraoutfits:client:glasses',
                                    shouldClose = false
                                }, {
                                    id = 'Visor',
                                    title = 'Visor',
                                    icon = 'hat-cowboy-side',
                                    type = 'client',
                                    event = 'qb-radialmenu:ToggleProps',
                                    shouldClose = false
                                }, {
                                    id = 'Mask',
                                    title = 'Mask',
                                    icon = 'masks-theater',
                                    type = 'client',
                                    event = 'eraoutfits:client:mask',
                                    shouldClose = false
                                }, {
                                    id = 'Bag',
                                    title = 'Bag',
                                    icon = 'bag-shopping',
                                    type = 'client',
                                    event = 'eraoutfits:client:bags',
                                    shouldClose = false
                                }, {
                                    id = 'Bracelet',
                                    title = 'Bracelet',
                                    icon = 'user',
                                    type = 'client',
                                    event = 'eraoutfits:client:bracelet',
                                    shouldClose = false
                                }, {
                                    id = 'Watch',
                                    title = 'Watch',
                                    icon = 'stopwatch',
                                    type = 'client',
                                    event = 'eraoutfits:client:watch',
                                    shouldClose = false
                                }, {
                                    id = 'Decals',
                                    title = 'Decals',
                                    icon = 'vest-patches',
                                    type = 'client',
                                    event = 'eraoutfits:client:decals',
                                    shouldClose = false
                                }
                            }
                        }
                    }
                }
            }
        },
    }
```

3. **Illenium-Appearance**

Right under of RegisterNetEvent("illenium-appearance:client:changeOutfit", function(data) (line 646), add this :
```lua
    TriggerEvent("eraoutfits:client:getoutfit")
    TriggerServerEvent("illenium-appearance:server:chargeCustomer", "clothing")
```

Every clothing shop should work (like base clothing shop of qb), just try and see. Im not supporting any of these cuz im not familiar with



4. **Inventory**
Dont forget to add all the items images in html files

add these items in qb-core items.lua :
```lua
    -- Erazaya Clothing
     ['era_bracelet']                     = {['name'] = 'era_bracelet',                       ['label'] = 'Bracelet',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_bracelet.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_chains']                     = {['name'] = 'era_chains',                       ['label'] = 'Chains',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_chains.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_decal']                     = {['name'] = 'era_decal',                       ['label'] = 'Decal',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_decal.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_ears']                     = {['name'] = 'era_ears',                       ['label'] = 'Ears Accessory',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_ears.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_glasses']                     = {['name'] = 'era_glasses',                       ['label'] = 'Glasses',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_glasses.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_hat']                     = {['name'] = 'era_hat',                       ['label'] = 'Hat',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_hat.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_mask']                     = {['name'] = 'era_mask',                       ['label'] = 'Mask',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_mask.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_outfit']                     = {['name'] = 'era_outfit',                       ['label'] = 'Outfit',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_outfit.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_pants']                     = {['name'] = 'era_pants',                       ['label'] = 'Pants',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_pants.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_para']                     = {['name'] = 'era_para',                       ['label'] = 'Bag',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_para.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_shoes']                     = {['name'] = 'era_shoes',                       ['label'] = 'Shoes',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_shoes.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_top']                     = {['name'] = 'era_top',                       ['label'] = 'Top',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_top.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_watch']                     = {['name'] = 'era_watch',                       ['label'] = 'Watch',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'era_watch.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},
    ['era_kevlar']                     = {['name'] = 'era_kevlar',                       ['label'] = 'Kevlar',               ['weight'] = 0,         ['type'] = 'item',         ['image'] = 'armor.png',             ['unique'] = true,          ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = ' '},

```

in html > js > app.js, near line 631 at FormatItemInfo, add this : 

```javascript
 // Era Clothes
            
        } else if (itemData.name == "era_kevlar") {
            $(".item-info-title").html('<p>Kevlar</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_bracelet") {
            $(".item-info-title").html('<p>Bracelet</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_shoes") {
            $(".item-info-title").html('<p>Shoes</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );

        } else if (itemData.name == "era_chains") {
            $(".item-info-title").html('<p>Chains</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_decal") {
            $(".item-info-title").html('<p>Decals</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );

        } else if (itemData.name == "era_top") {
            $(".item-info-title").html('<p> Top' + '</p>');
            $(".item-info-description").html(
                "<p><strong>Top : </strong><span>" +
                itemData.info.idtop +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colortop +
                "<p><strong>Shirt : </strong><span>" +
                itemData.info.idshirt +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorshirt +
                "<p><strong>Hands : </strong><span>" +
                itemData.info.idgloves +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorgloves +
                "</p>"
                );

        } else if (itemData.name == "era_glasses") {
            $(".item-info-title").html('<p>Glasses</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_mask") {
            $(".item-info-title").html('<p>Mask</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_watch") {
            $(".item-info-title").html('<p>Watch</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_ears") {
            $(".item-info-title").html('<p>Ears Accessory</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_pants") {
            $(".item-info-title").html('<p>Pants</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );
        } else if (itemData.name == "era_para") {
            $(".item-info-title").html('<p>Bag</p>');
            $(".item-info-description").html(
                "<p><strong>ID : </strong><span>" +
                itemData.info.id +
                "</span></p>" + 
                "<p><strong>Color : </strong><span>" +
                itemData.info.color +
                "</span></p>"
            );

        } else if (itemData.name == "era_outfit") {
            $(".item-info-title").html('<p> Outfit' + '</p>');
            $(".item-info-description").html(
                "<p><strong>Top : </strong><span>" +
                itemData.info.idtop +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colortop +
                "<p><strong>Shirt : </strong><span>" +
                itemData.info.idshirt +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorshirt +
                "<p><strong>Gloves : </strong><span>" +
                itemData.info.idgloves +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorgloves +

                "<p><strong>Pants : </strong><span>" +
                itemData.info.idpants +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorpants +

                "<p><strong>Shoes : </strong><span>" +
                itemData.info.idshoes +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorshoes +

                "<p><strong>Bags : </strong><span>" +
                itemData.info.idbag +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorbag +

                "<p><strong>Decals : </strong><span>" +
                itemData.info.iddecal +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colordecal +

                "<p><strong>Kevlar  : </strong><span>" +
                itemData.info.idkevlar +
                "<p><strong>Color : </strong><span>" +
                itemData.info.colorkevlar +
                "</p>"
                );
            // Era Clothes
```

**/!\ Im using ps-inventory, but all qb-inventory redesign should work. **

**Era-Outfits should work fine now. Please be aware this is a learning project, im not an actual dev, this should be full of beginners errors. Have fun !**


# **Configuration**

translation in locales.lua, otherwise in config.lua

If you dont want Alternative Hairs for any reason, you can remove them by removing the lines in qb-radialmenu.


# Donations



[![kofi](https://user-images.githubusercontent.com/7586345/125668092-55af2a45-aa7d-4795-93ed-de0a9a2828c5.png)](https://ko-fi.com/erazaya)
