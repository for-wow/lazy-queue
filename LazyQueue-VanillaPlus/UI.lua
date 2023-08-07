local _G = getfenv()
local LazyQueue = _G.LazyQueue

local UI = CreateFrame('Frame', nil, _G.HonorFrame)
LazyQueue.UI = UI

UI:SetPoint('BOTTOM', _G.HonorFrame, 'TOP', 5, -18)
UI:SetWidth(270)
UI:SetHeight(41)
UI:SetBackdrop({
	bgFile=[[Interface\Glues\Common\Glue-Tooltip-Background]],
	edgeFile=[[Interface\Glues\Common\Glue-Tooltip-Border]],
	tile = false,
	tileSize = 64,
	edgeSize = 16,
	insets = { left = 8, right = 6, top = 6, bottom = 8 }
})

do
	local checkboxEnabled = CreateFrame('CheckButton', nil, UI, 'UICheckButtonTemplate')
	UI.checkboxEnabled = checkboxEnabled
	checkboxEnabled:SetPoint('LEFT', 8, 2)
	
	checkboxEnabled:SetScript('OnClick', function()
		_G.LazyQueueDB.enabled = this:GetChecked()
	end)
	
	local label = checkboxEnabled:CreateFontString(nil, nil, 'GameFontNormalSmall')
	checkboxEnabled.label = label
	label:SetJustifyH('LEFT')
	label:SetPoint('LEFT', checkboxEnabled, 'RIGHT', 0, 0)
	label:SetText('Queue')
end

do
	local checkbox
	local label
	
	checkbox = CreateFrame('CheckButton', nil, UI, 'UICheckButtonTemplate')
	UI.checkboxWSG = checkbox
	checkbox:SetPoint('RIGHT', -140, 2)
	
	checkbox:SetScript('OnClick', function()
		_G.LazyQueueDB.WSG = this:GetChecked()
	end)
	checkbox:SetScript('OnEnter', function()
        GameTooltip:SetOwner(this, 'ANCHOR_CURSOR')
        GameTooltip:SetText('Warsong Gulch')
        GameTooltip:Show()
	end)
	checkbox:SetScript('OnLeave', function()
        GameTooltip:Hide()
	end)
	
	label = checkbox:CreateFontString(nil, nil, 'GameFontNormalSmall')
	checkbox.label = label
	label:SetJustifyH('LEFT')
	label:SetPoint('LEFT', checkbox, 'RIGHT', 0, 0)
	label:SetText('WSG')

	checkbox = CreateFrame('CheckButton', nil, UI, 'UICheckButtonTemplate')
	UI.checkboxAB = checkbox
	checkbox:SetPoint('RIGHT', -80, 2)
	
	checkbox:SetScript('OnClick', function()
		_G.LazyQueueDB.AB = this:GetChecked()
	end)
    checkbox:SetScript('OnEnter', function()
        GameTooltip:SetOwner(this, 'ANCHOR_CURSOR')
        GameTooltip:SetText('Arathi Basin')
        GameTooltip:Show()
	end)
	checkbox:SetScript('OnLeave', function()
        GameTooltip:Hide()
	end)
	
	label = checkbox:CreateFontString(nil, nil, 'GameFontNormalSmall')
	checkbox.label = label
	label:SetJustifyH('LEFT')
	label:SetPoint('LEFT', checkbox, 'RIGHT', 0, 0)
	label:SetText('AB')
	
	checkbox = CreateFrame('CheckButton', nil, UI, 'UICheckButtonTemplate')
	UI.checkboxAC = checkbox
	checkbox:SetPoint('RIGHT', -30, 2)
	
	checkbox:SetScript('OnClick', function()
		_G.LazyQueueDB.AC = this:GetChecked()
	end)
    checkbox:SetScript('OnEnter', function()
        GameTooltip:SetOwner(this, 'ANCHOR_CURSOR')
        GameTooltip:SetText('Azshara Crater')
        GameTooltip:Show()
	end)
	checkbox:SetScript('OnLeave', function()
        GameTooltip:Hide()
	end)
	
	label = checkbox:CreateFontString(nil, nil, 'GameFontNormalSmall')
	checkbox.label = label
	label:SetJustifyH('LEFT')
	label:SetPoint('LEFT', checkbox, 'RIGHT', 0, 0)
	label:SetText('AC')
end

function UI.Load()
	UI.checkboxEnabled:SetChecked(_G.LazyQueueDB.enabled)
	UI.checkboxWSG:SetChecked(_G.LazyQueueDB.WSG)
	UI.checkboxAB:SetChecked(_G.LazyQueueDB.AB)
	UI.checkboxAC:SetChecked(_G.LazyQueueDB.AC)
end
