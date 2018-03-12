


return Def.ActorFrame {
  InitCommand=function(self)
  	self:Center()
  end;
	LoadActor(THEME:GetPathG("","TitleScreen/woop.png")) .. {
		OnCommand=function(self)
			self:zoomto(SCREEN_WIDTH,150):diffusealpha(0):linear(1):diffusealpha(1):sleep(1.75):linear(2):diffusealpha(0)
		end	
	},
	Def.ActorFrame {
	  OnCommand=function(self)
	  	self:playcommandonchildren("ChildrenOn")
		self:sleep(1):linear(3):diffuse(color(SimSys.ConfigLoadSys("TitleColor","#800080","ThemeColor.ini"))):diffusealpha(0)
		
	  end;
	  ChildrenOnCommand=function(self)
	  	self:diffusealpha(0):sleep(0.5):linear(0.5):diffusealpha(1)
	  end;
		LoadFont("Common Normal") .. {
			Text=THEME:GetThemeDisplayName();
			InitCommand=function(self)
				self:y(-24)
			end;
		},
		LoadFont("Common Normal") .. {
			Text="Created by " .. SimSys.GetRandTxt(SimSys.ThemeGetPath("Graphics/TitleScreen/User.txt"));
			InitCommand=function(self)
				self:y(16):zoom(0.75):maxwidth(SCREEN_WIDTH)
			end;
		},
	}
}
