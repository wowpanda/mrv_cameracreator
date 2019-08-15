CreateCamera = function()
      if not DoesCamExist(cam) then
      cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', 128.129, 120.777, 90.12, -10.0, 0, 0, 60.0, true, 2)
      SetCamActive(cam, true)
      SetCamRot(cam2, 0.0, 0.0, 128.120, true) 
   end
end