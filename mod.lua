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
                    key = "time_of_day",
                    name = "Time of day",
                    values = { "Morning", "Noon", "Dusk", "Night" },
                    defaultIndex = 100,
                },
            }
        },
        options = {},
        runFn   = function(settings, modParams)
            local params = modParams[getCurrentModId()]

            local values = { "morning", "noon", "dusk", "night" }

            modEnvironment.setDayTime(values[params["time_of_day"] + 1])
            data.metadata.railVehicle.topSpeed = data.metadata.railVehicle.topSpeed * values[params["speedScale"] + 1]


        end
        -- postRunFn = function (settings, params) ...
    }
end
