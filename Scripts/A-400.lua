local CustomAchievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"))()

CustomAchievements:Grant({
    Identifier = "A-400",
    Title = "Slower and slower and slower...",
    Desc = "Can you be faster?",
    Reason = "Encounter the A-400",
    Image = "rbxassetid://101721399126876"
}, {
    CheckOwned = true,
    Remember = false
})

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner/refs/heads/main/init.luau"))()

local MyEntity = Spawner:Create({
    Entity = {
        Name = "A-400",
        Asset = "https://github.com/AirSuper1/Doors-Model-RBXM/blob/main/Entity/A-400.rbxm?raw=true",
        HeightOffset = 0
    },
    Movement = {
        Speed = 50,
        Delay = 2,
        Reversed = true
    },
    Damage = {
        Enabled = true,
		IgnoreHiding = true,
        Range = 40,
        Amount = 80
    },
    Rebounding = {
        Enabled = true,
        Type = "Ambush", -- "Blitz"
        Min = 5,
        Max = 8,
        Delay = 2
    },
    Lights = {
        Flicker = {
            Enabled = true,
            Duration = 1
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
        Type = "Curious", -- "Curious"
        Hints = {"Oh...", "...Hello", "Oh, one of my favorites...", "..A-400", "Just hide from him somewhere else next time, okay?"},
        Cause = "A-400"
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
