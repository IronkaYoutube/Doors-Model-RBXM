local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner/refs/heads/main/init.luau"))

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