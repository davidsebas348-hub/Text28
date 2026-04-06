loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text155/refs/heads/main/Text155.lua"))() -- Detectar Rol (importante)
                            
-- ======================
-- SBS HUB COMPLETO FINAL  (Pistol Arena
-- ======================
repeat task.wait() until game:IsLoaded()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
screenGui.DisplayOrder = 999999
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- poner nombre de textobox que queremos que solo se ponga números
local numericBoxes = {
    ["SPEED"] = true,
    ["JUMPPOWER"] = true,
    ["GRAVITY"] = true,
    ["RANGE"] = true,
    ["SIZE"] = true,
    ["FLY SPEED"] = true,
    ["TRASPARENCY 0-1"] = true,
    ["FOV SIZE"] = true,
    ["BULLET SIZE"] = true,
}
-- tener 2 botones en una ocupando espacio de 1 botón 
local doubleButtons = {
    ["MAP"] = "LOBBY",
    ["PLAYER NAME"] = "TP TO PLAYER"
}

-- poner título arriba de tal botón 
local topTitles = {
    ["SPEED"] = "MOVEMENT SETTINGS",
    ["TRASPARENCY 0-"] = "OP",
}

-- poner títulos abajo de tal botón
local customTitles = {
    ["SPED"] = "MOVEMENT SETTINGS",
    ["TRASPARENCY 0-1"] = "OP",
    ["ESP NAE"] = "ESP VISUAL",
}

-- cambiar el nombre de los Titulos de las secciones 
local menuNames = {
    ["MAI"] = "PLAYER MENU",
    ["COMBAT"] = "FIGHT SYSTEM",
    ["ESP"] = "VISUALS",
    ["TELEPORT"] = "TELEPORTS",
}

-- ======================
-- 🔥 MULTI BUTTON CONFIG
-- ======================

local multiButtons = {
    [""] = { 
        variable = "",
        options = {
            {name = "BLACK", color = Color3.fromRGB(0, 0, 0)},
        }
    },

    -- puedes meter 30+ aquí sin problema
}

-- ======================
-- CONFIG GLOBAL BOTONES (FALTABA ESTO)
-- ======================

local BUTTON_SIZE = UDim2.new(1, -20, 0, 30)

local BUTTON_OFFSET_X = 10
local BUTTON_GLOBAL_X = 0
local BUTTON_GLOBAL_Y = 0

-- ======================
-- CONFIG PERSONAL POR BOTÓN
-- ======================

local BUTTON_CUSTOM = {
    ["RANGE"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["SIZ"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["BULLET TRACERS"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["COLOR OF THE ESP"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },
    
    ["BULLET SIZE."] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -6
    },

    ["TRASPARENCY 0-"] = {
        size = UDim2.new(1, -50, 0, 27),
        x = 20,
        y = -9 
    }
}

-- TITULOS ARRIBA DE BOTONES (titulos simples)
local buttonTitles = {
    ["SPED"] = "PLAYER",
    ["AUTO DESTROY TO ALL OBJECTS"] = "TROLL",
    ["JUMP(BUTTON)"] = "JUMP PAD",

    ["TP TOOL"] = "CLICK TP",
    ["MAP"] = "GAME",
    ["PLAYER NAME"] = "PLAYERS",
    

    ["AIMBOT LIGERO"] = "AIM",
    ["AUTO SHOOT PLAYERS"] = "TROLL",
    
    ["ESP TO ALL ALARMS"] = "END",
    ["ESP TO ALL THE TOKEN"] = "ITEMS",
    ["ESP ENEMIES"] = "ENEMIES",
    ["ESP PLAYERS + NAME + DISTANCE"] = "PLAYERS",

    ["AUTO EAT"] = "EAT",
    ["SELF-HEALING"] = "HEALTH",
    [""] = "ENEMIES",
    [""] = "PLAYERS",

    ["HITBOX EXTENDER"] = "HITBOX",
    ["AUTO KILL ENEMIES"] = "KILL",
    ["MULTIPLY DAMAGE"] = "DAMAGE MULTIPLIER",
    ["INFINITY AMMO"] = "MODIFY GUNS",
    ["INSTANT SWING"] = "MESH WEAPON MODIFICATIONS",

    ["NAME OF THE ITEM"] = "BRING",
    ["NAME OF THE ITEM."] = "GRAB",
    
    ["Fps Boost"] = "PERFORMANCE"
}
-- togle v2
local redToggleButtons = {
    ["X-RAY"] = true,
    ["BULLET TRACERS"] = true,
}

getgenv().SBS_BUTTON_STATES = getgenv().SBS_BUTTON_STATES or {}
local buttonStates = getgenv().SBS_BUTTON_STATES
-- BOTONES QUE NO SERAN TOGLE
local noToggleButtons = {
    ["YOUTUBE:SBS HUB"] = true,
    ["SUSCRIBETE:)"] = true,
    ["SILENT AIM"] = true,
    ["LOCALPLAYER"] = true,
    ["RESET STATS"] = true,
    ["DESNC"] = true,
    ["Fps Boost"] = true,
    ["LOBBY"] = true,
    ["MAP"] = true,
    ["BULLET SIZE"] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,  
    [""] = true,
    [""] = true,
    [""] = true,
    [""] = true,
    ["BULLET TRACERS"] = true,
    ["TP TO PLAYER"] = true,  
}

-- BOTONES SIN EFECTO VERDE
local noGreenFlash = {
    ["SUSCRIBETE:)"] = true
}

local textboxButtons = {
    ["SPEED"] = {
        variable = "SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Speed/refs/heads/main/Speed.lua"
    },

    ["BULLET SPEED"] = {
        variable = "BULLET_SPEED",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text397/refs/heads/main/Text397.lua"
    },

    ["BULLETSPERSHOT"] = {
        variable = "BULLETS_PER_SHOT",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Text398/refs/heads/main/Text398.lua"
    },

    ["JUMPPOWER"] = {
        variable = "JUMP",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/JumpPower/refs/heads/main/JumpPower.lua"
    },

    ["GRAVITY"] = {
        variable = "GRAVITY",
        url = "https://raw.githubusercontent.com/davidsebas348-hub/Gravity/refs/heads/main/Gravity.lua"
    },

    ["FLY SPEED"] = {
    variable = "FLY_SPEED",
    url = nil
    },
    ["SIZE"] = {
    variable = "HITBOX_SIZE",
    url = nil
    },
    ["PLAYER NAME"] = {
    variable = "PLAYER",
    url = nil
    },
    ["TRASPARENCY 0-1"] = {
    variable = "HITBOX_TRANSPARENCY",
    url = nil
    },
    ["NAME OF THE ITEM"] = {
    variable = "FIND_TOOL",
    url = nil
    },
    ["FOV SIZE"] = {
    variable = "AIMBOT_FOV",
    url = nil
    },
    ["BULLET SIZE"] = {
    variable = "BULLET_SIZE",
    url = "https://raw.githubusercontent.com/davidsebas348-hub/Text433/refs/heads/main/Text433.lua"
    },
    ["XRAY-TRANSPARENCY"] = {
    variable = "XRAY_TRANSPARENCY",
    url = "https://raw.githubusercontent.com/davidsebas348-hub/Text433/refs/heads/main/Text433.lua"
    },
    ["RANGE"] = {
    variable = "RANGE",
    url = nil
}
}
local old = PlayerGui:FindFirstChild("SBS_HUB")
if old then
    old:Destroy()
end
screenGui.Name = "SBS_HUB"
screenGui.ResetOnSpawn = false
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0,500,0,350)
mainFrame.Position = UDim2.new(0.5,-250,0.5,-175)
mainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = false

-- ======================
-- RESIZE CORNER
-- ======================
local resizeCorner = Instance.new("Frame", mainFrame)
resizeCorner.Size = UDim2.new(0,20,0,20)
resizeCorner.Position = UDim2.new(1,-20,1,-20)
resizeCorner.BackgroundTransparency = 0.5
resizeCorner.BackgroundColor3 = Color3.fromRGB(255,255,255)
resizeCorner.BorderSizePixel = 0
resizeCorner.ZIndex = 10

-- ======================
-- RESIZE LOGIC
-- ======================
do
    local dragging, dragStart, startSize
    local function updateSize(input)
        local delta = input.Position - dragStart
        local newWidth = math.max(100, startSize.X + delta.X) -- mínimo ancho 100
        local newHeight = math.max(100, startSize.Y + delta.Y) -- mínimo alto 100
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
    resizeCorner.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startSize = Vector2.new(mainFrame.AbsoluteSize.X, mainFrame.AbsoluteSize.Y)
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            updateSize(input)
        end
    end)
end


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
title.Text = "SBS HUB | Pistol Arena"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
local line = Instance.new("Frame", mainFrame)
line.Size = UDim2.new(1,0,0,2)
line.Position = UDim2.new(0,0,0,50)
line.BackgroundColor3 = Color3.new(1,1,1)
line.BackgroundTransparency = 0

local rightFrame = Instance.new("ScrollingFrame", mainFrame)
rightFrame.Size = UDim2.new(1,-150,1,-52)
rightFrame.Position = UDim2.new(0,150,0,52)
rightFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
rightFrame.BorderSizePixel = 0

local leftFrame = Instance.new("ScrollingFrame", mainFrame)
leftFrame.Size = UDim2.new(0,150,1,-52)
leftFrame.Position = UDim2.new(0,0,0,52)
leftFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
leftFrame.BorderSizePixel = 0
leftFrame.ScrollBarThickness = 6
leftFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

-- ✅ AHORA SÍ (AQUÍ)
local padding = Instance.new("UIPadding", rightFrame)
padding.PaddingBottom = UDim.new(0,50)



local midLine = Instance.new("Frame", mainFrame)
midLine.Size = UDim2.new(0,2,1,-52)
midLine.Position = UDim2.new(0,150,0,52)
midLine.BackgroundColor3 = Color3.fromRGB(255,255,255)


-- ======================
-- 🔥 EMERGENCY DRAG LINE
-- ======================

local dragLine = Instance.new("Frame", mainFrame)
dragLine.Size = UDim2.new(1, -60, 0, 8) -- ancho completo, altura pequeña
dragLine.Position = UDim2.new(0, 30, 1, 10) -- el último número es para subir y bajar - es subir y sin - es bajar 
dragLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
dragLine.BackgroundTransparency = 0.7 -- invisible
dragLine.BorderSizePixel = 0
dragLine.ZIndex = 20 -- encima de todo
local corner = Instance.new("UICorner", dragLine)
corner.CornerRadius = UDim.new(0, 6) -- puedes cambiar el 6

-- DRAG LOGIC
do
    local dragging, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end

    dragLine.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end -- aca termina eso 🖕🖕🖕

local currentMenuButton = nil

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

    b.MouseButton1Click:Connect(function()
        -- restaurar el anterior
        if currentMenuButton and currentMenuButton ~= b then
            currentMenuButton.BackgroundColor3 = Color3.fromRGB(15,15,15)
            currentMenuButton.TextColor3 = Color3.fromRGB(255,255,255)
        end

        -- marcar el actual
        b.BackgroundColor3 = Color3.fromRGB(255,255,255)
        b.TextColor3 = Color3.fromRGB(0,0,0)

        currentMenuButton = b

        callback()
    end)
end

local function createButton(parent,text,y,callback)
    local hasTextbox = textboxButtons[text] ~= nil
    local multiConfig = multiButtons[text]

    local container = Instance.new("Frame", parent)
    local custom = BUTTON_CUSTOM[text]

    local finalSize = BUTTON_SIZE
    local extraX = 0
    local extraY = 0

    if custom then
        if custom.size then
            finalSize = custom.size
        end
        extraX = custom.x or 0
        extraY = custom.y or 0
    end

    local isDoubleLeft = doubleButtons[text] ~= nil
local isDoubleRight = false

for left, right in pairs(doubleButtons) do
    if text == right then
        isDoubleRight = true
        break
    end
end

if isDoubleLeft then
    -- botón izquierdo
    container.Size = UDim2.new(0.5, -15, 0, 30)
    container.Position = UDim2.new(0, 10, 0, y)

elseif isDoubleRight then
    -- botón derecho
    container.Size = UDim2.new(0.5, -15, 0, 30)
    container.Position = UDim2.new(0.5, 5, 0, y)

else
    -- botón normal
    container.Size = finalSize
    container.Position = UDim2.new(
        0, 10 + extraX,
        0, y + extraY
    )
end
    container.BackgroundTransparency = 1

    local button = Instance.new("TextButton", container)
    button.TextColor3 = Color3.fromRGB(255,255,255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.BorderSizePixel = 0

    -- ======================
    -- 🔥 MULTI MODE
    -- ======================
    if multiConfig then
        button.Size = UDim2.new(1,0,1,0)
        button.Text = ""
        button.BackgroundColor3 = Color3.fromRGB(20,20,20)

        getgenv().SBS_MULTI = getgenv().SBS_MULTI or {}
        local index = getgenv().SBS_MULTI[text] or 0
        local options = multiConfig.options

        local label = Instance.new("TextLabel", button)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.TextSize = 14
        label.Font = Enum.Font.GothamBold

        local function update()
            if index == 0 then
                label.Text = text
                label.TextColor3 = Color3.fromRGB(255,255,255)
            else
                local opt = options[index]
                label.Text = opt.name
                label.TextColor3 = opt.color
                if index ~= 0 then
    local opt = options[index]

    -- borrar variables anteriores
    for _, option in ipairs(options) do
        if option.name then
            getgenv()[option.name] = nil
        end
    end

    -- activar solo la actual
    getgenv()[opt.name] = true
                end
            end
        end

        update()

        button.MouseButton1Click:Connect(function()
            index += 1
            if index > #options then index = 1 end
            getgenv().SBS_MULTI[text] = index
            update()
        end)

        return
    end

-- ======================
-- TEXTBOX MODE (CORTO Y FIXED)
-- ======================
if hasTextbox then
    button:Destroy()

    local box = Instance.new("TextBox", container)
    box.Size = UDim2.new(1,0,1,0)
    box.BackgroundColor3 = Color3.fromRGB(25,25,25)
    box.TextColor3 = Color3.fromRGB(255,255,255)
    box.PlaceholderText = text
    box.Text = ""
    box.Font = Enum.Font.GothamBold
    box.TextSize = 14
    box.BorderSizePixel = 0

    local data = textboxButtons[text]

    -- 🔥 cargar valor guardado
    if data and getgenv()[data.variable] ~= nil then
        box.Text = tostring(getgenv()[data.variable])
    end

    -- 🔢 SOLO NÚMEROS (EN TIEMPO REAL)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        if numericBoxes[text] then
            box.Text = box.Text:gsub("[^%d%.%-]", "")
        end
    end)

    -- 💾 GUARDAR
    box.FocusLost:Connect(function()
        local input = box.Text
        if input == "" then return end

        local value

        if numericBoxes[text] then
            value = tonumber(input)
            if not value then
                box.Text = tostring(getgenv()[data.variable] or "")
                return
            end
        else
            value = input
        end

        -- ❌ no repetir
        if getgenv()[data.variable] == value then return end

        getgenv()[data.variable] = value

        if data.url then
            loadstring(game:HttpGet(data.url))()
        end
    end)

    return -- 🔥 CLAVE
    end
    -- 🔹 BOTÓN NORMAL (TU SISTEMA)
    button.Size = UDim2.new(1,0,1,0)

    local isRedToggle = redToggleButtons[text]
local isToggle = isRedToggle or not noToggleButtons[text]

    if isToggle then
        if buttonStates[text] == nil then
            buttonStates[text] = false
        end

        local function updateVisual()
    if isRedToggle then
        button.Text = text

        if buttonStates[text] then
            button.BackgroundColor3 = Color3.fromRGB(120,0,0)
        else
            button.BackgroundColor3 = Color3.fromRGB(20,20,20)
        end
    else
        if buttonStates[text] then
            button.Text = text.." [ON]"
            button.BackgroundColor3 = Color3.fromRGB(0,120,0)
        else
            button.Text = text.." [OFF]"
            button.BackgroundColor3 = Color3.fromRGB(20,20,20)
        end
    end
end

        updateVisual()

        button.MouseButton1Click:Connect(function()
            buttonStates[text] = not buttonStates[text]
            updateVisual()
            callback(buttonStates[text])
        end)

    else
        button.Text = text
        button.BackgroundColor3 = Color3.fromRGB(20,20,20)

        local clicking = false

button.MouseButton1Click:Connect(function()
    if clicking then return end -- 🔥 evita spam
    clicking = true

    if not noGreenFlash[text] then
        local oldColor = button.BackgroundColor3
        button.BackgroundColor3 = Color3.fromRGB(0,120,0)

        task.delay(0.5,function() -- más rápido
            if button then
                button.BackgroundColor3 = oldColor
            end
            clicking = false
        end)
    else
        clicking = false
    end

    if callback then
        callback()
    end
end)
    end
end
    
-- ======================
-- SCROLL POR SUBMENU
-- ======================
local scrollConfig = {
    ["MAIN"] = true,
    ["ESP"] = true,
    ["INOCENT"] = true,
    ["SHERIFF"] = true,
    ["MURDERER"] = true,
    ["TELEPORT"] = true,
    ["AUTO FARM"] = true,
    ["Fps"] = false,
    ["YOUTUBE"] = false
}
-- ======================
-- MENUS
-- ======================
local menuOrder = {"MAIN","ESP","INOCENT","SHERIFF","MURDERER","TELEPORT","AUTO FARM","Fps","YOUTUBE"}
local menuData = {
    ["MAIN"] = {
    "DESYNC",
    "INVISIBLE",
    "JUMP(BUTTON)",
    "SPEED",
    "JUMPPOWER",
    "GRAVITY",
    "RESET STATS",
    "NOCLIP",
    "INFINITI JUMP",
    "FLY SPEED",
    "FLY",
},
    ["MURDERER"] = {
        "KILL ALL",
        "KILL SHERIFF",
    },
    ["INOCENT"] = {
        "GRAB GUN",
        "AUTO GRAB GUN",
    },
    ["ESP"] = {
        "ESP PLAYERS",
        "ESP GUN",
        "NO ESP TO ME",
        "ESP NAME",
        "ESP DISTANCE",
        "ESP TRACERS",
        "ESP ABILITY",
        "X-RAY",
        "XRAY-TRANSPARENCY",
        
    },
    ["TELEPORT"] = {
        "MAP",
        "LOBBY",
        "PLAYER NAME",
        "TP TO PLAYER",
    },
    ["AUTO FARM"] = {
        "AUTO FARM KILLS (beta)",
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
        if not v:IsA("UIPadding") then
            if v:IsA("TextButton") or v:IsA("TextLabel") or v:IsA("Frame") then
                v:Destroy()
            end
        end
    end
    frame.CanvasPosition = Vector2.new(0,0)
end

for i,menu in ipairs(menuOrder) do
    createMenuButton(leftFrame, menu, 10+(i-1)*35, function()
    clearFrame(rightFrame)
        -- scroll
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
        titleLabel.Text = menuNames[menu] or menu
        titleLabel.TextColor3 = Color3.fromRGB(255,255,255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextSize = 18

        local oy = 40

        for _,opt in ipairs(menuData[menu]) do

    -- CREAR TITULO SI EXISTE
    if buttonTitles[opt] then
        local section = Instance.new("TextLabel", rightFrame)
        section.Size = UDim2.new(1,-20,0,25)
        section.Position = UDim2.new(0,10,0,oy)
        section.BackgroundTransparency = 1
        section.Text = buttonTitles[opt]
        section.TextColor3 = Color3.fromRGB(200,200,200)
        section.Font = Enum.Font.GothamBold
        section.TextSize = 16
        section.TextXAlignment = Enum.TextXAlignment.Left

        oy += 30
    end

    local topTitle = topTitles[opt]

if topTitle then
    local section = Instance.new("TextLabel", rightFrame)
    section.Size = UDim2.new(1,0,0,30)
    section.Position = UDim2.new(0,0,0,oy)
    section.BackgroundTransparency = 1
    section.Text = topTitle
    section.TextColor3 = Color3.fromRGB(255,255,255)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 18
    section.TextXAlignment = Enum.TextXAlignment.Center

    oy += 35 -- 🔥 baja el botón
                end

    createButton(rightFrame,opt,oy,function(state)

        if opt == "RESET STATS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Reset-speed-jumpPower-y-gravedad-/refs/heads/main/Reset.lua"))()

        elseif opt == "ESP PLAYERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text154/refs/heads/main/Text154.lua"))()
            
        elseif opt == "NO ESP TO ME" then
            loadstring("getgenv().HIGHLIGHT_ME = not getgenv().HIGHLIGHT_ME")()
                            
        elseif opt == "ESP NAME" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text418/refs/heads/main/Text418.lua"))()
                            
        elseif opt == "ESP DISTANCE" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text419/refs/heads/main/Text419.lua"))()
                            
        elseif opt == "ESP TRACERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text420/refs/heads/main/Text420.lua"))()

        elseif opt == "KILL ALL" then
            getgenv().TARGET = "All"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua"))()
                            
        elseif opt == "KILL SHERIFF" then
            getgenv().TARGET = "Sheriff"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text16/refs/heads/main/Text16.lua"))()
                            
        elseif opt == "KILL PLAYER" then
            loadstring(game:HttpGet(""))()

        elseif opt == "INVISIBLE" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text427/refs/heads/main/Text427.lua"))()
                            
        elseif opt == "MAP" then
            getgenv().TP_MODE = "JUMPPAD"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text430/refs/heads/main/Text430.lua"))()
                            
        elseif opt == "DESYNC" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text428/refs/heads/main/Text428.lua"))()

        elseif opt == "AUTO KILL SHERIFF" then
            loadstring(game:HttpGet(""))()
                            
        elseif opt == "LOBBY" then
            getgenv().TP_MODE = "LOBBY"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text430/refs/heads/main/Text430.lua"))()

        elseif opt == "AUTO GRAB GUN" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text153/refs/heads/main/Text153.lua"))()
                            
        elseif opt == "INSTANT RELOAD" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text432/refs/heads/main/Text432.lua"))()

        elseif opt == "AIMBOT LIGERO" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text422/refs/heads/main/Text422.lua"))()
                            
        elseif opt == "AIMBOT INSTANT" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text423/refs/heads/main/Text423.lua"))()
                            
        elseif opt == "AIMBOT OP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text421/refs/heads/main/Text421.lua"))()

        elseif opt == "X-RAY" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text147/refs/heads/main/Text147.lua"))()
                            
        elseif opt == "TP TO PLAYER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text408/refs/heads/main/Text408.lua"))()

        elseif opt == "BULLET TRACERS" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text434/refs/heads/main/Text434.lua"))()      
        
        elseif opt == "FLY" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fly/refs/heads/main/Fly.lua"))()

        elseif opt == "INFINITI JUMP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/INFINITI-JUMP/refs/heads/main/Salto%20infinito.lua",true))()

        elseif opt == "DESYNC" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text24/refs/heads/main/Text23.lua",true))()

        elseif opt == "LOCALPLAYER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text8/refs/heads/main/Text8.lua"))()

        elseif opt == "NOCLIP" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/NOCLIP/refs/heads/main/NOCLIP.lua"))()

        elseif opt == "HITBOX EXTENDER" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text368/refs/heads/main/Text368.lua"))()

        elseif opt == "Fps Boost" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Fps-Boost-/refs/heads/main/FPS_BOOST_UNIVERSAL.lua"))()

        elseif opt == "YOUTUBE:SBS HUB" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Copiar-canal/refs/heads/main/Suscribete.lua"))()

        elseif opt == "TP TOOL" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text331/refs/heads/main/Text331.lua"))()
                            
        end

    end)
    local custom = BUTTON_CUSTOM[opt]
local offsetY = custom and custom.y or 0

local isDoubleLeft = doubleButtons[opt] ~= nil
local isDoubleRight = false

for left, right in pairs(doubleButtons) do
    if opt == right then
        isDoubleRight = true
        break
    end
end

-- solo bajar después del botón derecho o botón normal
if not isDoubleLeft then
    oy += 40 + offsetY
end

local customTitle = customTitles[opt]

if customTitle then
    local section = Instance.new("TextLabel", rightFrame)
    section.Size = UDim2.new(1,-20,0,30)
    section.Position = UDim2.new(0,10,0,oy)
    section.BackgroundTransparency = 1
    section.Text = customTitle
    section.TextColor3 = Color3.fromRGB(255,255,255)
    section.Font = Enum.Font.GothamBold
    section.TextSize = 18
    section.TextXAlignment = Enum.TextXAlignment.Center
    
    oy += 35
                end
            end

end)
end

-- ICONO SBS PARA ABRIR/CERRAR
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
