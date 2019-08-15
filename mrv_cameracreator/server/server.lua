RegisterServerEvent('mrv:saveinlua')
AddEventHandler('mrv:saveinlua', function(position, rotation)
	SaveResourceFile("mrv_cameracreator", "yourcamera.lua", "CreateCamera = function()\n      if not DoesCamExist(cam) then\n      cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', "..position..", -10.0, 0, 0, 60.0, true, 2)\n      SetCamActive(cam, true)\n      SetCamRot(cam2, 0.0, 0.0, " ..rotation..", true) \n   end\nend", -1)
end)