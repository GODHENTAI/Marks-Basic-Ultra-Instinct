-- Create GUI elements
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICornerMain = Instance.new("UICorner")
local TitleLabel = Instance.new("TextLabel")
local RangeLabel = Instance.new("TextLabel")
local RangeTextBox = Instance.new("TextBox")
local UICornerRange = Instance.new("UICorner")
local DistanceLabel = Instance.new("TextLabel")
local DistanceTextBox = Instance.new("TextBox")
local UICornerDistance = Instance.new("UICorner")
local InstructionLabel = Instance.new("TextLabel")
local CreditLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local isMinimized = false

-- Set properties for ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Set properties for MainFrame
MainFrame.Size = UDim2.new(0, 250, 0, 300)  -- Adjusted size
MainFrame.Position = UDim2.new(0, 10, 0, 10)
MainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Set properties for UICornerMain
UICornerMain.CornerRadius = UDim.new(0, 12)
UICornerMain.Parent = MainFrame

-- Set properties for TitleLabel
TitleLabel.Size = UDim2.new(0, 230, 0, 40)  -- Decreased height
TitleLabel.Position = UDim2.new(0, 10, 0, 10)
TitleLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Text = "Marks Basic Ultra Instinct"
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 16  -- Decreased text size
TitleLabel.Parent = MainFrame

-- Set properties for MinimizeButton
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -40, 0, 10) -- Position at top-right corner
MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Text = "-"
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = MainFrame

-- Set properties for RangeLabel
RangeLabel.Size = UDim2.new(0, 230, 0, 30)  -- Decreased height
RangeLabel.Position = UDim2.new(0, 10, 0, 60)
RangeLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
RangeLabel.TextColor3 = Color3.new(1, 1, 1)
RangeLabel.Text = "Detection Range:"
RangeLabel.Font = Enum.Font.SourceSans
RangeLabel.TextSize = 16  -- Decreased text size
RangeLabel.Parent = MainFrame

-- Set properties for RangeTextBox
RangeTextBox.Size = UDim2.new(0, 230, 0, 30)  -- Decreased height
RangeTextBox.Position = UDim2.new(0, 10, 0, 100)
RangeTextBox.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
RangeTextBox.TextColor3 = Color3.new(1, 1, 1)
RangeTextBox.Text = "20"
RangeTextBox.Font = Enum.Font.SourceSans
RangeTextBox.TextSize = 16  -- Decreased text size
RangeTextBox.Parent = MainFrame

-- Set properties for UICornerRange
UICornerRange.CornerRadius = UDim.new(0, 12)
UICornerRange.Parent = RangeTextBox

-- Set properties for DistanceLabel
DistanceLabel.Size = UDim2.new(0, 230, 0, 30)  -- Decreased height
DistanceLabel.Position = UDim2.new(0, 10, 0, 140)
DistanceLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
DistanceLabel.TextColor3 = Color3.new(1, 1, 1)
DistanceLabel.Text = "Teleport Distance:"
DistanceLabel.Font = Enum.Font.SourceSans
DistanceLabel.TextSize = 16  -- Decreased text size
DistanceLabel.Parent = MainFrame

-- Set properties for DistanceTextBox
DistanceTextBox.Size = UDim2.new(0, 230, 0, 30)  -- Decreased height
DistanceTextBox.Position = UDim2.new(0, 10, 0, 180)
DistanceTextBox.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
DistanceTextBox.TextColor3 = Color3.new(1, 1, 1)
DistanceTextBox.Text = "5"
DistanceTextBox.Font = Enum.Font.SourceSans
DistanceTextBox.TextSize = 16  -- Decreased text size
DistanceTextBox.Parent = MainFrame

-- Set properties for UICornerDistance
UICornerDistance.CornerRadius = UDim.new(0, 12)
UICornerDistance.Parent = DistanceTextBox

-- Set properties for InstructionLabel
InstructionLabel.Size = UDim2.new(0, 230, 0, 20)
InstructionLabel.Position = UDim2.new(0, 10, 0, 220)
InstructionLabel.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
InstructionLabel.TextColor3 = Color3.new(1, 1, 1)
InstructionLabel.Text = "Press E to toggle teleportation"
InstructionLabel.Font = Enum.Font.SourceSans
InstructionLabel.TextSize = 14
InstructionLabel.Parent = MainFrame

