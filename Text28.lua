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
-- VARIABLES GENERALES
-- ======================
-- GunDrop
local gunESP = false
local grabGun = false
local GUN_NAME = "GunDrop"
local gunColor = Color3.fromRGB(255,255,0)
local gunOrigin = nil
local grabbed = false

-- Murder ESP
local espSheriff = false
local espInnocent = false
local espMurder = false

-- Coin ESP
local coinESP = false
local coinHighlights = {}
local coinName = "coin"

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
local menuOrder = {"MAIN","INNOCENTE","SHERIFF","COIN","MURDER","YOUTUBE"}
local menuData = {
    ["MAIN"] = {"DESYNC","LOCALPLAYER","INVISIBLE","SEGUNDA OPORTUNIDAD"},
    ["INNOCENTE"] = {"ESP GUN","GRAB GUN"},
    ["SHERIFF"] = {"Shoot Murderer","ESP Murder"},
    ["COIN"] = {"AUTO COLLECT COINS","ESP COIN"},
    ["MURDER"] = {"KILL GUI","ESP SHERIFF","ESP INNOCENT","KNIFE REACH"},
    ["YOUTUBE"] = {"YOUTUBE:SEBAS SCRIPT","SUSCRIBETE:)"}
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
                    end

                -- INNOCENTE
                elseif menu == "INNOCENTE" then
                    if opt == "ESP GUN" then
                        gunESP = not gunESP
                    elseif opt == "GRAB GUN" then
                        grabGun = not grabGun
                    end

                -- SHERIFF
                elseif menu == "SHERIFF" then
                    if opt == "Shoot Murderer" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text27/refs/heads/main/Text27.lua",true))()
                    elseif opt == "ESP Murder" then
                        espMurder = not espMurder
                    end

                -- COIN
                elseif menu == "COIN" then
                    if opt == "AUTO COLLECT COINS" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text22/refs/heads/main/Text22.lua",true))()
                    elseif opt == "ESP COIN" then
                        coinESP = not coinESP
                    end

                -- MURDER
                elseif menu == "MURDER" then
                    if opt == "KILL GUI" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua",true))()
                    elseif opt == "ESP SHERIFF" then
                        espSheriff = not espSheriff
                    elseif opt == "ESP INNOCENT" then
                        espInnocent = not espInnocent
                    elseif opt == "KNIFE REACH" then
                        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text23/refs/heads/main/Text23",true))()
                    end
                end
            end)
            oy = oy + 40
        end
    end)
end

-- ======================
-- ICONO SBS PARA ABRIR/CERRAR
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

local corner = Instance.new("UICorner", toggle)
corner.CornerRadius = UDim.new(0.3,0)

local open = true
toggle.MouseButton1Click:Connect(function()
    open = not open
    mainFrame.Visible = open
end)

-- ======================
-- LOOP PRINCIPAL ESP + GUN + COINS
-- ======================
task.spawn(function()
    while task.wait(0.3) do
        -- Gun ESP / Grab
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj.Name == GUN_NAME and obj:IsA("BasePart") then
                if gunESP then
                    if not obj:FindFirstChild("ESP") then
                        local hl = Instance.new("Highlight")
                        hl.Name = "ESP"
                        hl.FillColor = gunColor
                        hl.OutlineColor = gunColor
                        hl.Adornee = obj
                        hl.Parent = obj
                    end
                end
                if grabGun and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and not grabbed then
                    grabbed = true
                    gunOrigin = LocalPlayer.Character.HumanoidRootPart.CFrame
                    TweenService:Create(
                        LocalPlayer.Character.HumanoidRootPart,
                        TweenInfo.new(0.25),
                        {CFrame = obj.CFrame + Vector3.new(0,2,0)}
                    ):Play()
                end
            end
        end
        if grabGun == false and grabbed and gunOrigin then
            TweenService:Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.25), {CFrame = gunOrigin}):Play()
            grabbed = false
            gunOrigin = nil
        end

        -- Coin ESP
        if coinESP then
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find(coinName) then
                    if not coinHighlights[obj] then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = obj
                        hl.FillColor = Color3.fromRGB(255,215,0)
                        hl.FillTransparency = 0.5
                        hl.OutlineColor = Color3.fromRGB(255,200,0)
                        hl.OutlineTransparency = 0
                        hl.Parent = obj
                        coinHighlights[obj] = hl
                    end
                end
            end
            for coin, hl in pairs(coinHighlights) do
                if not coin or not coin.Parent then
                    hl:Destroy()
                    coinHighlights[coin] = nil
                end
            end
        end

        -- ======================
        -- ESP ROLES
        -- ======================
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                if player.Character.Humanoid.Health <= 0 then
                    local h = player.Character:FindFirstChild("RoleESP")
                    if h then h:Destroy() end
                else
                    local function applyRoleESP(role,active,color)
                        if active then
                            local h = player.Character:FindFirstChild("RoleESP")
                            if not h then
                                h = Instance.new("Highlight")
                                h.Name = "RoleESP"
                                h.Adornee = player.Character
                                h.Parent = player.Character
                            end
                            h.FillColor = color
                            h.OutlineColor = color
                        else
                            local h = player.Character:FindFirstChild("RoleESP")
                            if h then h:Destroy() end
                        end
                    end

                    local role = (function()
                        local function hasTool(toolNames)
                            if player.Character then
                                for _, t in ipairs(player.Character:GetChildren()) do
                                    if t:IsA("Tool") and table.find(toolNames,t.Name) then return true end
                                end
                            end
                            local backpack = player:FindFirstChild("Backpack")
                            if backpack then
                                for _, t in ipairs(backpack:GetChildren()) do
                                    if t:IsA("Tool") and table.find(toolNames,t.Name) then return true end
                                end
                            end
                            return nil
                        end
                        if hasTool({"Knife"}) then return "Murder"
                        elseif hasTool({"Gun","Pistol"}) then return "Sheriff"
                        else return "Innocent"
                        end
                    end)()

                    if role == "Sheriff" then applyRoleESP(role,espSheriff,Color3.fromRGB(0,0,255))
                    elseif role == "Murder" then applyRoleESP(role,espMurder,Color3.fromRGB(255,0,0))
                    elseif role == "Innocent" then applyRoleESP(role,espInnocent,Color3.fromRGB(0,255,0))
                    end
                end
            end
        end
    end
end)
