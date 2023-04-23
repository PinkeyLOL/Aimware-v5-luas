local hitscan_TAB = gui.Reference("Ragebot", "Hitscan", "Advanced")
local target_fps = gui.Slider(hitscan_TAB, "rbot.hitscan.fps.target", "Initial FPS", 200, 60, 400)
local fps_scale = gui.Slider(hitscan_TAB, "rbot.hitscan.fps.scale", "Optimierungsstufe", 1.5, 1, 4)
local min_fps = gui.Slider(hitscan_TAB, "rbot.hitscan.fps.min", "Minimum FPS", 100, 30, 200)
local perf_opt = gui.Checkbox(hitscan_TAB, "rbot.hitscan.fps.perf.opt", "Optimierung aktivieren", true)

target_fps:SetDescription("Legen Sie den normalen Frame-Wert fest, wenn nicht injiziert") 
fps_scale:SetDescription("Je höher der Optimierungsgrad, desto größer die FPS-Erhöhung, aber dies beeinträchtigt die Analyseleistung")
min_fps:SetDescription("Legen Sie das gewünschte FPS-Minimum fest")
perf_opt:SetDescription("Wenn der FPS-Wert niedriger als das Minimum ist, deaktivieren Sie die Funktionen, die die FPS am meisten beeinflussen")

local frame_rate = 0.0

local function get_abs_fps() 
    frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * globals.AbsoluteFrameTime()
    return (1.0 / frame_rate) + 0.5
end

local function on_draw()
    local alpha_beta = ((get_abs_fps() / fps_scale:GetValue()) / target_fps:GetValue()) * 75
    gui.SetValue("rbot.hitscan.maxprocessingtime", alpha_beta)

    if(perf_opt:GetValue()) then
        if(get_abs_fps() <= min_fps:GetValue()) then
            gui.SetValue("esp.other.disablefarmodels", true)
            gui.SetValue("esp.other.norenderdead", true)
            gui.SetValue("esp.other.norenderenemy", true)
            gui.SetValue("esp.other.norenderteam", true)
            gui.SetValue("esp.other.norenderweapon", true)
            gui.SetValue("esp.world.inferno.enemy", false)
            gui.SetValue("esp.world.inferno.local", false)
            gui.SetValue("esp.world.inferno.friendly", false)
            gui.SetValue("esp.world.nadetracer.enemy", false)
            gui.SetValue("esp.world.nadetracer.local", false)
            gui.SetValue("esp.world.nadetracer.friendly", false)
        else
            gui.SetValue("esp.other.disablefarmodels", false)
            gui.SetValue("esp.other.norenderdead", false)
            gui.SetValue("esp.other.norenderenemy", false)
            gui.SetValue("esp.other.norenderteam", false)
            gui.SetValue("esp.other.norenderweapon", false)

            gui.SetValue("esp.world.inferno.enemy", true)
            gui.SetValue("esp.world.inferno.local", true)
            gui.SetValue("esp.world.inferno.friendly", true)
            gui.SetValue("esp.world.nadetracer.enemy", true)
            gui.SetValue("esp.world.nadetracer.local", true)
            gui.SetValue("esp.world.nadetracer.friendly", true)
        end
    else
        gui.SetValue("esp.other.disablefarmodels", false)
        gui.SetValue("esp.other.norenderdead", false)
        gui.SetValue("esp.other.norenderenemy", false)
        gui.SetValue("esp.other.norenderteam", false)
        gui.SetValue("esp.other.norenderweapon", false)

        gui.SetValue("esp.world.inferno.enemy", true)
        gui.SetValue("esp.world.inferno.local", true)
        gui.SetValue("esp.world.inferno.friendly", true)
        gui.SetValue("esp.world.nadetracer.enemy", true)
        gui.SetValue("esp.world.nadetracer.local", true)
        gui.SetValue("esp.world.nadetracer.friendly", true)
    end
end

callbacks.Register("Draw", on_draw)










--***********************************************--

print("♥♥♥ " .. GetScriptName() .. " loaded without Errors ♥♥♥")

