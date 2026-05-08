-- // Wellon Project | Universal Loader
-- // Mode: /unlock

local Success, Error = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/ТВОЙ_GITHUB/Wellon/main/Main.lua"))()
end)

if not Success then
    warn("❌ Wellon Boot Error: " .. tostring(Error))
end
