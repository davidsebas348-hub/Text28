-- ======================
-- SBS HUB COMPLETO FINAL (FIX TOTAL)
-- ======================
repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local buttonStates = {}
-- BOTONES QUE NO SERAN TOGLE
local noToggleButtons = {
    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["Gaze Emote"] = true,
    ["LOCALPLAYER"] = true,
    ["INVISIBLE"] = true,
    ["DESYNC"] = true,
    ["HITBOX EXTENDER"] = true,
    ["FULL BRIGHT"] = true,
    ["GRAB GUN (TELEPORT)"] = true,
    ["ELIGIR ANIMACIÓN (CÓDIGO)"] = true,
    ["ELIGIR ANIMACIÓN"] = true,
    ["TP A MAP"] = true,
    ["TP A LOBBY"] = true,
    ["TP AEL MURDERER"] = true,
    ["TP AEL SHERIFF"] = true,
    ["AUTO COLLECT COINS"] = true,
    ["SHOOT MURDERER"] = true,
    ["FE FLING GUI"] = true,
    ["Fling Sheriff"] = true,
    ["Fling Murderer"] = true,
    ["Gaze Emote"] = true,
}
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0,500,0,350)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
local stroke = Instance.new("UIStroke", mainFrame)
stroke.Color = Color3.fromRGB(255,255,255)
stroke.Thickness = 2

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

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "SBS HUB | MURDER MISTERY 2"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.fromRGB(255,255,255)

