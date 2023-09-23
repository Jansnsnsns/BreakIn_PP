local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Break In++ v1.0", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.


]]
OrionLib:MakeNotification({
	Name = "Break In++ v1.0",
	Content = "Loaded Successfully!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]
local Tab1 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Lobby",
	Icon = "rbxassetid://5844473643",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://915827090",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]


--[[
Name = <string> - The name of the section.
]]

local Section = Tab2:AddSection({
	Name = "Break In"
})
Tab2:AddButton({
	Name = "The Swat",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("SwatGun")
	end    
})
Tab2:AddButton({
	Name = "The Officer",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Gun")
	end    
})

Tab2:AddButton({
	Name = "The Fighter",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("LinkedSword")
	end    
})

Tab2:AddButton({
	Name = "The Protector",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Bat")
	end    
})

Tab2:AddButton({
	Name = "The Medic",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("MedKit")
	end    
})



Tab2:AddButton({
	Name = "The Hyper",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Lollipop")
	end    
})

Tab2:AddButton({
	Name = "The Hungry",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Chips")
	end    
})
local Section = Tab2:AddSection({
	Name = "Break In 2 "
})

Tab2:AddButton({
	Name = "The Hacker",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Phone")
	end    
})
Tab2:AddButton({
	Name = "The Nerd",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Book")
	end    
})

Tab2:AddButton({
	Name = "The Protector",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Bat")
	end    
})

Tab2:AddButton({
	Name = "The Medic",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("MedKit")
	end    
})



Tab2:AddButton({
	Name = "The Hyper",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Lollipop")
	end    
})

Tab2:AddButton({
	Name = "The Sporty",
	Callback = function()
		game.ReplicatedStorage.RemoteEvents.OutsideRole:FireServer("Bottle")
	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

--[[
Name = <string> - The name of the section.
]]

local ItemToGive

local Section1 = Tab3:AddSection({
	Name = "Break In"
})
local drop1 = Tab3:AddDropdown({
	Name = "Items List",
	Default = "None",
	Options = {"None", "Apple", "BloxyCola", "ExpiredBloxyCola", "Chips", "Lollipop", "Pie", "Bat", "LinkedSword", "Crowbar", "MedKit", "Cure"},
	Callback = function(Value)
		print(Value)
		ItemToGive = Value
	end    
})

Tab3:AddButton({
	Name = "Give Item",
	Callback = function()
		if game.ReplicatedStorage:FindFirstChild("RemoteEvents") then
			game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer(ItemToGive)
		else 
			game.ReplicatedStorage.Events.GiveTool:FireServer(ItemToGive)
		end
	end    
}
)

Tab3:AddButton({
	Name = "Cure Yourself",
	Callback = function()
		game.Players.LocalPlayer.Backpack.Cure.Parent = game.Players.LocalPlayer.Character 
		game.ReplicatedStorage.RemoteEvents.CurePlayer:FireServer(	game.Players.LocalPlayer.Name)
	end    
}
)

Tab3:AddButton({
	Name = "Clear Backpack",
	Callback = function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA("Tool") then
				if v.Name == "SwatGun" or v.Name == "Gun" then return
				else 
					v:Destroy()
				end
			end
		end
	end    
}
)


defMoney = 0

Tab3:AddTextbox({
	Name = "Give Money",
	Default = "0",
	TextDisappear = false,
	Callback = function(Value)
	--	defMoney 
		print(Value)
		game.ReplicatedStorage.RemoteEvents.GiveMoney:FireServer(tonumber(Value))
	end	  
})

--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]



Tab3:AddToggle({
	Name = "BadGuys ESP",
	Default = false;
	Callback = function(Val)
		if  Val == true then
			for i,v in pairs(workspace.BadGuys:GetChildren()) do
				local high = Instance.new("Highlight",v)
				high.Enabled = true
			end
		else 
			for i,v in pairs(workspace.BadGuys:GetChildren()) do
				local high = Instance.new("Highlight",v)
				high.Enabled = false
			end
		end
	end    
}
)

Tab3:AddToggle({
	Name = "Teammates ESP",
	Default = false;
	Callback = function(Val)
		if  Val == true then
			
				for _,x in pairs(game.Players:GetPlayers()) do

					local high = Instance.new("Highlight",x.Character) 
					high.FillColor = Color3.fromRGB(47, 255, 0)
					high.Enabled = true


				end
				
		else 
			
				for _,x in pairs(game.Players:GetPlayers()) do
					
						local high = Instance.new("Highlight",x.Character) 
						high.FillColor = Color3.fromRGB(47, 255, 0)
						high.Enabled = false
					
				
			end
		end
	end    
}
)



--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]
local Section1 = Tab1:AddSection({
	Name = "Player"
})
local Slider1 = Tab1:AddSlider({
	Name = "WalkSpeed",
	Min = 1,
	Max = 150,
	Default = 16,
	Color = Color3.fromRGB(139, 139, 139),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		print(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab1:AddButton({
	Name = "Reset WalkSpeed",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		Slider1:Set(16)
	end    
})


--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maxium value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
OrionLib:Init()
