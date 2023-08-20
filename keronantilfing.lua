local httpService = game:GetService("HttpService");

local invCode = "pictures";
local httpRequest = (syn and syn.request) or http_request or function() end;

local function launchDiscord()
	if not httpRequest then warn("shitty ass executor can't support this request smh") return end
	
	httpRequest({
		Url = "http://127.0.0.1:6463/rpc?v=1",
		Method = "POST",
	
		Headers = {
			['Content-Type'] = 'application/json',
			Origin = 'https://discord.com'
		},
	
		Body = httpService:JSONEncode({
			cmd = 'INVITE_BROWSER',
			nonce = httpService:GenerateGUID(false),
			args = {code = invCode}
		})
	})
end;

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = launchDiscord

game:GetService("StarterGui"):SetCore(
	"SendNotification",
	{
		Title = "Keron AntiFling",
		Duration = 5,
		Text = "Loading AntiFling\n Join Discord For More",
		Button1 = "Join Discord",
		Callback = NotificationBindable
	}
)

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local savedPositions = {}
local isMoving = false

local function onCharacterAdded(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")

    humanoid.Running:Connect(function(speed)
        if speed > 0 then
            table.insert(savedPositions, rootPart.CFrame)
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                    part.CanCollide = false
                end
            end
            isMoving = true
        else
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Anchored = true
                    part.CanCollide = false
                end
            end
            isMoving = false
        end
    end)

    humanoid.Jumping:Connect(function()
        table.insert(savedPositions, rootPart.CFrame)
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Anchored = false
                part.CanCollide = false
            end
        end
        isMoving = true
    end)

    humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
        if humanoid.FloorMaterial == Enum.Material.Air then 
            local lastPosition = savedPositions[#savedPositions]
            if lastPosition then 
                rootPart.CFrame = lastPosition 
            end 
        end 
    end)

    local function onTouched(part)
        local otherCharacter = part.Parent 
        local otherHumanoid = otherCharacter:FindFirstChild("Humanoid")
        if otherHumanoid then 
            local otherPlayer = game.Players:GetPlayerFromCharacter(otherCharacter)
            if otherPlayer and otherPlayer ~= player then 
                local lastPosition = savedPositions[#savedPositions]
                if lastPosition then 
                    rootPart.CFrame = lastPosition 
                end 
            end 
        end 
    end 

    rootPart.Touched:Connect(onTouched)

    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            for _, part in pairs(character:GetChildren()) do 
                if part:IsA("BasePart") then 
                    part.Anchored = false 
                    part.CanCollide = false 
                end 
            end 
            isMoving = true 
        end 
    end)

    game.Players.PlayerAdded:Connect(function(otherPlayer)
        if otherPlayer ~= player then 
            local otherCharacter = otherPlayer.Character or otherPlayer.CharacterAdded:Wait()
            local otherRootPart = otherCharacter:WaitForChild("HumanoidRootPart")
            otherRootPart:GetPropertyChangedSignal("Velocity"):Connect(function()
                local lastPosition = savedPositions[#savedPositions]
                if lastPosition then 
                    rootPart.CFrame = lastPosition 
                end 
            end)
        end 
    end)

    while true do
        wait(0)
        if not humanoid or not humanoid.Parent or not rootPart or not rootPart.Parent then
            character = player.Character or player.CharacterAdded:Wait()
            humanoid = character:WaitForChild("Humanoid")
            rootPart = character:WaitForChild("HumanoidRootPart")
        end


        local speed = humanoid.WalkSpeed
        if speed == 0 and not isMoving then
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") and not part.Anchored then
                    part.Anchored = true
                    part.CanCollide = false
                end 
            end 

            local lastPosition = savedPositions[#savedPositions]
            if lastPosition then
                while speed == 0 and not isMoving do
                    rootPart.CFrame = lastPosition
                    speed = humanoid.WalkSpeed
                end 
            end 
        else 
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") and part.Anchored then
                    part.Anchored = false
                    part.CanCollide = false
                end 
            end 
        end 
    end 


    local customCollisionGroupName = "NoCollisions"


    if not game:GetService("PhysicsService"):GetCollisionGroup(customCollisionGroupName) then
        game:GetService("PhysicsService"):CreateCollisionGroup(customCollisionGroupName)
    end


    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            game:GetService("PhysicsService"):SetPartCollisionGroup(part, customCollisionGroupName)
        end
    end

    for _, groupName in pairs(game:GetService("PhysicsService"):GetCollisionGroups()) do
        game:GetService("PhysicsService"):CollisionGroupSetCollidable(customCollisionGroupName, groupName.name, false)
    end
end

player.CharacterAdded:Connect(onCharacterAdded)
onCharacterAdded(character)
