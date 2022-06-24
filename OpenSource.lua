
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local White = Instance.new("TextLabel")
local Red = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local White_2 = Instance.new("TextLabel")
local White_3 = Instance.new("TextLabel")
local Fram_3 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Counter = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.409219861, 0, 0.5694592, 0)
Frame.Size = UDim2.new(0, 256, 0, 123)

Frame_2.Name = "Frame_2"
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame_2.BorderColor3 = Color3.fromRGB(20, 20, 20)
Frame_2.Size = UDim2.new(0, 256, 0, 37)

White.Name = "White"
White.Parent = Frame_2
White.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
White.BackgroundTransparency = 1.000
White.Position = UDim2.new(0.08203125, 0, 0, 0)
White.Size = UDim2.new(0, 53, 0, 37)
White.Font = Enum.Font.GothamBlack
White.Text = "SLA"
White.TextColor3 = Color3.fromRGB(255, 255, 255)
White.TextSize = 25.000

Red.Name = "Red"
Red.Parent = Frame_2
Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Red.BackgroundTransparency = 1.000
Red.Position = UDim2.new(0.22265625, 0, 0, 0)
Red.Size = UDim2.new(0, 53, 0, 37)
Red.Font = Enum.Font.GothamBlack
Red.Text = "YX"
Red.TextColor3 = Color3.fromRGB(255, 0, 0)
Red.TextSize = 25.000

UICorner.Parent = Frame_2

White_2.Name = "White"
White_2.Parent = Frame_2
White_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
White_2.BackgroundTransparency = 1.000
White_2.Position = UDim2.new(0.3515625, 0, 0, 0)
White_2.Size = UDim2.new(0, 39, 0, 37)
White_2.Font = Enum.Font.GothamBlack
White_2.Text = "|"
White_2.TextColor3 = Color3.fromRGB(255, 255, 255)
White_2.TextSize = 25.000

White_3.Name = "White"
White_3.Parent = Frame_2
White_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
White_3.BackgroundTransparency = 1.000
White_3.Position = UDim2.new(0.59375, 0, 0, 0)
White_3.Size = UDim2.new(0, 53, 0, 37)
White_3.Font = Enum.Font.GothamBlack
White_3.Text = "Cash Counter"
White_3.TextColor3 = Color3.fromRGB(255, 255, 255)
White_3.TextSize = 19.000

Fram_3.Name = "Fram_3"
Fram_3.Parent = Frame
Fram_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Fram_3.BorderColor3 = Color3.fromRGB(25, 25, 25)
Fram_3.Position = UDim2.new(0.02734375, 0, 0.357723564, 0)
Fram_3.Size = UDim2.new(0, 242, 0, 73)

UICorner_2.Parent = Fram_3

Counter.Name = "Counter"
Counter.Parent = Fram_3
Counter.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Counter.BackgroundTransparency = 1.000
Counter.Position = UDim2.new(0, 0, 0.178082198, 0)
Counter.Size = UDim2.new(0, 242, 0, 49)
Counter.Font = Enum.Font.GothamBlack
Counter.Text = "$100.000.000"
Counter.TextColor3 = Color3.fromRGB(255, 255, 255)
Counter.TextSize = 23.000

UICorner_3.Parent = Frame

-- Scripts:

local function REKO_fake_script() -- Counter.LocalScript 
	local script = Instance.new('LocalScript', Counter)

	while wait() do
		pcall(function()
			local amount = 0
			for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
				if v.Name == "MoneyDrop" then
					local cash = string.split(v.BillboardGui.TextLabel.Text,"$")[2]
					if string.match(cash,',') then
						amount = amount + cash:gsub("%,","")
					else
						amount = amount + cash
					end
				end
			end
			local function checking(amount)
				amount = tostring(amount)
				return amount:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
			end
			script.Parent.Text = "$"..checking(amount).. " "
		end)
	end
end
coroutine.wrap(REKO_fake_script)()
local function HETEFAA_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.25
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
	
end
coroutine.wrap(HETEFAA_fake_script)()
