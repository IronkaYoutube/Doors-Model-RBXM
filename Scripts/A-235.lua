local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "A-235",
    Title = "Super-Sonic",
    Desc = "SOOOO FAST",
    Reason = "Encounter the A-235",
    Image = "rbxassetid://109914529126616"
}, {
    CheckOwned = true,
    Remember = false
})

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner/refs/heads/main/init.luau"))()

local MyEntity = Spawner:Create({
    Entity = {
        Name = "A-235",
        Asset = "https://github.com/AirSuper1/Doors-Model-RBXM/blob/main/Entity/A-235.rbxm?raw=true",
        HeightOffset = 0
    },
    Movement = {
        Speed = 275,
        Delay = 2,
        Reversed = false
    },
    Damage = {
        Enabled = true,
		IgnoreHiding = false,
        Range = 40,
        Amount = 235
    },
    Rebounding = {
        Enabled = false,
        Type = "Ambush", -- "Blitz"
        Min = 2,
        Max = 4,
        Delay = 2
    },
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 5
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = false
    },
    CameraShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1}, -- Magnitude, Roughness, FadeIn, FadeOut
        Range = 100
    },
    Crucifixion = {
        Type = "Curious", -- "Guiding"
        Enabled = true,
        Range = 40,
        Resist = true,
        Break = true
    },
    Death = {
        Type = "Guiding", -- "Curious"
        Hints = {"Um...", "I dont know...", "...What did you die of?", "I think he should be the one to deal with this."},
        Cause = "A-235"
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
