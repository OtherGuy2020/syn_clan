Config = { }

Config.webhook = true -- turn on webhook functionality for players. change to  false if you dont want webhooks. (player)
Config.allowplayer = false -- allow players to set their own webhook links
Config.adminwebhook = false -- admin webhook to monitor your clans
Config.adminwebhooklink = "https://discord.com/api/webhooks/782096235418878003/rL1f8wKySxDVaLf7zkgLnXVgP08x8TMu1GWYGfdsRhzeB0oF_tyhPhQii6dxFB8AAtVq"
Config.ItemQuantity = { -- butcher stuff
    ["Max"] = 3,
    ["Min"] = 1
}
Config.keys = { -- only change the hashes
    -- Letter E
    ["one"] = 0xD9D0E1C0, --spacebar
    ["two"] = 0x3C0A40F2, -- f6
    ["three"] = 0x760A9C6F, --g
    ["four"] = 0x8CC9CD42, --x
    
}
Config.equipmentprice = { -- camp prop prices
    ["tent1"] = 10,
    ["tent2"] = 10,
    ["tent3"] = 10,
    ["tent4"] = 10,
    ["tent5"] = 10,
    ["butcher"] = 100,
    ["fire"] = 50,
    ["post"] = 30,
    ["table"] = 30,
    ["invent"] = 200,
    ["stew"] = 100,
    ["chair"] = 30,
    ["barrel"] = 500,
    ["destiller"] = 700,
    ["tipi"] = 100,
    ["tentu2"] = 200,
    ["tentu3"] = 400,
    ["tentu4"] = 600,
    ["tentu5"] = 800,
    ["tentu6"] = 1000,

}
Config.level = { -- required levels  
    ["Hunting"] = 2,
    ["smalldelivery"] = 2,
    ["mediumdelivery"] = 4,
    ["largedelivery"] = 7,
    ["fire"] = 3,
    ["post"] = 2,
    ["table"] = 2,
    ["invent"] = 5,
    ["stew"] = 4,
    ["chair"] = 2,
    ["barrel"] = 6,
    ["destiller"] = 7,
    ["butcher"] = 1,
    ["tipi"] = 2,-- tent upgrade
    ["tentu2"] = 3, -- tent upgrade 
    ["tentu3"] = 4,-- tent upgrade
    ["tentu4"] = 5,-- tent upgrade
    ["tentu5"] = 7,-- tent upgrade
    ["tentu6"] = 10,-- tent upgrade
}
Config.Cartprice = {
    ["Hunting"] = 200,
    ["Huntingrent"] = 5,
    ["smalldelivery"] = 50,
    ["mediumdelivery"] = 100,
    ["largedelivery"] = 200,
}

Config.stewbuff = { -- duration of golden cores when eating upgraded stew, increase value for longer buff. always add the .0 at the end of the number
    ["level2"] = 800.0,
    ["level3"] = 1000.0,
    ["level4"] = 1500.0,
    ["level5"] = 2000.0,
}

Config.Recipe1 = { -- dont add more items in recipies it work wont. (change item names to match your DB)
    ["item1"] = "meat",
    ["countitem1"] = 1,

}
Config.Recipe2 = { 
["item1"] = "meat",
["countitem1"] = 1,
["item2"] = "blueberry",
["countitem2"] = 1,

}
Config.Recipe3 = { 
["item1"] = "meat",
["countitem1"] = 1,
["item2"] = "blueberry",
["countitem2"] = 1,
["item3"] = "carrots",
["countitem3"] = 1,
}
Config.Recipe4 = { 
["item1"] = "meat",
["countitem1"] = 1,
["item2"] = "blueberry",
["countitem2"] = 1,
["item3"] = "carrots",
["countitem3"] = 1,
["item4"] = "fish",
["countitem4"] = 1,
}

Config.Carthash = {
    ["Hunting"] = "WAGON05X",
    ["smalldelivery"] = "cart03",
    ["mediumdelivery"] = "wagon03x",
    ["largedelivery"] = "chuckwagon000x",
}

Config.materialtostock = {
    ["waittime"] = 600000, -- 10 minutes 
    ["rate"] = 10 -- 10 material to 10 stock 
}

