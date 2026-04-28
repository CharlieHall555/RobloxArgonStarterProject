--[[
	PhysicsUtil.lua
	
	Utility module for physics-related operations.
	Provides functions for applying forces, impulses, and other physics effects.
--]]

local PhysicsUtil = {}

function  PhysicsUtil.impulse(attachment : Attachment , dir : Vector3 , force : number , length : number)
    local vectorForce = Instance.new("VectorForce")
    vectorForce.Attachment0 = attachment
    vectorForce.Force = dir * force
    vectorForce.RelativeTo = Enum.ActuatorRelativeTo.World
    vectorForce.Parent = attachment.Parent
    vectorForce.Visible = true
    
    task.delay(length, function()
        vectorForce:Destroy()
    end)
end

return PhysicsUtil