getgenv().worddot = false
getgenv().key = "c"
getgenv().X = 68756
getgenv().Y = 100
getgenv().Z = -344

game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().worddot then
        local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(getgenv().X, getgenv().Y, getgenv().Z)
        game:GetService("RunService").RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end
end)

game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(keyPressed)
    if keyPressed == string.lower(getgenv().key) then
        pcall(function()
            if getgenv().worddot == false then
                getgenv().worddot = true
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Keron's AntiLock",
                    Text = "Enabled" })
            elseif getgenv().worddot == true then
                getgenv().worddot = false
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Keron's AntiLock",
                    Text = "Disabled" })
            end
        end)
    end
end)

getgenv().VelocityChanger = true
getgenv().Velocity = Vector3.new(0,-500,0)

local Players     = game:GetService("Players")
local RunService  = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character   = LocalPlayer.Character
local RootPart    = Character:FindFirstChild("HumanoidRootPart")

local Heartbeat, RStepped, Stepped = RunService.Heartbeat, RunService.RenderStepped, RunService.Stepped

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
   Character = NewCharacter
end)

local RVelocity, YVelocity = nil, 0.1

while true do
   if VelocityChanger then
       if (not RootPart) or (not RootPart.Parent) or (not RootPart.Parent.Parent) then
           warn("weird ahh died")
           RootPart = Character:FindFirstChild("HumanoidRootPart")
       else
           RVelocity = RootPart.Velocity
   
           RootPart.Velocity = type(Velocity) == "vector" and Velocity or Velocity(RVelocity)
       
           RStepped:wait()
       
           RootPart.Velocity = RVelocity
       end
   end
   
   Heartbeat:wait()
end

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                local hrp = v.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)    
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)   
            end
        end
    end)
end)

_G.JumpableAntiWordexe= true

game.RunService.Heartbeat:Connect(function()
    if _G. JumpableAntiWordexe then    
        local CurrentVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(1000,1000,1000)
        game.RunService.RenderStepped:Wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = CurrentVelocity
    end    
end)

checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod
 
local KeronAntiLock = false
local Nigger = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Faggot = LocalPlayer:GetMouse()

Faggot.KeyDown:Connect(function(Keron)
    if Keron == string.lower(P1000ToggleKey) then
        pcall(function()
            if KeronAntiLock == false then
                KeronAntiLock = true
                print("Enabled AntiLock")
            elseif KeronAntiLock == true then
                KeronAntiLock = false
                print("Disabled AntiLock")
            end
        end)
    end
end)
local character = game.Players.LocalPlayer.Character
local hrp = character:WaitForChild("HumanoidRootPart")


local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
bodyAngularVelocity.Parent = hrp
bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
bodyAngularVelocity.MaxTorque = Vector3.new(0, 0, 0)


local bodyLinearVelocity = Instance.new("BodyLinearVelocity")
bodyLinearVelocity.Parent = hrp
bodyLinearVelocity.Velocity = Vector3.new(0, 0, 0)
bodyLinearVelocity.MaxForce = Vector3.new(0, 0, 0)


local bodyGyro = Instance.new("BodyGyro")
bodyGyro.Parent = hrp
bodyGyro.CFrame = hrp.CFrame
bodyGyro.MaxTorque = Vector3.new(0, 0, 0)


local bodyThrust = Instance.new("BodyThrust")
bodyThrust.Parent = hrp
bodyThrust.Force = Vector3.new(0, 0, 0)
bodyThrust.Location = Vector3.new(0, 0, 0)
bodyThrust.MaxForce = Vector3.new(0, 0, 0)


local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Parent = hrp
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.MaxForce = Vector3.new(0, 0, 0)


local function setEnabled(enabled)
    local maxForceValue = enabled and math.huge or 0
    local maxTorqueValue = enabled and math.huge or 0
    
    bodyAngularVelocity.MaxTorque = Vector3.new(maxTorqueValue, maxTorqueValue, maxTorqueValue)
    bodyLinearVelocity.MaxForce = Vector3.new(maxForceValue, maxForceValue, maxForceValue)
    bodyGyro.MaxTorque = Vector3.new(maxTorqueValue, maxTorqueValue, maxTorqueValue)
    bodyThrust.MaxForce = Vector3.new(maxForceValue, maxForceValue, maxForceValue)
    bodyVelocity.MaxForce = Vector3.new(maxForceValue, maxForceValue, maxForceValue)
end


setEnabled(true)


setEnabled(false)

Faggot.KeyDown:Connect(function(Keron)
    if Keron == ("=") then
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) 
    end
end)

function RandomNumberRange(a)
    return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
    return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end
local Resolver = {
    DesyncResolver = false
}
local DesyncTypes = {}
Nigger.Heartbeat:Connect(function()
    if KeronAntiLock == true then
        DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
        DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

        local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

        SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
        SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))


        if Resolver.DesyncResolver then

            LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis * CFrame.new(LocalPlayer.Character.Humanoid.MoveDirection)
        else

            LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis * CFrame.new(LocalPlayer.Character.HumanoidRootPart.Velocity)
        end

        zeroOutYVelocity(LocalPlayer.Character.HumanoidRootPart)

        Nigger.RenderStepped:Wait()

        LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
        LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
    end
end)
while true do
    game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()
    wait(1)
end