Config.stewreset = 1800000 -- 30 minutes time for stew to reset to level 1 

Config.exptolevel = {
    ["waittime"] = 1800000, -- 30 minutes not recomended to make less than 10 minutes
    ["level2"] = 50, -- exp needed to reach level 2 
    ["level3"] = 250, -- exp needed to reach level 3  
    ["level4"] = 500, -- exp needed to reach level 4  
    ["level5"] = 750, -- exp needed to reach level 5 
    ["level6"] = 1000, -- exp needed to reach level 6  
    ["level7"] = 1500, -- exp needed to reach level 7  
    ["level8"] = 2000, -- exp needed to reach level 8  
    ["level9"] = 3000, -- exp needed to reach level 9  
    ["level10"] = 4500, -- exp needed to reach level 10 
}




Config.deliverymissionlocation = {
    ["first"] = {x=1519.17,y=419.98,z=89.96}, -- locations for mission, only takes 5 for now 
    ["second"] = {x=598.11,y=1663.87,z=186.72},
    ["third"] = {x=-1287.74,y=414.0,z=186.72},
    ["fourth"] = {x=-1084.51,y=-581.553,z=82.23},
    ["fifth"] = {x=-1149.8,y=-1910.46,z=42.69},
}
Config.payout = { -- cash payouts for mission 
    ["smalldelivery"] = 50,
    ["mediumdelivery"] = 100,
    ["largedelivery"] = 200,
}
Config.payoutxp = { -- exp payout for missions 
    ["smalldelivery"] = 25,
    ["mediumdelivery"] = 50,
    ["largedelivery"] = 100,
}

Config.clancountmultiplyer = { -- cash payout multiplyer based on clan member count 
    ["members2"] = 1.2,
    ["members3"] = 1.3,
    ["members4"] = 1.4,
    ["members5"] = 1.5,

}


