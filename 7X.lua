if not game:IsLoaded() then game.Loaded:Wait() end

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.ClipsDescendants = true

local chars = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","X","Z","<",">","/","\\","#","@","$","%","!","?","ア","イ","ウ","エ","カ","キ","ク","サ","シ","ス"}
local COLS = 28

task.spawn(function()
    while bg and bg.Parent do
        local col = math.random(0, COLS - 1)
        local xPos = col / COLS
        local colW  = 1 / COLS
        local length = math.random(6, 18)
        local speed  = math.random(60, 140) / 100
        task.spawn(function()
            for step = 1, length do
                if not bg or not bg.Parent then return end
                local lbl = Instance.new("TextLabel", bg)
                lbl.Size = UDim2.new(colW, 0, 0, 20)
                lbl.Position = UDim2.new(xPos, 0, -0.02 + step * 0.06, 0)
                lbl.BackgroundTransparency = 1
                lbl.Text = chars[math.random(1, #chars)]
                lbl.Font = Enum.Font.Code
                lbl.TextSize = 15
                lbl.TextXAlignment = Enum.TextXAlignment.Center
                lbl.ZIndex = 2
                local fade = math.max(0, 1 - step / length)
                if step == 1 then lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                elseif step <= 3 then lbl.TextColor3 = Color3.fromRGB(180, 180, 180)
                else local gray = math.floor(100 * fade) lbl.TextColor3 = Color3.fromRGB(gray, gray, gray) end
                local lifetime = (length - step + 2) * (0.05 / speed)
                task.delay(lifetime, function() if lbl and lbl.Parent then lbl:Destroy() end end)
                task.wait(0.05 / speed)
            end
        end)
        task.wait(math.random(5, 25) / 100)
    end
end)

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(0.5, 0, 0, 80)
title.Position = UDim2.new(0.05, 0, 0.15, 0)
title.BackgroundTransparency = 1
title.Text = "7X CLAN"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 10

local sub = Instance.new("TextLabel", bg)
sub.Size = UDim2.new(0.5, 0, 0, 40)
sub.Position = UDim2.new(0.05, 0, 0.27, 0)
sub.BackgroundTransparency = 1
sub.Text = "HUB"
sub.TextColor3 = Color3.fromRGB(255, 255, 255)
sub.TextScaled = true
sub.Font = Enum.Font.GothamBold
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.ZIndex = 10

local percent = Instance.new("TextLabel", bg)
percent.Size = UDim2.new(0.2, 0, 0, 30)
percent.Position = UDim2.new(0.05, 0, 0.65, 0)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.TextScaled = true
percent.Font = Enum.Font.GothamBold
percent.TextXAlignment = Enum.TextXAlignment.Left
percent.ZIndex = 10

local barHolder = Instance.new("Frame", bg)
barHolder.Size = UDim2.new(0.4, 0, 0, 28)
barHolder.Position = UDim2.new(0.05, 0, 0.72, 0)
barHolder.BackgroundTransparency = 1
barHolder.ZIndex = 10

local boxes = {}
for i = 1, 10 do
    local box = Instance.new("Frame", barHolder)
    box.Size = UDim2.new(0.08, -4, 1, 0)
    box.Position = UDim2.new((i - 1) * 0.1, 2, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    box.BorderSizePixel = 0
    box.ZIndex = 10
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    boxes[i] = box
end

local ring = Instance.new("Frame", bg)
ring.Size = UDim2.new(0, 340, 0, 340)
ring.Position = UDim2.new(0.7, 0, 0.2, 0)
ring.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ring.BorderSizePixel = 0
ring.ZIndex = 10
Instance.new("UICorner", ring).CornerRadius = UDim.new(1, 0)

local imgLabel = Instance.new("ImageLabel", ring)
imgLabel.Size = UDim2.new(1, -10, 1, -10)
imgLabel.Position = UDim2.new(0, 5, 0, 5)
imgLabel.BackgroundTransparency = 1
imgLabel.Image = "rbxassetid://104808076268025"
imgLabel.ScaleType = Enum.ScaleType.Crop
imgLabel.ZIndex = 11
Instance.new("UICorner", imgLabel).CornerRadius = UDim.new(1, 0)

for i = 1, 100 do
    percent.Text = i .. "%"
    local index = math.ceil(i / 10)
    if boxes[index] then boxes[index].BackgroundColor3 = Color3.fromRGB(255, 255, 255) end
    task.wait(0.03)
end
task.wait(0.5)
gui:Destroy()

local redzlib = loadstring(game:HttpGet("https://pastebin.com/raw/MVx3Hz8c"))()
local Window = redzlib:MakeWindow({
    Title = "7X CLAN ON TOP",
    SubTitle = "                       |  V1",
    SaveFolder = "7X_Data"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://104808076268025", BackgroundTransparency = 0.5 },
    Corner = { CornerRadius = UDim.new(0, 4) }
})

local TargetTab = Window:MakeTab({ Title = "استهداف لاعب", Icon = "rbxassetid://10709819149" })
local InfoTab = Window:MakeTab({ Title = "حـقوق", Icon = "rbxassetid://104808076268025" })

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local SelectedTarget = nil
local BangAnim = nil
local BangSpeed = 20
local IsBanging = false
local IsFaceBanging = false
getgenv().FPDH = workspace.FallenPartsDestroyHeight

local function StopAll()
    IsBanging = false
    IsFaceBanging = false
    if BangAnim then BangAnim:Stop() BangAnim = nil end
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        for _, obj in pairs(char.HumanoidRootPart:GetChildren()) do
            if obj.Name:find("BANG") or obj.Name == "EpixVel" then obj:Destroy() end
        end
    end
    workspace.CurrentCamera.CameraSubject = (char and char:FindFirstChildOfClass("Humanoid")) or nil
end

local function GetPlayerList()
    local list = {}
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    return list
end

local function Message(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local function SkidFling(TargetPlayer)
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter and TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit then
            return Message("Error Occurred", "Target is sitting", 5)
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local function FPos(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local function SFBasePart(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

TargetTab:AddSection({ "اختيار الضحية" })

local PlayerDropdown = TargetTab:AddDropdown({
    Name = "قائمة اللاعبين",
    Options = GetPlayerList(),
    Default = "اختر لاعب...",
    Callback = function(val)
        SelectedTarget = Players:FindFirstChild(val)
        if SelectedTarget then
            PlayerDropdown:Set(val)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "7X CLAN",
                Text = "تم تحديد الضحية: " .. val,
                Duration = 4,
                Icon = "rbxassetid://104808076268025"
            })
        end
    end
})

TargetTab:AddButton({
    Name = "تحديث القائمة",
    Callback = function()
        PlayerDropdown:SetOptions(GetPlayerList())
    end
})

TargetTab:AddSection({ "الهجوم" })

TargetTab:AddButton({
    Name = "تشغيل BANG (خلف الظهر)",
    Callback = function()
        if not SelectedTarget then return end
        StopAll()
        IsBanging = true
        task.spawn(function()
            while IsBanging and SelectedTarget and SelectedTarget.Parent do
                local char = LocalPlayer.Character
                local tChar = SelectedTarget.Character
                if char and tChar and char:FindFirstChild("HumanoidRootPart") and tChar:FindFirstChild("HumanoidRootPart") then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if BangAnim == nil then
                        local anim = Instance.new("Animation")
                        anim.AnimationId = (hum.RigType == Enum.HumanoidRigType.R6) and "rbxassetid://148840371" or "rbxassetid://5918726674"
                        BangAnim = hum:LoadAnimation(anim)
                        BangAnim.Looped = true
                        BangAnim:Play()
                        BangAnim:AdjustSpeed(BangSpeed)
                    end
                    local root = char.HumanoidRootPart
                    local tRoot = tChar.HumanoidRootPart
                    root.CFrame = tRoot.CFrame * CFrame.new(0, 0, 1.1)
                end
                RunService.Heartbeat:Wait()
            end
        end)
    end
})

TargetTab:AddButton({
    Name = "تشغيل FACE BANG",
    Callback = function()
        if not SelectedTarget then return end
        StopAll()
        IsFaceBanging = true
        task.spawn(function()
            while IsFaceBanging and SelectedTarget and SelectedTarget.Parent do
                local char = LocalPlayer.Character
                local tChar = SelectedTarget.Character
                if char and tChar and tChar:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    hum.Sit = true
                    local tHead = tChar.Head
                    local root = char.HumanoidRootPart
                    local movePos = tHead.CFrame * CFrame.new(0, 0, -2.5 - math.sin(tick() * BangSpeed) * 1.5)
                    root.CFrame = CFrame.new(movePos.Position, tHead.Position)
                end
                RunService.Heartbeat:Wait()
            end
        end)
    end
})

TargetTab:AddButton({
    Name = "FLING!",
    Callback = function()
        if SelectedTarget then
            SkidFling(SelectedTarget)
        else
            Message("Error Occurred", "لم يتم اختيار لاعب", 5)
        end
    end
})

TargetTab:AddButton({
    Name = "إيقاف",
    Callback = function() StopAll() end
})

TargetTab:AddSlider({
    Name = "السرعة الفائقة (999)",
    Min = 1,
    Max = 999,
    Default = 20,
    Callback = function(v)
        BangSpeed = v
        if BangAnim then BangAnim:AdjustSpeed(v) end
    end
})

InfoTab:AddSection({ "معلومات السكربت" })
InfoTab:AddParagraph({ "سكربت المطور مادارا" })
InfoTab:AddParagraph({"7X CLAN MADARA SCRIPT"})
InfoTab:AddButton({": ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/muskarnu/Projects/main/DemoNtr.txt"))()
end})

InfoTab:AddSection({ "اعادة دخول" })
InfoTab:AddButton({
    Name = "اعادة دخول للسيرفر",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})
