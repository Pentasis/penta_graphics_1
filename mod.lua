local modEnvironment = require "time_of_day_cycle"

function data()
    return {
        info    = {
            name           = _("Day and Night"),
            description    = _("Switch between different times of day."),
            authors        = {
                {
                    name = "Pentasis",
                    role = 'CREATOR',
                },
            },
            minorVersion   = 0,
            severityAdd    = "WARNING",
            severityRemove = "CRITICAL",
            params         = {}
        },
        options = {},
        runFn   = function(settings, modParams)
            modEnvironment.setDayTime("night")
        end
        -- postRunFn = function (settings, params) ...
    }
end