local leftFrame = Instance.new("ScrollingFrame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
leftFrame.BorderSizePixel = 0
leftFrame.ScrollBarThickness = 6
leftFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
local rightFrame = Instance.new("ScrollingFrame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
rightFrame.BorderSizePixel = 0
local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)

local function createMenuButton(parent,text,y,callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(15,15,15)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    
    b.MouseButton1Click:Connect(callback)
end

local function createButton(parent,text,y,callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1,-20,0,30)
    b.Position = UDim2.new(0,10,0,y)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.BorderSizePixel = 0
    
    local isToggle = not noToggleButtons[text]
    
    if isToggle then
        
        if buttonStates[text] == nil then
            buttonStates[text] = false
        end
        
        local function updateVisual()
            if buttonStates[text] then
                b.Text = text .. "  [ON]"
                b.BackgroundColor3 = Color3.fromRGB(0,120,0)
            else
                b.Text = text .. "  [OFF]"
                b.BackgroundColor3 = Color3.fromRGB(20,20,20)
            end
        end
        
        updateVisual()
        
        b.MouseButton1Click:Connect(function()
            buttonStates[text] = not buttonStates[text]
            updateVisual()
            callback(buttonStates[text]) -- manda true o false
        end)
        
    else
        b.Text = text
        b.BackgroundColor3 = Color3.fromRGB(20,20,20)
        
        b.MouseButton1Click:Connect(function()
            callback()
        end)
    end
end
-- ======================
-- SCROLL POR SUBMENU
-- ======================
local scrollConfig = {
    ["MAIN"] = true,
    ["ESP"] = true,
    ["INOCENT"] = false,
    ["MURDERER"] = true,
    ["SHERIFF"] = true,
    ["COINS"] = false,
    ["TRAPS"] = false,
    ["TELEPORT"] = false,
    ["FAKEBOMB"] = false,
    ["PACK ANIMATION"] = true,
    ["EMOTES"] = false,
    ["FLING"] = false,
    ["ANTIS"] = false,
    ["Fps"] = false,
    ["YOUTUBE"] = false
}
-- ======================
-- MENUS
-- ======================
local menuOrder = {"MAIN","ESP","INOCENT","MURDERER","SHERIFF","COINS","TRAPS","TELEPORT","FAKEBOMB","PACK ANIMATION","EMOTES","FLING","Fps","YOUTUBE"}
local menuData = {
    ["MAIN"] = {
        "LOCALPLAYER",
        "DESYNC",
        "INVISIBLE",
        "FULL BRIGHT",
        "ROUND TIMER",
        "SECOND LIFE",
        "X-RAY",
        
    },
    ["MURDERER"] = {
        "AUTO THROW KNIFE",
        "AUTO THROW KNIFE (KILL)",
        "HITBOX EXTENDER",
        "Kill Gui",
        "Auto Kill sheriffs"
    },
    ["ESP"] = {
        "ESP MURDERER",
        "ESP INOCENT",
        "ESP SHERIFF",
        "ESP GUNDROP",
        "ESP BOTTOM TRACERS",
        "ESP TOP TRACERS",
        "ESP DISTANCE"
    },
    ["INOCENT"] = {
        "GRAB GUN (TELEPORT)",
        "AUTO GRAB GUN (OP)"
    },   
    ["TELEPORT"] = {
        "TP A MAP",
        "TP A LOBBY",
        "TP AEL MURDERER",
        "TP AEL SHERIFF",
        "TP TOOL",
        "TP A PLAYERS (GUI)"
    },
    ["SHERIFF"] = {
        "SHOOT MURDERER",
        "SHOOT MURDERER (BUTTON)",
        "AUTO SHOOT MURDERER"
    },
    ["EMOTES"] = {
        "Gaze Emote",
        "FAKE DIE (GUI)",
        "SEMI-INVISIBLE"
    },
    ["TRAPS"] = {
        "ANTI TRAPS",
        "ESP BOX A TRAPS",
        "ESP TEXT A TRAPS",
        "ESP TRACERS A TRAPS",
        "TRAP PLAYERS (BUTTON)"
    },
    ["COINS"] = {
        "AUTO COLLECT COINS",
        "ESP COINS"
    },
    ["FAKEBOMB"] = {
        "AUTO DOBLE JUMP",
        "AUTO DOBLE JUMP (FAST)",
        "MODIFICAR JUMP POWER",
        "AUTO EQUIP FAKE BOMB"
    },
    ["PACK ANIMATION"] = {
        "ELIGIR ANIMACIÓN",
        "ELIGIR ANIMACIÓN (CÓDIGO)"
    },
    ["FLING"] = {
        "Touch Fling",
        "Fuerza de el Touch Fling",
        "Anti Fling",
        "FE FLING GUI",
        "Fling Sheriff",
        "Fling Murderer"
    },
    ["Fps"] = {
        "Fps Boost"
    },
    ["YOUTUBE"] = {
        "YOUTUBE:SBS HUB",
        "SUSCRIBETE:)"
    }
}

local function clearFrame(frame)
    for _,v in pairs(frame:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
    frame.CanvasPosition = Vector2.new(0,0)
end

for i,menu in ipairs(menuOrder) do
    createMenuButton(leftFrame, menu, 10+(i-1)*35, function()
        clearFrame(rightFrame)
        -- aplicar scroll SOLO a este submenu
        if scrollConfig[menu] then
            rightFrame.ScrollBarThickness = 6
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        else
            rightFrame.ScrollBarThickness = 0
            rightFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
            rightFrame.CanvasSize = UDim2.new(0,0,0,0)
        end
        local titleLabel = Instance.new("TextLabel", rightFrame)
        titleLabel.Size = UDim2.new(1,0,0,30)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18
        local oy = 40
        for _,opt in ipairs(menuData[menu]) do
    createButton(rightFrame,opt,oy,function(state)
                -- BOTONES CON SU FUNCION
                 if opt == "ESP INOCENT" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text154/refs/heads/main/Text154.lua"))()
                    elseif opt == "ESP MURDERER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text156/refs/heads/main/Text156.lua"))()
                    elseif opt == "ESP SHERIFF" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text155/refs/heads/main/Text155.lua"))()
                    elseif opt == "ESP GUNDROP" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text157/refs/heads/main/Text157.lua"))()
                    elseif opt == "ESP BOTTOM TRACERS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text311/refs/heads/main/Text311.lua"))()
                    elseif opt == "ESP TOP TRACERS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text312/refs/heads/main/Text312.lua"))()
                    elseif opt == "ESP DISTANCE" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text313/refs/heads/main/Text313.lua"))()
                    elseif opt == "SHOOT MURDERER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text314/refs/heads/main/Text314.lua"))()
                    elseif opt == "SHOOT MURDERER (BUTTON)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text27/refs/heads/main/Text27.lua"))()
                elseif opt == "AUTO SHOOT MURDERER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text146/refs/heads/main/Text146.lua"))()
                elseif opt == "Kill Gui" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua"))()
                elseif opt == "HITBOX EXTENDER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Hitbox-extender-/refs/heads/main/Hitbox%20extender"))()
                elseif opt == "AUTO THROW KNIFE" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text315/refs/heads/main/Text315.lua"))()
                    elseif opt == "AUTO THROW KNIFE (KILL)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text23/refs/heads/main/Text23"))()
                elseif opt == "Auto Kill sheriffs" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text316/refs/heads/main/Text316.lua"))()
                elseif opt == "ROUND TIMER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text317/refs/heads/main/Text317.lua"))()
                elseif opt == "GRAB GUN (TELEPORT)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text152/refs/heads/main/Text152.lua"))()
                elseif opt == "AUTO GRAB GUN (OP)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text153/refs/heads/main/Text153.lua"))()
                elseif opt == "INVISIBLE" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text25/refs/heads/main/Text25.lua",true))()
                elseif opt == "DESYNC" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text24/refs/heads/main/Text23.lua",true))()
                elseif opt == "FULL BRIGHT" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text279/refs/heads/main/Text279.lua"))()
                elseif opt == "Anti Fling" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text280/refs/heads/main/Text280.lua"))()
                elseif opt == "Touch Fling" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text281/refs/heads/main/Text281.lua"))()
                elseif opt == "Fuerza de el Touch Fling" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text282/refs/heads/main/Text282.lua"))()
                elseif opt == "Fps Boost" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"))()
                elseif opt == "AUTO DOBLE JUMP" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text318/refs/heads/main/Text318.lua"))()
                elseif opt == "AUTO DOBLE JUMP (FAST)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text319/refs/heads/main/Text319.lua"))()
                elseif opt == "MODIFICAR JUMP POWER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text320/refs/heads/main/Text320.lua"))()
                elseif opt == "AUTO EQUIP FAKE BOMB" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text321/refs/heads/main/Text321.lua"))()
                elseif opt == "ELIGIR ANIMACIÓN (CÓDIGO)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text325/refs/heads/main/Text325.lua"))()
                elseif opt == "ELIGIR ANIMACIÓN" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Editor-de-pack-de-animaci-n-/refs/heads/main/Pack%20Animation.lua"))()
                elseif opt == "ESP BOX A TRAPS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text149/refs/heads/main/Text149.lua"))()
                elseif opt == "TP A MAP" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text326/refs/heads/main/Text326.lua"))()
                elseif opt == "TP A LOBBY" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text327/refs/heads/main/Text327.lua"))()
                elseif opt == "TP AEL MURDERER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text328/refs/heads/main/Text328.lua"))()
                elseif opt == "TP AEL SHERIFF" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text329/refs/heads/main/Text329.lua"))()
                    elseif opt == "TP A PLAYERS (GUI)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text330/refs/heads/main/Text330.lua"))()
                    elseif opt == "TP TOOL" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"))()
                    elseif opt == "ESP TEXT A TRAPS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text150/refs/heads/main/Text150.lua"))()
                    elseif opt == "ANTI TRAPS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text151/refs/heads/main/Text151.lua"))()
                    elseif opt == "ESP TRACERS A TRAPS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text332/refs/heads/main/Text332.lua"))()
                    elseif opt == "TRAP PLAYERS (BUTTON)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text333/refs/heads/main/Text333.lua"))()
                    elseif opt == "AUTO COLLECT COINS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text22/refs/heads/main/Text22.lua"))()
                    elseif opt == "ESP COINS" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text148/refs/heads/main/Text148.lua"))()
                    elseif opt == "FAKE DIE (GUI)" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text334/refs/heads/main/Text334.lua"))()
                elseif opt == "LOCALPLAYER" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"))()
                elseif opt == "SEMI-INVISIBLE" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text335/refs/heads/main/Text335.lua"))()
                elseif opt == "SECOND LIFE" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text26/refs/heads/main/Text26.lua"))()
                elseif opt == "X-RAY" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"))()    
                elseif opt == "Fling Sheriff" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text361/refs/heads/main/Text361.lua"))()
                elseif opt == "Fling Murderer" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text360/refs/heads/main/Text360.lua"))()
                elseif opt == "FE FLING GUI" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fling-Fe/refs/heads/main/FlingFeGui"))()     
                elseif opt == "Gaze Emote" then
                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gaze-emote-74592"))()          
                end
            end)
            oy += 40
        end
    end)
end
-- ICONO SBS PARA ABRIR/CERRAR (MOVIBLE)
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