Config.Animals = {
    -- Animals
    [-1124266369]  = {["name"] = "Bear",                      ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 957520252,    ["good"] = 143941906,    ["perfect"] = 1292673537 },
    [-15687816381] = {["name"] = "Big Horn Ram",              ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1796037447,   ["good"] = -476045512,   ["perfect"] = 1795984405 },
    [2028722809]   = {["name"] = "Boar",                      ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1248540072,   ["good"] = nil,          ["perfect"] = -1858513856 },
    [-1963605336]  = {["name"] = "Buck",                      ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1603936352,   ["good"] = -868657362,   ["perfect"] = -702790226 },
    [1556473961]   = {["name"] = "Bison",                     ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -1730060063,  ["good"] = -591117838,   ["perfect"] = -237756948 },
    [1957001316]   = {["name"] = "Bull",                      ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 9293261,      ["good"] = -336086818,   ["perfect"] = -53270317 },
    [1110710183]   = {["name"] = "Deer",                      ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -662178186,   ["good"] = -1827027577,  ["perfect"] = -1035515486 },
    [-1003616053]  = {["name"] = "Duck",                      ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1459778951]   = {["name"] = "Eagle",                     ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [831859211]    = {["name"] = "Egret",                     ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2021043433]  = {["name"] = "Elk",                       ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 2053771712,   ["good"] = 1181652728,   ["perfect"] = -1332163079 },
    [252669332]    = {["name"] = "American Red Fox",          ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1647012424,   ["good"] = 238733925,    ["perfect"] = 500722008 },
    [-1143398950]  = {["name"] = "Big Grey Wolf",             ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [-885451903]   = {["name"] = "Medium Grey Wolf",          ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [-829273561]   = {["name"] = "Small Grey Wolf",           ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 85441452,     ["good"] = 1145777975,   ["perfect"] = 653400939 },
    [1104697660]   = {["name"] = "Vulture",                   ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-407730502]   = {["name"] = "Snapping Turtle",           ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-466054788]   = {["name"] = "Wild Turkey",               ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2011226991]  = {["name"] = "Wild Turkey",               ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-166054593]   = {["name"] = "Wild Turkey",               ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-229688157]   = {["name"] = "Water Snake",               ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-229688157]   = {["name"] = "Water Snake",               ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1790499186]  = {["name"] = "Snake Red Boa",             ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1464167925]   = {["name"] = "Snake Fer-De-Lance",        ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [846659001]    = {["name"] = "Black-Tailed Rattlesnake",  ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [545068538]    = {["name"] = "Western Rattlesnake",       ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1211566332]  = {["name"] = "Striped Skunk",             ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [40345436]     = {["name"] = "Merino Sheep",              ["givenItem"] = "wool",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1729948479,   ["good"] = -1317365569,  ["perfect"] = 1466150167 },
    [-164963696]   = {["name"] = "Herring Seagull",           ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1076508705]  = {["name"] = "Roseate Spoonbill",         ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [2023522846]   = {["name"] = "Dominique Rooster",         ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-466687768]   = {["name"] = "Red-Footed Booby",          ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-575340245]   = {["name"] = "Wester Raven",              ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1458540991]   = {["name"] = "North American Racoon",     ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-541762431]   = {["name"] = "Black-Tailed Jackrabbit",   ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1755643085]   = {["name"] = "American Pronghorn Doe",    ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -983605026,   ["good"] = 554578289,    ["perfect"] = -1544126829 },
    [2079703102]   = {["name"] = "Greater Prairie Chicken",   ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1414989025]  = {["name"] = "Wirginia Possum",           ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1007418994]   = {["name"] = "Berkshire Pig",             ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -308965548,   ["good"] = -57190831,    ["perfect"] = -1102272634 },
    [1416324601]   = {["name"] = "Ring-Necked Pheasant",      ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1265966684]   = {["name"] = "American White Pelican",    ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1797450568]  = {["name"] = "Blue And Yellow Macaw",     ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1654513481]   = {["name"] = "Panther",                   ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1584468323,   ["good"] = -395646254,   ["perfect"] = 1969175294 },
    [1205982615]   = {["name"] = "Californian Condor",        ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2063183075]  = {["name"] = "Dominique Chicken",         ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2073130256]  = {["name"] = "Double-Crested Cormorant",  ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [90264823]     = {["name"] = "Cougar",                    ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1914602340,   ["good"] = 459744337,    ["perfect"] = -1791452194 },
    [-50684386]    = {["name"] = "Florida Cracker Cow",       ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 334093551,    ["good"] = 1150594075,   ["perfect"] = -845037222 },
    [480688259]    = {["name"] = "Coyote",                    ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -1558096473,  ["good"] = 1150939141,   ["perfect"] = -794277189 },
    [-564099192]   = {["name"] = "Whooping Crane",            ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },   
    [457416415]    = {["name"] = "Gila Monster",              ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-753902995]   = {["name"] = "Alpine Goat",               ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 699990316,    ["good"] = 1710714415,   ["perfect"] = -1648383828 },
    [723190474]    = {["name"] = "Canada Goose",              ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-2145890973]  = {["name"] = "Ferruinous Hawk",           ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1095117488]   = {["name"] = "Great Blue Heron",          ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1854059305]  = {["name"] = "Green Iguana",              ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-593056309]   = {["name"] = "Desert Iguana",             ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1751700893]   = {["name"] = "Peccary Pig",               ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -99092070,    ["good"] = -1379330323,  ["perfect"] = 1963510418 },
    [386506078]    = {["name"] = "Common Loon",               ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1098441944]  = {["name"] = "Moose",                     ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1868576868,   ["good"] = 1636891382,   ["perfect"] = -217731719 },
    [-1134449699]  = {["name"] = "American Muskrat",          ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-861544272]   = {["name"] = "Great Horned Owl",          ["givenItem"] = "feathers",  ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [556355544]    = {["name"] = "Angus Ox",                  ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 4623248928,   ["good"] = 1208128650,   ["perfect"] = 659601266 },
    [-1892280447]  = {["name"] = "Alligator",                 ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1806153689,   ["good"] = -802026654,   ["perfect"] = -1625078531 },
    [759906147]    = {["name"] = "North American Beaver",     ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = -1569450319,  ["good"] = -2059726619,  ["perfect"] = 854596618 },
    [730092646]    = {["name"] = "American Black Bear",       ["givenItem"] = "meat",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = 1083865179,   ["good"] = 1490032862,   ["perfect"] = 663376218 },
    -- Fish
    [-711779521]   = {["name"] = "Longnose Gar",              ["givenItem"] = "fish",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-1553593715]  = {["name"] = "Muskie",                    ["givenItem"] = "fish",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [-300867788]   = {["name"] = "Lake Sturgeon",             ["givenItem"] = "fish",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [1538187374]   = {["name"] = "Channel Catfish",           ["givenItem"] = "fish",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
    [697075200]    = {["name"] = "Northern Pike",             ["givenItem"] = "fish",      ["money"] = 3,  ["xp"] = 3,  ["poorQualityMultiplier"] = 1.0,  ["goodQualityMultiplier"] = 1.5,  ["perfectQualityMultiplier"] = 2,  ["poor"] = nil,          ["good"] = nil,          ["perfect"] = nil },
}


Config.weapons = {
	{hash = 0x772C8DD6},
	{hash = 0x169F59F7},
	{hash = 0xDB21AC8C},
	{hash = 0x6DFA071B},
	{hash = 0xF5175BA1},
	{hash = 0xD2718D48},
	{hash = 0x797FBF5},
	{hash = 0x772C8DD6},
	{hash = 0x7BBD1FF6},
	{hash = 0x63F46DE6},
	{hash = 0xA84762EC},
	{hash = 0xDDF7BC1E},
	{hash = 0x20D13FF},
	{hash = 0x1765A8F8},
	{hash = 0x657065D6},
	{hash = 0x8580C63E}, 
	{hash = 0x95B24592},       
	{hash = 0x31B7B9FE},       
	{hash = 0x88A8505C},       
	{hash = 0x1C02870C},       
	{hash = 0x28950C71},     
	{hash = 0x6DFA071B}
}
               
Config.models = {
	{hash = "MP_CHU_ROB_MILLESANI_MALES_01"},
	{hash = "AM_VALENTINEDOCTORS_FEMALES_01"},
	{hash = "A_F_M_ARMCHOLERACORPSE_01"},
	{hash = "A_F_M_ARMTOWNFOLK_01"},
	{hash = "A_F_M_ArmTownfolk_02"},
	{hash = "A_F_M_AsbTownfolk_01"},
	{hash = "A_F_M_BiVFancyTravellers_01"},
	{hash = "A_F_M_BlWTownfolk_01"},
	{hash = "A_F_M_BlWTownfolk_02"},
	{hash = "A_F_M_BlWUpperClass_01"},
	{hash = "A_F_M_BtcHillbilly_01"},
	{hash = "A_F_M_BTCObeseWomen_01"},
	{hash = "A_F_M_GuaTownfolk_01"},
	{hash = "A_F_M_LagTownfolk_01"},
	{hash = "A_F_M_LowerSDTownfolk_01"},
	{hash = "A_F_M_LowerSDTownfolk_02"},
	{hash = "A_F_M_LowerSDTownfolk_03"},
	{hash = "A_F_M_MiddleSDTownfolk_01"},
	{hash = "A_F_M_MiddleSDTownfolk_02"},
	{hash = "A_F_M_MiddleSDTownfolk_03"},
	{hash = "A_F_M_NbxSlums_01"},
	{hash = "A_F_M_NbxUpperClass_01"},
	{hash = "A_F_M_NbxWhore_01"},
	{hash = "A_F_M_RhdTownfolk_01"},
	{hash = "A_F_M_RhdTownfolk_02"},
	{hash = "A_F_M_ROUGHTRAVELLERS_01"},
	{hash = "A_F_M_SDChinatown_01"},
	{hash = "A_F_M_SDSlums_02"},
	{hash = "A_F_M_StrTownfolk_01"},
	{hash = "A_F_M_TumTownfolk_01"},
	{hash = "A_F_M_TumTownfolk_02"},
	{hash = "mp_dr_u_m_m_MISTAKENBOUNTIES_01"}
}


Config.Language = { -- space is very important
    ["NotHoldingAnimal"] = "You aren't holding an animal",
    ["NotInTheButcher"] = "I won't take that animal",
    ["AnimalSold"] = "You dropped off material",
    ["boughtwagon"] = "You bought a hunting wagon for your clan",
    ["boughtwagon2"] = "You bought a small delivery wagon for your clan",
    ["boughtwagon3"] = "You bought a medium delivery wagon for your clan",
    ["boughtwagon4"] = "You bought a large delivery wagon for your clan",
    ["rentwagon"] = "You Rented a hunting wagon",
    ["nocashinledger"] = "Not enough cash in camp ledger",
    ["buyhuntingcart"] = "Buy Hunting Cart:",
    ["renthuntingcart"] = "Rent Hunting Cart:",
    ["buysmalldelivery"] = "Buy Small Delivery Cart:",
    ["buymediumdelivery"] = "Buy Medium Delivery Cart:",
    ["buylargedelivery"] = "Buy Large Delivery Cart:",
    ["deliveryfinished"] = "You Delivered your stock and made ",
    ["clanfunds"] = " ,money is in your clan ledger",
    ["level"] = "Required camp level :",
    ["buytent1"] = "Buy tent 1:",
    ["buytent2"] = "Buy tent 2:",
    ["buytent3"] = "Buy tent 3:",
    ["buytent4"] = "Buy tent 4:",
    ["buytent5"] = "Buy tent 5:",
    ["buybutcher"] = "Buy Butcher Equipment :",
    ["fire"] = "Buy fire :",
    ["post"] = "Buy hitching post :",
    ["table"] = "Buy table :",
    ["invent"] = "Buy inventory box :",
    ["stew"] = "Buy stew pot :",
    ["chair"] = "Buy chair :",
    ["barrel"] = "Buy Moonshine Barrel :",
    ["destiller"] = "Buy Moonshine Destiller :",
    ["tipi"] = "Tipi :",
    ["tentu2"] = "Tent With Bed :",
    ["tentu3"] = "Cloth Tent :",
    ["tentu4"] = "Collector Tent :",
    ["tentu5"] = "Hunter Tent :",
    ["tentu6"] = "Bounty Hunter Tent :",
    ["flag"] = "You're placing a flag",
    ["clan"] = "You have created your clan",
    ["leaveclan"] = "You have to Disband/Leave your clan to create a new one",
    ["disband"] = "You are disbanding your clan",
    ["left"] = "You left your clan",
    ["name"] = "You updated your clan name",
    ["memebercap"] = "You cant have more than 5 clan members",
    ["invite"] = "You invited ",
    ["toyourclan"] = " to your clan",
    ["invited"] = "You were invited to ",
    ["already"] = " is already in a clan",
    ["leadership"] = "Gave away leadership to ",
    ["leader"] = "You are the new clan leader of ",
    ["notclan"] = " is not in your clan",
    ["dumb"] = "You cant kick yourself silly.",
    ["kicked"] = "You kicked ",
    ["registered"] = "You have registered your camp",
    ["License"] = "Camp License required to register camp",
    ["tooclose"] = "You are too close to another camp !",
    ["qt"] = "Invalid quantity",
    ["carry"] = "You cant carry more items",
    ["limit"] = "You reached the limit for this item",
    ["notenough"] = "You dont have enough ingredients",
    ["stewmade"] = "You cooked some stew",
}

Config.webhookLanguage = { -- the spaces are very important
    ["boughtwagon"] = "Clan leader bought a Hunting wagon upgrade for ",
    ["boughtwagon2"] = "Clan leader bought a small delivery wagon upgrade for ",
    ["boughtwagon3"] = "Clan leader bought a medium delivery wagon upgrade for ",
    ["boughtwagon4"] = "Clan leader bought a large delivery wagon upgrade for ",
    ["currentbalance"] = " $ current balance ",
    ["currency"] = " $",
    ["rentedcart"] = " rented a hunting wagon for ",
    ["delivery"] = "Delivered stock and made ",
    ["boughttent"] = "Clan leader bought a tent slot for ",
    ["fire"] = "Clan leader bought a camp fire for ",
    ["post"] = "Clan leader bought a hitching post for ",
    ["table"] = "Clan leader bought a table for ",
    ["boughtbutcher"] = "Clan leader bought butcher equipment for ",
    ["invent"] = "Clan leader bought an inventory for ",
    ["stew"] = "Clan leader bought a stew pot for ",
    ["chair"] = "Clan leader bought a chair for ",
    ["Barrel"] = "Clan leader bought a Moonshine Barrel for ",
    ["Destiller"] = "Clan leader bought a Moonshine Destiller for ",
    ["upgradetent"] = "Clan leader upgraded a tent slot for ",
}  