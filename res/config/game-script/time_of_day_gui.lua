function data()
    return {
        guiInit = function()
            -- create and initialize ui elements
        end,

        guiHandleEvent = function(id, name, param)
            if id == "" and name == "button.click" then
                -- change environment with SetDayTime
            end
        end,
    }
end
