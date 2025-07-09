-- ThunderZ-like Pet GUI for Grow a Garden
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomPetHub"
gui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 350)
mainFrame.Position = UDim2.new(0, 30, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0

-- UI Corner for rounded edges
local uiCorner = Instance.new("UICorner", mainFrame)
uiCorner.CornerRadius = UDim.new(0, 8)

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🌱 Pet Control Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20

-- Toggle state
local autoBuy = false
local autoDup = false

-- Utility button function
local function createToggle(name, posY, toggleCallback)
	local button = Instance.new("TextButton", mainFrame)
	button.Size = UDim2.new(1, -40, 0, 40)
	button.Position = UDim2.new(0, 20, 0, posY)
	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 16
	button.Text = name .. ": OFF"

	local state = false
	button.MouseButton1Click:Connect(function()
		state = not state
		button.Text = name .. ": " .. (state and "ON" or "OFF")
		toggleCallback(state)
	end)
end

-- Toggle buttons
createToggle("Auto Buy", 60, function(on)
	autoBuy = on
end)

createToggle("Auto Duplicate", 120, function(on)
	autoDup = on
end)

-- Manual action buttons
local function createActionButton(text, posY, callback)
	local button = Instance.new("TextButton", mainFrame)
	button.Size = UDim2.new(1, -40, 0, 40)
	button.Position = UDim2.new(0, 20, 0, posY)
	button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 16
	button.Text = text
	button.MouseButton1Click:Connect(callback)
end

createActionButton("Duplicate Pets", 180, function()
	print(">> Duplicate Pets Triggered")
	-- Replace with actual duplication logic or RemoteEvent
end)

createActionButton("Buy Items", 240, function()
	print(">> Buy Items Triggered")
	-- Replace with item-buying RemoteEvent logic
end)

-- Loop for auto actions
task.spawn(function()
	while true do
		if autoBuy then
			print("Auto Buying...")
			-- Insert buy logic here
		end
		if autoDup then
			print("Auto Duplicating...")
			-- Insert duplication logic here
		end
		task.wait(3) -- Change interval as needed
	end
end)

