SimSys = {}

function SimSys.Resize(width,height,setwidth,sethight)

	if height >= sethight and width >= setwidth then
		if height*(setwidth/sethight) >= width then
			return sethight/height
		else
			return setwidth/width
		end
	elseif height >= sethight then
		return sethight/height
	elseif width >= setwidth then
		return setwidth/width
	else 
		return 1
	end
end

function SimSys.ConfigSaveSys(Name,Value,File)
	local rf = RageFileUtil.CreateRageFile()
	if FILEMAN:DoesFileExist("Config/"..File) then
		rf:Open("Config/"..File,3)
		local Content = rf:Read()
		local Output = ""
		for Line in string.gmatch(Content, "[^\r\n]+") do
			if string.find(Line,Name) then
				Output = Output..Name.."="..Value.."\n"
			else
				Output = Output..Line
			end
		end
		rf:Write(Output)
	else
		print("Error cant find file .. Creating it.")
		rf:Open("Config/"..File,2)
		rf:Write(Name.."="..Value.."\n")
	end	
	rf:Close()
	rf:destroy()
end

function SimSys.ConfigLoadSys(Name,FallbackValue,File)
	local rf = RageFileUtil.CreateRageFile()
	if FILEMAN:DoesFileExist("Config/"..File) then
		rf:Open("Config/"..File,1)
		local Content = rf:Read()
		for Line in string.gmatch(Content, "[^\r\n]+") do
			local Output =string.match(Line, Name.."=(.+)")
			if Output then
				rf:Close()
				rf:destroy()
				return Output
			end
		end
		print("Couldnt Find Line")
	else
		print("Error cant find file .. Creating it.")
		rf:Open("Config/"..File,2)
		rf:Write(Name.."="..FallbackValue.."\n")
		rf:Close()
		rf:destroy()
		return FallbackValue
	end	
end

function SimSys.GetRandTxt(File)
	local rf = RageFileUtil.CreateRageFile()
	if FILEMAN:DoesFileExist(File) then
		local Output = {}
		rf:Open(File,1)
		local Content = rf:Read()
		for Line in string.gmatch(Content, "[^\r\n]+") do
			local NoNo = string.match(Line, "#") -- we want to skip #
			if not NoNo then
				Output[#Output+1] = Line
			end				
		end
		return Output[math.random(#Output)]
	end
	rf:Close()
	rf:destroy()
	return "Error cant find file."
end

function SimSys.ThemeGetPath(File)
	return "Themes/"..THEME:GetCurThemeName().."/"..File
end