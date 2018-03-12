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
		OnCommand=function(self) self:xy(10,40) end;
		--BackKeyPress,BackgroundYSize,BackgroundXSize,BackgroundBlinkDuration
		SimSys.SimScroll({"screen,ScreenInit",22,15,1},{
		--ButtonName,Command,yoffset,halign,TextActiveColour,TextInactiveColour,TextActiveBackground1,TextActiveBackground2,MoveToNextScreenDuration
			{"GameStart",
				"applydefaultoptions;style,single;screen,ScreenSimpleSelectMusic"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
			{"Options",
				"screen,ScreenOptionsService"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
			{"Editor",
				"screen,ScreenColorChange"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
			{"Color",
				"urlnoexit,https://arrowvortex.ddrnl.com/"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
			{"Github",
				"urlnoexit,https://github.com/etternagame/etterna"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
			{"Exit",
				"screen,ScreenExit"
			,24,0,"#AAAAAA",ThemeColor,ThemeColor,ThemeColor.."00",0},
		});
	};
}