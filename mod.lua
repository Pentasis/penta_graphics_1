local modEnvironment = require "time_of_day"

function data()
    return {
        info    = {
            name           = "Day and Night",
            description    = "Switch between different times of day.",
            authors        = {
                {
                    name = "Pentasis",
                    role = 'CREATOR',
                },
            },
            minorVersion   = 0,
            severityAdd    = "WARNING",
            severityRemove = "CRITICAL",
            params         = {
                {
                    key = "timeofday",
                    name = "Time of day",
                    uiType = "BUTTON",
                    values = { "Morning", "Noon", "Dusk", "Night" },
                    defaultIndex = 1,
                },
            },
        },
        options = {},
        runFn   = function(settings, modParams)
            local params = modParams[getCurrentModId()]
            local timeValues = { "morning", "noon", "dusk", "night" }
            -- local cloudValues = { "clear", "cloudy", "overcast" }

            -- TODO: split up into time/weather
            modEnvironment.setDayTime(timeValues[params["timeofday"] + 1])
        end
        -- postRunFn = function (settings, params) ...
    }
end
