local environmentutil = require "environmentutil"

local envcycle = {}

local function setMorning(filename, environment)
    environment.light = {
        direction = { .945, .0037, .328 },
        pmremShadow = "environment/blue_clear/shadow.dds",
        pmremSun = "environment/blue_clear/sun.dds",
        refBrightness = .5
    }

    environment.atmosphere = {
        sunColor = { 1.147, .952, .681 },
        rayleightExtinctionCoeff = environmentutil.rayleighExtinctionCoeff(2.0),
        mieScatteringCoeff = environmentutil.mieScatteringCoeff(2.0),
        phaseG = -.6,
        rayleightScaleHeight = 280.0,
        mieScaleHeight = 250.0
    }

    environment.water = {
        normalTex = "environment/water_normal.dds",
        normalScale = .4,
        roughness = .5,

        depthColorTex = "environment/blue_clear/depthColor.dds",
        extinctionCoeff = .05
    }

    environment.skyBox = {
        texture = "environment/blue_clear/skybox.dds",
    }

    return environment
end

local function setNoon(filename, environment)
    -- this is the default
    environment.light = {
        direction = { .660, .0029, .751 },
        pmremShadow = "environment/temperate/shadow.dds",
        pmremSun = "environment/temperate/sun.dds",
        refBrightness = .5
    }

    environment.atmosphere = {
        sunColor = { 1.048, .961, .851 },
        rayleightExtinctionCoeff = environmentutil.rayleighExtinctionCoeff(3.0),
        mieScatteringCoeff = environmentutil.mieScatteringCoeff(1.0),
        phaseG = -.75,
        rayleightScaleHeight = 280.0,
        mieScaleHeight = 200.0
    }

    environment.water = {
        normalTex = "environment/water_normal.dds",
        normalScale = .4,
        roughness = .5,

        depthColorTex = "environment/temperate/depthColor.dds",
        extinctionCoeff = .05
    }

    environment.skyBox = {
        texture = "environment/temperate/skybox.dds",
    }

    return environment
end

local function setDusk(filename, environment)
    environment.light = {
        direction = { 1, 1, .375 },
        pmremShadow = "environment/sunset/shadow.dds",
        pmremSun = "environment/sunset/sun.dds",
        refBrightness = 1.25
    }

    environment.atmosphere = {
        sunColor = { 0.65, 0.25, -0.38 },
        rayleightExtinctionCoeff = environmentutil.rayleighExtinctionCoeff(3.0),
        mieScatteringCoeff = environmentutil.mieScatteringCoeff(1.0),
        phaseG = -.75,
        rayleightScaleHeight = 20.0,
        mieScaleHeight = 500.0
    }

    environment.water = {
        normalTex = "environment/water_normal.dds",
        normalScale = .6,
        roughness = 1.0,

        depthColorTex = "environment/sunset/depthColor.dds",
        extinctionCoeff = .05,
    }

    environment.skyBox = {
        texture = "environment/sunset/cloudy_sunset.dds",
    }

    return environment
end

local function setNight(filename, environment)
    environment.light = {
        direction = { .660, .0029, .751 },
        pmremShadow = "environment/temperate/shadow.dds",
        pmremSun = "environment/temperate/sun.dds",
        refBrightness = 80
    }

    environment.atmosphere = {
        sunColor = { .05, .05, .05 },
        rayleightExtinctionCoeff = environmentutil.rayleighExtinctionCoeff(3.0),
        mieScatteringCoeff = environmentutil.mieScatteringCoeff(1.0),
        phaseG = -.75,
        rayleightScaleHeight = 280.0,
        mieScaleHeight = 200.0
    }

    environment.water = {
        normalTex = "environment/water_normal.dds",
        normalScale = .4,
        roughness = .5,

        depthColorTex = "environment/temperate/depthColor.dds",
        extinctionCoeff = .05
    }

    environment.skyBox = {
        texture = "environment/night/skybox.dds",
    }

    return environment
end

function envcycle.setDayTime(daytime)
    if daytime == "morning" then
        addModifier("loadEnvironment", setMorning)
    elseif daytime == "dusk" then
        addModifier("loadEnvironment", setDusk)
    elseif daytime == "night" then
        addModifier("loadEnvironment", setNight)
    else
        addModifier("loadEnvironment", setNoon)
    end
end

return envcycle
