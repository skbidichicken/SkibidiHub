--------------------
-- Shop Tab (with Duplicate for Grow a Garden)
--------------------
local Tab_Shop = Window:CreateTab("🛒 Shop", 7734053495)
Tab_Shop:CreateSection("Shop Features")

-- Example items to duplicate (edit as needed)
local duplicateItems = {"Basic Seed", "Golden Seed", "Diamond Pet", "Super Fertilizer"}

local selectedItem = duplicateItems[1]

Tab_Shop:CreateDropdown({
    Name = "Select Item to Duplicate",
    Options = duplicateItems,
    CurrentOption = duplicateItems[1],
    Callback = function(Value)
        selectedItem = Value
        Rayfield:Notify({Title="Duplicate",Content="Selected: "..Value,Duration=2})
    end
})

Tab_Shop:CreateButton({
    Name = "Duplicate Selected Item",
    Callback = function()
        -- Replace "DuplicateItem" with the correct RemoteEvent name for Grow a Garden!
        -- This is a template! You must fill in the real logic if you know it.
        local replicated = game:GetService("ReplicatedStorage")
        local remote = replicated:FindFirstChild("DuplicateItem") -- change to real RemoteEvent name

        if remote and remote:IsA("RemoteEvent") then
            -- This is a guess; you must use the correct arguments for your game!
            remote:FireServer(selectedItem)
            Rayfield:Notify({Title="Duplicate",Content="Sent duplicate request for "..selectedItem,Duration=2})
        else
            Rayfield:Notify({Title="Duplicate",Content="Duplicate Remote not found! Edit script with real RemoteEvent name.",Duration=3})
        end
    end
})

Tab_Shop:CreateButton({
    Name = "Buy Best Item",
    Callback = function()
        Rayfield:Notify({Title="Shop",Content="Best item purchased!",Duration=2})
    end
})

Tab_Shop:CreateToggle({
    Name = "Auto-Buy Items",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title="Shop",Content="Auto-Buy: "..tostring(Value),Duration=2})
    end
})
