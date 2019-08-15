_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Camera Creator", _U"development_tool", 5, 300, "mrv_cameracreator", "mrv_cameracreator")
_menuPool:Add(mainMenu)

local function AddCameraCreatorMenu(menu)
    
    addcamera = NativeUI.CreateItem(_U"add_camera", "")
    chooseposition = NativeUI.CreateItem(_U"choose_position", "")

    menu:AddItem(addcamera)
    
    menu.OnItemSelect = function(menu, item)
        if item == addcamera then
            ShowNotification(_U"now_choosepos")
            _menuPool:CloseAllMenus()
            resultpos = KeyboardInput("Exemple : 128.477, 993.234, 12.129", "", 30)
            ShowNotification(_U"now_chooserotation")
            resultheading = KeyboardInput("Exemple : 478.021", "", 30)
            TriggerServerEvent('mrv:saveinlua', resultpos, resultheading)
            scaleformon = true
            Citizen.Wait(5000)
            scaleformon = false
        end
     end
end

AddCameraCreatorMenu(mainMenu)
_menuPool:RefreshIndex()
_menuPool:MouseEdgeEnabled (false);

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 83) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)