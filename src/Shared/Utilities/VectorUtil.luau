--[[
	VectorUtil.luau
	
	Utility module for Vector2 and Vector3 operations.
	Provides functions for vector serialization, deserialization, and mathematical operations.
--]]

local VectorUtil = {}

function VectorUtil.deserializeVector2(posString: string): Vector2
	local x, y = posString:match("%(([-%d%.]+),%s*([-%d%.]+)%)")
	if not x or not y then
		error("Invalid Vector2 format: " .. tostring(posString))
	end
	return Vector2.new(tonumber(x), tonumber(y))
end

function VectorUtil.serializeVector2(vec: Vector2): string
	return "(" .. tostring(vec.X) .. "," .. tostring(vec.Y) .. ")"
end

function VectorUtil.minVec2(a: Vector2, b: Vector2): Vector2
	return Vector2.new(
		math.min(a.X, b.X),
		math.min(a.Y, b.Y)
	)
end

function VectorUtil.maxVec2(a: Vector2, b: Vector2): Vector2
	return Vector2.new(
		math.max(a.X, b.X),
		math.max(a.Y, b.Y)
	)
end

function VectorUtil.yawToDirection(yaw : number) : Vector3
	return Vector3.new(math.sin(yaw), 0, math.cos(yaw))
end

function VectorUtil.absVec2(a :Vector2) : Vector2

	return Vector2.new(math.abs(a.X) , math.abs(a.Y))

end

function VectorUtil.midVec2(a: Vector2, b: Vector2): Vector2
	
	return Vector2.new(
		a.X + b.X / 2,
		a.Y + b.Y / 2
	)

end

function VectorUtil.deserializeVector3(posString: string): Vector3
	local x, y, z = posString:match("%(([-%d%.]+),%s*([-%d%.]+),%s*([-%d%.]+)%)")
	if not x or not y or not z then
		error("Invalid Vector3 format: " .. tostring(posString))
	end
	return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
end

function VectorUtil.serializeVector3(vec: Vector3): string
	return "(" .. tostring(vec.X) .. "," .. tostring(vec.Y) .. "," .. tostring(vec.Z) .. ")"
end

function VectorUtil.randomVector(min: number, max: number): Vector3
	return Vector3.new(
		math.random() * (max - min) + min,
		math.random() * (max - min) + min,
		math.random() * (max - min) + min
	)
end

function VectorUtil.generateRotationVec(rotation: number)
	local rad = math.rad(rotation)

	return Vector2.new(math.cos(rad), math.sin(rad))
end

--rotation is in radians, +clockwise, -anticlockwise
function VectorUtil.rotateVec2Around(point: Vector2,pivot: Vector2,rotation: number): Vector2
	-- Translate to origin
	local translated = point - pivot

	local cos = math.cos(rotation)
	local sin = math.sin(rotation)

	-- Clockwise rotation matrix
	local rotated = Vector2.new(translated.X * cos + translated.Y * sin, -translated.X * sin + translated.Y * cos)

	-- Translate back
	return rotated + pivot
end
return VectorUtil
