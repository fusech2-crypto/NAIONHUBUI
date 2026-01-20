--// ======================================================
--// NaiOn Hub | FINAL FOUNDATION (STABLE FIXED)
--// ======================================================

if getgenv().NAION_HUB_BOOTED then return end
getgenv().NAION_HUB_BOOTED = true

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

-- ======================================================
-- CONFIG
-- ======================================================
local CFG = {
    Title = "NaiOn Hub",
    Version = "v1.0",

    Accent = Color3.fromRGB(0,170,255),
    Bg = Color3.fromRGB(12,15,20),
    Panel = Color3.fromRGB(18,22,29),
    PanelDark = Color3.fromRGB(14,17,22),
    Stroke = Color3.fromRGB(0,120,180),
    TextMain = Color3.fromRGB(235,235,235),

    LOGO_ID = "rbxassetid://17733960106"
}

-- ======================================================
-- ROOT GUI
-- ======================================================
local Gui = Instance.new("ScreenGui")
Gui.Name = "NaiOnHubUI"
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
Gui.ResetOnSpawn = false
Gui.Parent = Player:WaitForChild("PlayerGui")

-- ======================================================
-- LOADER
-- ======================================================
local Loader = Instance.new("Frame", Gui)
Loader.Size = UDim2.fromScale(1,1)
Loader.BackgroundColor3 = CFG.Bg

local LBox = Instance.new("Frame", Loader)
LBox.Size = UDim2.fromOffset(420,200)
LBox.Position = UDim2.fromScale(0.5,0.5)
LBox.AnchorPoint = Vector2.new(0.5,0.5)
LBox.BackgroundColor3 = CFG.Panel
Instance.new("UICorner", LBox).CornerRadius = UDim.new(0,14)

local LTitle = Instance.new("TextLabel", LBox)
LTitle.Size = UDim2.new(1,0,1,0)
LTitle.Text = CFG.Title
LTitle.Font = Enum.Font.GothamBold
LTitle.TextSize = 22
LTitle.TextColor3 = CFG.TextMain
LTitle.BackgroundTransparency = 1

-- ======================================================
-- MAIN WINDOW
-- ======================================================
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.fromOffset(820,520)
Main.Position = UDim2.fromScale(0.5,0.5)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = CFG.Bg
Main.Visible = false
Main.BackgroundTransparency = 1

Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = CFG.Stroke
Stroke.Transparency = 1

local fullSize = Main.Size

-- ======================================================
-- TOPBAR
-- ======================================================
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1,0,0,48)
Top.BackgroundColor3 = CFG.Panel
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel", Top)
Title.Position = UDim2.fromOffset(16,6)
Title.Size = UDim2.fromOffset(300,20)
Title.Text = CFG.Title.." "..CFG.Version
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = CFG.TextMain
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinBtn = Instance.new("TextButton", Top)
MinBtn.Size = UDim2.fromOffset(36,36)
MinBtn.Position = UDim2.new(1,-44,0,6)
MinBtn.Text = "—"
MinBtn.Font = Enum.Font.GothamBold
MinBtn.TextSize = 18
MinBtn.TextColor3 = CFG.TextMain
MinBtn.BackgroundColor3 = CFG.PanelDark
Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1,0)

-- ======================================================
-- DRAG MAIN WINDOW (TOPBAR ONLY)
-- ======================================================
do
    local dragging = false
    local dragStart
    local startPos

    Top.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart
            Main.Position = startPos + UDim2.fromOffset(delta.X, delta.Y)
        end
    end)
end

-- ======================================================
-- BODY
-- ======================================================
local Body = Instance.new("Frame", Main)
Body.Position = UDim2.fromOffset(0,48)
Body.Size = UDim2.new(1,0,1,-48)
Body.BackgroundTransparency = 1
Body.ClipsDescendants = true

local Sidebar = Instance.new("Frame", Body)
Sidebar.Size = UDim2.fromOffset(200,Body.Size.Y.Offset)
Sidebar.BackgroundColor3 = CFG.PanelDark

local Content = Instance.new("Frame", Body)
Content.Position = UDim2.fromOffset(200,0)
Content.Size = UDim2.new(1,-200,1,0)
Content.BackgroundColor3 = CFG.Panel

-- ======================================================
-- FLOATING ICON
-- ======================================================
local Icon = Instance.new("ImageButton", Gui)
Icon.Size = UDim2.fromOffset(65,65)
Icon.Position = UDim2.fromOffset(45,45)
Icon.BackgroundColor3 = CFG.Panel
Icon.Image = CFG.LOGO_ID
Icon.Visible = false
Instance.new("UICorner", Icon).CornerRadius = UDim.new(1,0)

local IconStroke = Instance.new("UIStroke", Icon)
IconStroke.Color = CFG.Accent
IconStroke.Thickness = 0
IconStroke.Transparency = 0.2

-- ======================================================
-- ICON DRAG + GLOW
-- ======================================================
do
    local dragging, dragStart, startPos

    Icon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Icon.Position

            TweenService:Create(IconStroke, TweenInfo.new(0.15), {
                Thickness = 2
            }):Play()

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    TweenService:Create(IconStroke, TweenInfo.new(0.2), {
                        Thickness = 0
                    }):Play()
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart
            Icon.Position = startPos + UDim2.fromOffset(delta.X, delta.Y)
        end
    end)
end

-- ======================================================
-- OPEN / CLOSE UI
-- ======================================================
local function OpenUI()
    Main.Visible = true
    Icon.Visible = false

    Main.Size = UDim2.fromOffset(fullSize.X.Offset, fullSize.Y.Offset - 40)
    Main.BackgroundTransparency = 1
    Stroke.Transparency = 1

    TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
        Size = fullSize,
        BackgroundTransparency = 0
    }):Play()

    TweenService:Create(Stroke, TweenInfo.new(0.25), {
        Transparency = 0
    }):Play()
end

local function CloseUI()
    TweenService:Create(Main, TweenInfo.new(0.2), {
        Size = UDim2.fromOffset(fullSize.X.Offset, fullSize.Y.Offset - 40),
        BackgroundTransparency = 1
    }):Play()

    TweenService:Create(Stroke, TweenInfo.new(0.2), {
        Transparency = 1
    }):Play()

    task.delay(0.2, function()
        Main.Visible = false
        Icon.Visible = true
    end)
end

-- ======================================================
-- STATE LOGIC
-- ======================================================
local minimized = false

MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Main:TweenSize(UDim2.fromOffset(fullSize.X.Offset,48),"Out","Quad",0.25,true)
        Body.Visible = false
        Icon.Visible = true
    else
        Main:TweenSize(fullSize,"Out","Quad",0.25,true)
        Body.Visible = true
        Icon.Visible = false
    end
end)

Icon.MouseButton1Click:Connect(OpenUI)

UIS.InputBegan:Connect(function(i,gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.LeftControl then
        if Main.Visible then
            CloseUI()
        else
            OpenUI()
        end
    end
end)

-- ======================================================
-- SPLASH END
-- ======================================================
task.delay(1.2,function()
    TweenService:Create(Loader,TweenInfo.new(0.4),{
        BackgroundTransparency = 1
    }):Play()
    task.delay(0.45,function()
        Loader:Destroy()
        OpenUI()
    end)
end)

print("[NaiOn Hub] UI Loaded Successfully")
