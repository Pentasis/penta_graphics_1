local modEnvironment = require "time_of_day"

local function initGui()
    local buttonMorning = api.gui.comp.Button.new(api.gui.comp.TextView.new("Morning"), true)
    local buttonNoon = api.gui.comp.Button.new(api.gui.comp.TextView.new("Noon"), true)
    local buttonDusk = api.gui.comp.Button.new(api.gui.comp.TextView.new("Dusk"), true)
    local buttonNight = api.gui.comp.Button.new(api.gui.comp.TextView.new("Night"), true)
    local buttonClear = api.gui.comp.Button.new(api.gui.comp.TextView.new("Clear"), true)
    local buttonCloudy = api.gui.comp.Button.new(api.gui.comp.TextView.new("Cloudy"), true)
    local buttonOvercast = api.gui.comp.Button.new(api.gui.comp.TextView.new("Overcast"), true)

    buttonMorning:onClick(function()
        --game.interface.sendScriptEvent("daytime_gui", "morning", { change = true })
        api.cmd.sendCommand(api.cmd.make.sendScriptEvent("time_of_day_gui.lua", "daytime_gui", "morning", { change = true }))
    end)

    buttonNoon:onClick(function()
        api.cmd.sendCommand(api.cmd.make.sendScriptEvent("time_of_day_gui.lua", "daytime_gui", "noon", { change = true }))
    end)

    buttonDusk:onClick(function()
        api.cmd.sendCommand(api.cmd.make.sendScriptEvent("time_of_day_gui.lua", "daytime_gui", "dusk", { change = true }))
    end)

    buttonNight:onClick(function()
        api.cmd.sendCommand(api.cmd.make.sendScriptEvent("time_of_day_gui.lua", "daytime_gui", "night", { change = true }))
    end)


    local gameInfoLayout = api.gui.util.getById("gameInfo"):getLayout()

    gameInfoLayout:addItem(api.gui.comp.Component.new("VerticalLine"))
    gameInfoLayout:addItem(buttonMorning)
    gameInfoLayout:addItem(buttonNoon)
    gameInfoLayout:addItem(buttonDusk)
    gameInfoLayout:addItem(buttonNight)
    gameInfoLayout:addItem(api.gui.comp.Component.new("VerticalLine"))
    gameInfoLayout:addItem(buttonClear)
    gameInfoLayout:addItem(buttonCloudy)
    gameInfoLayout:addItem(buttonOvercast)
end

function data()
    return {
        -- Engine Callbacks
        save = function() end,
        update = function() end,
        handleEvent = function(src, id, name, param)
            if id == "daytime_gui" then
                modEnvironment.setDayTime(name)
            end
        end,
        -- UI Callbacks
        guiInit = function()
            initGui()
        end,
        guiUpdate = function() end,
        guiHandleEvent = function(id, name, param) end,
        -- Engine & UI Callback
        load = function(loadedstate) end,
    }
end