-- Set properties for CreditLabel
CreditLabel.Size = UDim2.new(0, 230, 0, 20)
CreditLabel.Position = UDim2.new(0, 10, 0, 250)
CreditLabel.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
CreditLabel.TextColor3 = Color3.new(1, 1, 1)
CreditLabel.Text = "MONKEYSLAVEOWNER ON DISCORD"
CreditLabel.Font = Enum.Font.SourceSans
CreditLabel.TextSize = 14
CreditLabel.Parent = MainFrame

-- Draggable logic
local dragging = false
local dragStart = Vector2.new()
local startPos = UDim2.new()

-- Function to start dragging
local function startDrag(input)
    dragging = true
    dragStart = input.Position
    startPos = MainFrame.Position
    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

-- Function to drag the MainFrame
local function updateDrag(input)
    if dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

-- Start dragging when the title is clicked
TitleLabel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        startDrag(input)
    end
end)

-- Update drag position
game:GetService("UserInputService").InputChanged:Connect(updateDrag)

-- Minimize/Close Button Functionality
MinimizeButton.MouseButton1Click:Connect(function()
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 250, 0, 300)
        RangeLabel.Visible = true
        RangeTextBox.Visible = true
        DistanceLabel.Visible = true
        DistanceTextBox.Visible = true
        InstructionLabel.Visible = true
        CreditLabel.Visible = true
        MinimizeButton.Text = "-"
        isMinimized = false
    else
        MainFrame.Size = UDim2.new(0, 250, 0, 50)  -- Minimized height
        RangeLabel.Visible = false
        RangeTextBox.Visible = false
        DistanceLabel.Visible = false
        DistanceTextBox.Visible = false
        InstructionLabel.Visible = false
        CreditLabel.Visible = false
        MinimizeButton.Text = "+"
        isMinimized = true
    end
end)
-- Services and player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Configuration
local detectionRange = 20 -- Initial range for teleportation
local teleportDistance = 5 -- Initial distance around the target player
local teleportEnabled = false -- Teleportation toggle

-- Function to get a random position around the target player
local function getRandomPositionAround(targetPosition)
    local angle = math.rad(math.random(0, 360))
    local offsetX = math.cos(angle) * teleportDistance
    local offsetZ = math.sin(angle) * teleportDistance
    return targetPosition + Vector3.new(offsetX, 0, offsetZ)
end

-- Function to check distance and teleport
local function checkAndTeleport()
    if teleportEnabled then
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherCharacter = otherPlayer.Character
                if otherCharacter and otherCharacter:FindFirstChild("HumanoidRootPart") then
                    local targetPosition = otherCharacter.HumanoidRootPart.Position
                    local distance = (humanoidRootPart.Position - targetPosition).magnitude
                    
                    if distance <= detectionRange then
                        -- Get a random position around the target player
                        local teleportPosition = getRandomPositionAround(targetPosition)
                        
                        -- Teleport to the calculated position
                        humanoidRootPart.CFrame = CFrame.new(teleportPosition, targetPosition)
                    end
                end
            end
        end
    end
end

-- Function to toggle teleportation
local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        teleportEnabled = not teleportEnabled
        print("Teleportation " .. (teleportEnabled and "enabled" or "disabled"))
    end
end

-- Update function to handle text box input
local function updateSettings()
    -- Range TextBox
    RangeTextBox.FocusLost:Connect(function(enterPressed)
        local newRange = tonumber(RangeTextBox.Text)
        if newRange then
            detectionRange = newRange
            RangeLabel.Text = "Detection Range: " .. detectionRange
        else
            RangeTextBox.Text = tostring(detectionRange)
        end
    end)

    -- Distance TextBox
    DistanceTextBox.FocusLost:Connect(function(enterPressed)
        local newDistance = tonumber(DistanceTextBox.Text)
        if newDistance then
            teleportDistance = newDistance
            DistanceLabel.Text = "Teleport Distance: " .. teleportDistance
        else
            DistanceTextBox.Text = tostring(teleportDistance)
        end
    end)
end

-- Connect functions to events
userInputService.InputBegan:Connect(onInputBegan)
runService.Heartbeat:Connect(checkAndTeleport)
updateSettings()
