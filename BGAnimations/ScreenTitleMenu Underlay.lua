local ThemeColor = SimSys.ConfigLoadSys("TitleColor","#800080","ThemeColor.ini")

return Def.ActorFrame{
	LoadFont("Common Large") .. {
		InitCommand=function(self)
			self:xy(20,20):diffuse(color(ThemeColor)):valign(0):halign(0):settext(THEME:GetThemeDisplayName())
		end;
	};
	LoadActor(THEME:GetPathG("","TitleScreen/Lines")) .. {
		InitCommand=function(self) self:Center():diffuse(color(ThemeColor)):zoom(SimSys.Resize(self:GetWidth(),self:GetHeight(),SCREEN_WIDTH,SCREEN_HEIGHT)):zoomy(0.75) end;	
	};
	Def.ActorFrame{
		OnCommand=function(self) self:xy(10,SCREEN_CENTER_Y) end;
		--BackKeyPress,BackgroundYSize,BackgroundXSize,BackgroundBlinkDuration
		SimSys.SimScroll({"screen,ScreenInit",24,15,1},{
		--ButtonName,Command,yoffset,halign,TextActiveColour,TextInactiveColour,TextActiveBackground1,TextActiveBackground2,MoveToNextScreenDuration
			{"GameStart",
				"applydefaultoptions;style,single;screen,ScreenSelectMusic"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
			{"Options",
				"screen,ScreenOptionsService"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
			{"Color",
				"screen,ScreenColorChange"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
			{"Editor",
				"urlnoexit,https://arrowvortex.ddrnl.com/"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
			{"Github",
				"urlnoexit,https://github.com/etternagame/etterna"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
			{"Exit",
				"screen,ScreenExit"
			,26,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0.2},
		});
	};
}