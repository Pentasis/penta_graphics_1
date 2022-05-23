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
        options = {
            daytime = { { "morning", _("Morning") }, { "noon", _("Noon") }, { "dusk", _("Dusk") }, { "night", _("Night") } },
        },
        runFn   = function(settings, modParams)
            local params = modParams[getCurrentModId()]

            local values = { "morning", "noon", "dusk", "night" }

            modEnvironment.setDayTime(values[params["timeofday"] + 1])
        end
        -- postRunFn = function (settings, params) ...
    }
end
