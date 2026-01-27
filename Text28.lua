-- ======================
-- SBS HUB COMPLETO FINAL
-- ======================
if not game:IsLoaded() then game.Loaded:Wait() end

-- ======================
-- SERVICIOS
-- ======================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ======================
-- CREAR GUI PRINCIPAL
-- ======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,500,0,350)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

-- ======================
-- DRAG GUI PRINCIPAL
-- ======================
do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

-- ======================
-- TITULO
-- ======================
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "SBS HUB | MURDER MISTERY 2"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center
title.Parent = mainFrame

local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.fromRGB(255,255,255)

-- ======================
-- FRAMES LATERALES
-- ======================
local leftFrame = Instance.new("Frame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local rightFrame = Instance.new("Frame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)

local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)

-- ======================
-- FUNCION CREAR BOTONES
-- ======================
local function createButton(parent,text,y,callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.BackgroundColor3 = Color3.fromRGB(20,20,20)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Text = text
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    b.Parent = parent
    b.MouseEnter:Connect(function() b.BackgroundColor3 = Color3.fromRGB(40,40,40) end)
    b.MouseLeave:Connect(function() b.BackgroundColor3 = Color3.fromRGB(20,20,20) end)
    b.MouseButton1Click:Connect(callback)
end

-- ======================
-- MENUS Y BOTONES
-- ======================
local menuOrder = {"MAIN","ESP","INOCENT","SHERIFF","MURDER","TRAPS","COINS","YOUTUBE"}
local menuData = {
    ["MAIN"] = {"DESYNC","LOCALPLAYER","INVISIBLE","SEGUNDA OPORTUNIDAD","X-RAY"},
    ["ESP"] = {"ESP INOCENT","ESP SHERIFF","ESP MURDER","ESP GUNDROP"},
    ["INOCENT"] = {"GRAB GUN","AUTO GRAB GUN"},
    ["SHERIFF"] = {"Shoot Murderer","MOVE GUI"},
    ["MURDER"] = {"KILL GUI","KNIFE REACH"},
    ["TRAPS"] = {"ESP TRAPS","ESP TEXT A TRAPS","ANTI TRAPS"},
    ["COINS"] = {"AUTO COLLECT COINS","ESP COINS"},
    ["YOUTUBE"] = {"YOUTUBE:SBS HUB","SUSCRIBETE:)"}
}

local function clearFrame(frame)
    for _, v in pairs(frame:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

for _, menu in ipairs(menuOrder) do
    createButton(leftFrame, menu, 10 + (_-1)*35, function()
        clearFrame(rightFrame)

        local titleLabel = Instance.new("TextLabel", rightFrame)
        titleLabel.Size = UDim2.new(1,0,0,30)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18

        local oy = 40
        for _, opt in ipairs(menuData[menu]) do
            createButton(rightFrame,opt,oy,function()
                -- MAIN
                if menu == "MAIN" then
                    if opt == "DESYNC" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text24/refs/heads/main/Text23.lua",true))()
                    elseif opt == "LOCALPLAYER" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua",true))()
                    elseif opt == "INVISIBLE" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text25/refs/heads/main/Text25.lua",true))()
                    elseif opt == "SEGUNDA OPORTUNIDAD" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text26/refs/heads/main/Text26.lua",true))()
                    elseif opt == "X-RAY" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua", true))()
                    end

                -- INOCENT
                elseif menu == "INOCENT" then
                    if opt == "GRAB GUN" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text152/refs/heads/main/Text152.lua", true))()
                    elseif opt == "AUTO GRAB GUN" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text153/refs/heads/main/Text153.lua", true))()
                    end

                -- SHERIFF
                elseif menu == "SHERIFF" then
                    if opt == "Shoot Murderer" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text27/refs/heads/main/Text27.lua",true))()
                    elseif opt == "MOVE GUI" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text146/refs/heads/main/Text146.lua", true))()
                    end

                -- MURDER
                elseif menu == "MURDER" then
                    if opt == "KILL GUI" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua",true))()
                    elseif opt == "KNIFE REACH" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text23/refs/heads/main/Text23",true))()
                    end

                -- TRAPS
                elseif menu == "TRAPS" then
                    if opt == "ESP TRAPS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text149/refs/heads/main/Text149.lua", true))()
                    elseif opt == "ESP TEXT A TRAPS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text150/refs/heads/main/Text150.lua", true))()
                    elseif opt == "ANTI TRAPS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text151/refs/heads/main/Text151.lua", true))()
                    end

                -- COINS
                elseif menu == "COINS" then
                    if opt == "AUTO COLLECT COINS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text22/refs/heads/main/Text22.lua",true))()
                    elseif opt == "ESP COINS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua", true))()
                    end

                -- ESP
                elseif menu == "ESP" then
                    if opt == "ESP INOCENT" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text154/refs/heads/main/Text154.lua", true))()
                    elseif opt == "ESP SHERIFF" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text155/refs/heads/main/Text155.lua", true))()
                    elseif opt == "ESP MURDER" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text156/refs/heads/main/Text156.lua", true))()
                    elseif opt == "ESP GUNDROP" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text157/refs/heads/main/Text157.lua", true))()
                    end

                -- YOUTUBE
                elseif menu == "YOUTUBE" then
                    -- no cambios
                end
            end)
            oy = oy + 40
        end
    end)
end

-- ======================
-- ICONO SBS PARA ABRIR/CERRAR (MOVIBLE)
-- ======================
local toggle = Instance.new("TextButton", screenGui)
toggle.Size = UDim2.new(0,60,0,60)
toggle.Position = UDim2.new(1,-80,0,20)
toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)
toggle.Text = "SBS"
toggle.TextColor3 = Color3.fromRGB(255,255,255)
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 24
toggle.BorderSizePixel = 0
toggle.Parent = screenGui

local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.3,0)

-- Drag para el botón SBS
do
    local dragging, dragStart, startPos, dragInput
    local function update(input)
        local delta = input.Position - dragStart
        toggle.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    toggle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = toggle.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    toggle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then update(input) end
    end)
end

local open = true
toggle.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
end)
