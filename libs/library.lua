-- Table to store your Library calls
schatLib = {}

SLASH_ROOTF1 = "/schat"
function SlashCmdList.ROOTF(msg, editbox)		
	local command = msg:match("^(.*)$")
	if command == "version" or "ver" then
		print("Current Version is: |cffC41F3B "  ..version)
		print("Please use a GitHub Clone to always be up to date")
		print("|cff7fffd4If you like this rotation, please consider donating to b0nze|r")
	end
end


-- Configure interface
function schatLib.displayFrame(frame)
	local displayFrame, windowRef
	if not displayFrame then
		windowRef = ProbablyEngine.interface.buildGUI(frame)
		displayFrame = true
		windowRef.parent:SetEventListener('OnClose', function()
			displayFrame = false
		end)
	end
end

-- Register library
ProbablyEngine.library.register("schatLib", schatLib)