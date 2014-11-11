function schatLib.displayFrame(frame)
 if not createFrame then
  windowRef = ProbablyEngine.interface.buildGUI(frame)
  createFrame = true
  frameState = true
  windowRef.parent:SetEventListener('OnClose', function()
   createFrame = false
   frameState = false
  end)
 elseif createFrame == true and frameState == true then
  windowRef.parent:Hide()
  frameState = false
 elseif createFrame == true and frameState == false then
  windowRef.parent:Show()
  frameState = true
 end
end