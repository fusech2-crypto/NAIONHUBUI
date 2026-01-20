-- NaiOn Hub | Stable Loader

task.spawn(function()
    -- รอให้เกมพร้อมจริง ๆ
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end

    -- กัน PlayerGui ยังไม่มา
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    if not lp then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        lp = Players.LocalPlayer
    end

    -- โหลด core พร้อม debug
    local ok, err = pcall(function()
        local src = game:HttpGet(
            "https://raw.githubusercontent.com/fusech2-crypto/NAIONHUBUI/main/core.lua"
        )
        loadstring(src)()
    end)

    if not ok then
        warn("[NaiOn Hub] Loader Error:")
        warn(err)
    end
end)
