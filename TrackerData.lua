-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

c_Battleframes = {
    -- Assault
    [231827] = "Assault",
    [231670] = "Firecat",
    [231410] = "Tigerclaw",

    -- Biotech
    [231826] = "Biotech",
    [231698] = "Dragonfly",
    [231527] = "Recluse",

    -- Dreadnaught
    [231825] = "Dreadnaught",
    [231645] = "Arsenal",
    [231644] = "Mammoth",
    [231425] = "Rhino",

    -- Engineer
    [231824] = "Engineer",
    [231805] = "Bastion",
    [231694] = "Electron",

    -- Recon
    [231823] = "Recon",
    [231544] = "Nighthawk",
    [231528] = "Raptor"
}

c_DeployableMarkerData = {
    -- --------------------------------------------------
    --  Player deployables
    -- --------------------------------------------------

    -- Biotech
    [1018] = function(entityInfo) -- Healing Generator
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Biotech.Enable and Options.IO.Deployable.Biotech.HealingGenerator) then
            return {title = "Healing Generator", markerType = "Deployable", iconInfo = {asset = 202132}}

        else
            return false
        end
    end,

    -- Engineer
    [3198] = function(entityInfo) -- Engineer Anti-Personnel Turret
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Engineer.Enable and Options.IO.Deployable.Engineer.AntiPersonnelTurret) then
            return {title = "Anti-Personnel Turret", markerType = "Deployable", iconInfo = {asset = 202122}}

        else
            return false
        end
    end,

    [3156] = function(entityInfo) -- Energy Shield
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Engineer.Enable and Options.IO.Deployable.Engineer.DeployableShield) then
            return {title = "Deployable Shield", markerType = "Deployable", iconInfo = {asset = 202122}}

        else
            return false
        end
    end,

    [3117] = function(entityInfo) -- Heavy Turret - Rank I
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Engineer.Enable and Options.IO.Deployable.Engineer.HeavyTurret) then
            return {title = "Heavy Turret", markerType = "Deployable", iconInfo = {asset = 222499}}

        else
            return false
        end
    end,

    [4359] = function(entityInfo) -- Multi Turret
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Engineer.Enable and Options.IO.Deployable.Engineer.MultiTurret) then
            return {title = entityInfo.name, markerType = "Deployable", iconInfo = {asset = 222505}}

        else
            return false
        end
    end,

    [3197] = function(entityInfo) -- Supply Station
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Engineer.Enable and Options.IO.Deployable.Engineer.SupplyStation) then
            return {title = entityInfo.name, markerType = "Deployable", iconInfo = {asset = 222522}}

        else
            return false
        end
    end,

    -- Recon
    [657] = function(entityInfo) -- Remote Flashbang
        if (Options.IO.Deployable.Enable and Options.IO.Deployable.Recon.Enable and Options.IO.Deployable.Recon.RemoteFlashbang) then
            return {title = "Remote Explosive", markerType = "Deployable", iconInfo = {asset = 202119}}

        else
            return false
        end
    end,


    -- --------------------------------------------------
    --  Collectibles
    -- --------------------------------------------------

    [3858] = function(entityInfo) -- Codex
        if (Options.IO.Deployable.Collectible.Enable and Options.IO.Deployable.Collectible.Codex) then
            return {title = entityInfo.name, markerType = "Collectible", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [4067] = function(entityInfo) -- Relic Cache
        if (Options.IO.Deployable.Collectible.Enable and Options.IO.Deployable.Collectible.RelicCache) then
            return {title = entityInfo.name, markerType = "Collectible", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [4068] = function(entityInfo) -- Large Relic Cache
        if (Options.IO.Deployable.Collectible.Enable and Options.IO.Deployable.Collectible.RelicCache) then
            return {title = entityInfo.name, markerType = "Collectible", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,


    -- --------------------------------------------------
    --  TODO: Objectives
    -- --------------------------------------------------

    [948] = function(entityInfo) -- Chosen Strifebringer
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.ChosenStrifebringer) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [961] = function(entityInfo) -- Armored Aranha Nest
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.ArmoredAranhaNest) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [964] = function(entityInfo) -- Hijacked Terminal
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.HijackedTerminal) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1000] = function(entityInfo) -- Chosen Bomb
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.ChosenBomb) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1005] = function(entityInfo) -- Raider Distress Beacon
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.RaiderDistressBeacon) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1015] = function(entityInfo) -- Arcporter Pylon
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.ArcporterPylon) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1023] = function(entityInfo) -- Accord Terminal
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.AccordTerminal) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1052] = function(entityInfo) -- Intact Drill
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.RecoveryPayloadStorage) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1121] = function(entityInfo) -- Tainted Crystite Storage
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.RecoveryPayloadStorage) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1122] = function(entityInfo) -- Crystite Core Storage
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.RecoveryPayloadStorage) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    [1123] = function(entityInfo) -- Medical Supply Storage
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.RecoveryPayloadStorage) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end
}

c_NameMarkerData = {
    -- --------------------------------------------------
    --  Objectives
    -- --------------------------------------------------

    ["Accord Datapad"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.AccordDatapad) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Crashed Thumper Part"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.CrashedThumperPart) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Delirium Engine Core"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DeliriumEngineCore) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    -- Chosen Bomb
    ["Disruption Defuse Pin Black"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Black Resonator"] = function(entityInfo) -- PTS 1.7
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Disruption Defuse Pin Red"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Red Resonator"] = function(entityInfo) -- PTS 1.7
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Disruption Defuse Pin White"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["White Resonator"] = function(entityInfo) -- PTS 1.7
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DisruptionDefusePin) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    -- Recovery Payload
    ["Crystite Core"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.CrystiteCore) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Drill Parts"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.DrillParts) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Medical Supplies"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.MedicalSupplies) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end,

    ["Tainted Crystite"] = function(entityInfo)
        if (Options.IO.Deployable.Objective.Enable and Options.IO.Deployable.Objective.TaintedCrystite) then
            return {title = entityInfo.name, markerType = "Objective", iconInfo = {asset = 323286}}

        else
            return false
        end
    end
}
