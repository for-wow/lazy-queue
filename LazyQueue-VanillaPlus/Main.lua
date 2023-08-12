local _G = getfenv()
local LazyQueue = _G.LazyQueue

local frame = CreateFrame('Frame')
LazyQueue.frame = frame

frame:SetScript('OnEvent', function()
	this[event](this)
end)

frame:RegisterEvent('ADDON_LOADED')
frame:RegisterEvent('BATTLEFIELDS_SHOW')
frame:RegisterEvent('ZONE_CHANGED_NEW_AREA')

function LazyQueue.Join()
	if _G.LazyQueueDB.WSG then
		SendChatMessage('.wsg')
	end
	if _G.LazyQueueDB.AB then
        SendChatMessage('.ab')
	end
	if _G.LazyQueueDB.AC then
		SendChatMessage('.ac')
	end
end

function frame:ADDON_LOADED()
	if arg1 ~= 'LazyQueue-VanillaPlus' then
		return
	end
    
	if not _G.LazyQueueDB then
		_G.LazyQueueDB = {}
	end
    
	LazyQueue.UI.Load()
	
	if not _G.LazyQueueDB.enabled then
		return
	end
	
	-- don't attempt to queue from bg!
	local zone = _G.GetRealZoneText()
	if zone ~= 'Warsong Gulch' and zone ~= 'Arathi Basin' and zone ~= 'Azshara Crater' then
		LazyQueue.Join()
	end
end

function frame:ZONE_CHANGED_NEW_AREA()
	if not _G.LazyQueueDB.enabled then
		return
	end

    if UnitOnTaxi('player') then
        return
    end
	
	-- don't attempt to queue from bg!
	local zone = _G.GetRealZoneText()
	if zone ~= 'Warsong Gulch' and zone ~= 'Arathi Basin' and zone ~= 'Azshara Crater' then
		LazyQueue.Join()
	end
end


function frame:BATTLEFIELDS_SHOW()
	local bg = GetBattlefieldInfo()
	local asGroup = 0
	
	if GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 and IsPartyLeader() then
		asGroup = 1
	end
	
	if _G.LazyQueueDB.WSG and bg == 'Warsong Gulch' then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	elseif _G.LazyQueueDB.AB and bg == 'Arathi Basin' then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	elseif _G.LazyQueueDB.AC and bg == 'Azshara Crater' then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	end
end
