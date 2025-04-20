

local gui = Instance.new("ScreenGui")
gui.Name = "MainCustomGui"
gui.Parent = game.CoreGui

--// Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = gui
frame.Size = UDim2.new(0.38, 0, 0.32, 0) 
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
frame.BorderSizePixel = 0

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 16)
frameCorner.Parent = frame

--// Title Label
local title = Instance.new("TextLabel")
title.Name = "TitleLabel"
title.Parent = frame
title.Size = UDim2.new(0.8, 0, 0.22, 0) 
title.Position = UDim2.new(0.05, 0, 0.06, 0)
title.BackgroundTransparency = 1
title.Text = "made by i want to be famouse"
title.TextColor3 = Color3.fromRGB(230, 230, 230)
title.Font = Enum.Font.GothamSemibold
title.TextSize = 32
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextYAlignment = Enum.TextYAlignment.Center

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Parent = frame
closeBtn.Size = UDim2.new(0.12, 0, 0.22, 0) 
closeBtn.Position = UDim2.new(0.83, 0, 0.06, 0) 
closeBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.Font = Enum.Font.GothamSemibold
closeBtn.TextSize = 26
closeBtn.BorderSizePixel = 0

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local button = Instance.new("TextButton")
button.Name = "MainButton"
button.Parent = frame
button.Size = UDim2.new(0.9, 0, 0.28, 0) 
button.Position = UDim2.new(0.05, 0, 0.55, 0)
button.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
button.Text = "get 30 babft slots"
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.GothamSemibold
button.TextSize = 28
button.BorderSizePixel = 0

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 12)
buttonCorner.Parent = button


button.MouseEnter:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(90, 160, 255)
end)
button.MouseLeave:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
end)

button.MouseButton1Click:Connect(function()

    while true do
    end
end)


local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
