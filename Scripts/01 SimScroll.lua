function SimSys.SimScroll(Base,scrolls)
	local cury = 1

	local scrolllist = Def.ActorFrame{
		OnCommand=function(self) SCREENMAN:GetTopScreen():AddInputCallback(SimSys.ScrollInput) scrollact = self end;
		NextScreenCommand=function(self) GAMESTATE:ApplyGameCommand(scrolls[cury][2]) end;
	}
	scrolllist[#scrolllist+1] = Def.Quad{Name="BackScroll";OnCommand=function(self) self:zoomto(string.len(scrolls[cury][1])*Base[3],Base[2]):horizalign(scrolls[cury][4]):y(cury*scrolls[cury][3]):diffuseshift(effectperiod,Base[4]):effectcolor1(color(scrolls[cury][7])):effectcolor2(color(scrolls[cury][8])) end}
	scrolllist[#scrolllist+1] = Def.Sound{Name="SoundChange";File=THEME:GetPathS("ScreenSelectMaster", "change")}
	scrolllist[#scrolllist+1] = Def.Sound{Name="SoundStart";File=THEME:GetPathS("ScreenSelectMaster", "start")}
	for scroll in pairs(scrolls) do
		local curtit = scrolls[scroll][6]
		if scroll == cury then
			curtit = scrolls[scroll][5]
		end
		scrolllist[#scrolllist+1] = LoadFont("OptionRow Title") .. {Name="Scroll"..scroll;Text=scrolls[scroll][1];OnCommand=function(self) self:horizalign(scrolls[scroll][4]):y(scroll*scrolls[scroll][3]):diffuse(color(curtit)) end;}
	end
	
	function SimSys.ScrollInput(event)
		if not event.PlayerNumber then return end
		if ToEnumShortString(event.type) == "FirstPress" then
			if event.GameButton == "Back" then
				GAMESTATE:ApplyGameCommand(Base[1]);
			end
			if event.GameButton == "MenuDown" then
				scrollact:GetChild("SoundChange"):play()
				scrollact:GetChild("Scroll"..cury):diffuse(color(scrolls[cury][6]))
				cury = cury + 1
			end 
			if event.GameButton == "MenuUp" then
				scrollact:GetChild("SoundChange"):play()
				scrollact:GetChild("Scroll"..cury):diffuse(color(scrolls[cury][6]))
				cury = cury - 1
			end
			if cury > #scrolls then cury = 1 end
			if cury < 1 then cury = #scrolls end
			scrollact:GetChild("BackScroll"):linear(0.1):y(cury*scrolls[cury][3]):zoomto(string.len(scrolls[cury][1])*Base[3],Base[2]):horizalign(scrolls[cury][4]):diffuseshift():effectperiod(Base[4]):effectcolor1(color(scrolls[cury][7])):effectcolor2(color(scrolls[cury][8]))
			scrollact:GetChild("Scroll"..cury):diffuse(color(scrolls[cury][5]))
			if event.GameButton == "Start" then
				scrollact:GetChild("SoundStart"):play()
				scrollact:sleep(scrolls[cury][9])
				scrollact:queuecommand("NextScreen")
			end
		end
	end
	return scrolllist
end