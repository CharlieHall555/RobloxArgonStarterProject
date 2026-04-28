--[[
	ListUtil.luau
	
	Utility module for list/array operations.
	Provides functions for list manipulation like difference, intersection, etc.
--]]

local ListUtil = {}

function ListUtil.difference(listA, listB)
    local result = {}
    local setB = {}

    for _, v in ipairs(listB) do
        setB[v] = true
    end

    for _, v in ipairs(listA) do
        if not setB[v] then
            table.insert(result, v)
        end
    end

    return result
end

function ListUtil.union(list1, list2)
    local result = {}
    local seen = {}

    for _, v in ipairs(list1) do
        if not seen[v] then
            table.insert(result, v)
            seen[v] = true
        end
    end

    for _, v in ipairs(list2) do
        if not seen[v] then
            table.insert(result, v)
            seen[v] = true
        end
    end

    return result
end

function ListUtil.get_keys(list)
    local keys = {}
    for k, _ in pairs(list) do
        table.insert(keys, k)
    end
    return keys
end

function ListUtil.generateList(params : {[any] : number})
    local outList = {}
    for key, v in pairs(params) do
        for _=1, v do
            table.insert(outList, key)
        end
    end
    return outList
end


return ListUtil