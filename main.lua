-- // Wellon Project | Main Logic Core
-- // Created by Wellon Dev Team | Mode: /unlock

local cloneref = (cloneref or clonereference or function(instance) return instance end)
local CoreGui = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))

-- [ СИСТЕМА CRACK/REBRAND ]
-- Эта функция принудительно меняет "Vellure" на "Wellon" во всех элементах
local function RebrandUI(obj)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
        -- Первичная замена
        if string.find(obj.Text, "Vellure") then
            obj.Text = string.gsub(obj.Text, "Vellure", "Wellon")
        end
        -- Слежка за изменениями (чтобы надпись не вернулась)
        obj:GetPropertyChangedSignal("Text"):Connect(function()
            if string.find(obj.Text, "Vellure") then
                obj.Text = string.gsub(obj.Text, "Vellure", "Wellon")
            end
        end)
    end
end

-- Мониторинг появления новых окон меню
CoreGui.DescendantAdded:Connect(RebrandUI)
for _, v in pairs(CoreGui:GetDescendants()) do
    RebrandUI(v)
end

-- [ ANTI-AFK ]
Players.LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- [ ТАБЛИЦА ИГР И ЗАГРУЗКА ]
local Wellon = {
    Files = {
        ["Bizzare Lineage"] = { File = "BA/Main.lua", CreatorId = 33161040 },
        ["A Universal Time"] = { File = "AUT/Main.lua", CreatorId = 6556072 },
        ["Sailor Piece"] = { File = "SP/Main.lua", CreatorId = 1002185259 }
    }
}

function Wellon:Initialize()
    local CID = game.CreatorId
    for Name, Data in pairs(self.Files) do
        if Data.CreatorId == CID then
            print("🚀 Wellon Injecting: " .. Name)
            
            -- Загрузка оригинального кода через твой перехватчик
            local Source = "https://raw.githubusercontent.com/NyxaSylph/Vellure/main/" .. Data.File
            local Success, Result = pcall(function()
                return loadstring(game:HttpGet(Source))()
            end)

            if not Success then
                warn("❌ Wellon Injection Failed: " .. tostring(Result))
            end
            return
        end
    end
    warn("❌ WELLON: UNSUPPORTED GAME")
end

-- Запуск
Wellon:Initialize()
return Wellon
