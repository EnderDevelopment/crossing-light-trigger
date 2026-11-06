local Workspace = game:GetService("Workspace")

local activeTrain = nil
local trainTouchConnection = nil

local function findCrossingLight(instance)
	local current = instance
	while current and current ~= Workspace do
		if current.Name == "CrossingLight" then
			return current
		end
		current = current.Parent
	end
	return nil
end

local function enableLightTouch(instance)
	if instance:IsA("BasePart") and findCrossingLight(instance) then
		instance.CanTouch = true
	end
end

local function activateLightFromContact(touchedPart)
	local crossingLight = findCrossingLight(touchedPart)	
	if not crossingLight then
		return
	end

	local onValue = crossingLight:FindFirstChild("on", true)
	if onValue and onValue:IsA("BoolValue") then
		onValue.Value = true
	end
end

local function bindTrain(instance)
	if not instance:IsA("BasePart") or instance.Name ~= "train" then
		return
	end

	if trainTouchConnection then
		trainTouchConnection:Disconnect()
		trainTouchConnection = nil
	end

	activeTrain = instance
	activeTrain.CanTouch = true
	trainTouchConnection = activeTrain.Touched:Connect(function(touchedPart)
		if activeTrain == instance and instance.Parent == Workspace then
			activateLightFromContact(touchedPart)
		end
	end)
end

for _, descendant in ipairs(Workspace:GetDescendants()) do
	enableLightTouch(descendant)
end

Workspace.DescendantAdded:Connect(enableLightTouch)
Workspace.ChildAdded:Connect(bindTrain)
Workspace.ChildRemoved:Connect(function(instance)
	if instance == activeTrain then
		if trainTouchConnection then
			trainTouchConnection:Disconnect()
			trainTouchConnection = nil
		end
		activeTrain = nil
	end
end)

local existingTrain = Workspace:FindFirstChild("train")
if existingTrain then
	bindTrain(existingTrain)
end
