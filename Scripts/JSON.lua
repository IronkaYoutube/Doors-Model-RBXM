local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "JSON_ERROR",
    Title = "DISPLAY_ERR",
    Desc = "10010101010011100111110011101011111100010110100101010010100111110100101010",
    Reason = "DISPLAY_ERR",
    Image = "rbxassetid://3128134660"
}, {
    CheckOwned = true,
    Remember = false
})

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner/refs/heads/main/init.luau"))()

local MyEntity = Spawner:Create({
    Entity = {
        Name = "JSON",
        Asset = "https://github.com/AirSuper1/Doors-Model-RBXM/blob/main/Entity/Json.rbxm?raw=true",
        HeightOffset = 0
    },
    Movement = {
        Speed = 100,
        Delay = 2,
        Reversed = true
    },
    Damage = {
        Enabled = true,
		IgnoreHiding = false,
        Range = 40,
        Amount = 90
    },
    Rebounding = {
        Enabled = true,
        Type = "Blitz", -- "Blitz"
        Min = 5,
        Max = 7,
        Delay = 2
    },
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 3
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = true
    },
    CameraShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1}, -- Magnitude, Roughness, FadeIn, FadeOut
        Range = 100
    },
    Crucifixion = {
        Type = "Guiding", -- "Guiding"
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"It looks like you've stumbled upon JSON.", "It flies past several times...", "...Like Blitz", "Good Luck in next time"},
        Cause = "JSON"
    }
})

MyEntity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

MyEntity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)

MyEntity:SetCallback("OnEnterRoom", function(room: Model, firstTime: boolean)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)

MyEntity:SetCallback("OnLookAt", function(lineOfSight: boolean)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)

MyEntity:SetCallback("OnRebounding", function(startOfRebound: boolean)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)

MyEntity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)

MyEntity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)

MyEntity:SetCallback("OnDamagePlayer", function(newHealth: number)
	if newHealth <= 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)

MyEntity:Run(true) -- creates & runs a copy of your entity template