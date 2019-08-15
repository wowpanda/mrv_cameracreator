scaleformon = false

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
    if UpdateOnscreenKeyboard() ~= 2 then
		result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		return result
	else
		Citizen.Wait(500)
		return nil
	end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        if scaleformon then
            local scaleform = RequestScaleformMovie("mp_big_message_freemode")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            PushScaleformMovieMethodParameterString(_U"cam_successfull")
            PushScaleformMovieMethodParameterString(_U"in_yourcamera")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            EndScaleformMovieMethod()
        end
    end
end)