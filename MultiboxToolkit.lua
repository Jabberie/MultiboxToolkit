--=====================================================================
SLASH_LEAVEPARTY1 = "/leaveparty"
SlashCmdList.LEAVEPARTY = function()
		if InCombatLockdown() then return end

       	if UnitInRaid('player') or UnitInParty('player') then
           if IsInInstance() then 
           	C_PartyInfo.LeaveParty(2)
           else
           	C_PartyInfo.LeaveParty(1)
      	end
    end	
end
--=====================================================================


--=====================================================================
SLASH_DISBANDGROUP1 = "/disbandgroup"
SlashCmdList.DISBANDGROUP = function()
	if InCombatLockdown() then return end

	if UnitInRaid('player') then
		for i = 1, GetNumGroupMembers() do
			local name, _, _, _, _, _, _, online = GetRaidRosterInfo(i)
			if online and name ~= E.myname then
				UninviteUnit(name)
			end
		end
	else
		for i = MAX_PARTY_MEMBERS, 1, -1 do
			if UnitExists('party'..i) then
				UninviteUnit(UnitName('party'..i))
			end
		end
	end

    if IsInInstance() then 
    	C_PartyInfo.LeaveParty(2)
    else
    	C_PartyInfo.LeaveParty(1)
    end
end
--=====================================================================


--=====================================================================
SLASH_RELOADUI1 = "/rl"
SlashCmdList.RELOADUI = ReloadUI;
--=====================================================================


--=====================================================================
SLASH_FRAMESTK1 = "/fs"; -- for quicker access to frame stack
SlashCmdList.FRAMESTK = function()
    LoadAddOn("Blizzard_DebugTools");
    FrameStackTooltip_Toggle();
end
--=====================================================================