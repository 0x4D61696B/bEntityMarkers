-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

if (Tracker) then
    return
end

require "lib/lib_MapMarker"


-- =============================================================================
--  Variables
-- =============================================================================

Tracker = {}

local c_Battleframes = {
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

local c_DeployableMarkerData = {
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

local c_NameMarkerData = {
    -- --------------------------------------------------
    --  TODO: Objectives
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

local c_RadarEdgeMode = {
    ["EDGE_ALWAYS"] = MapMarker.EDGE_ALWAYS,
    ["EDGE_CULLED"] = MapMarker.EDGE_CULLED,
    ["EDGE_NONE"]   = MapMarker.EDGE_NONE
}

local g_Deployables     = {}
local g_PlayerTargetId  = -1

local w_MapMarkers      = {}


-- =============================================================================
--  Functions
-- =============================================================================

function Tracker.Setup()
    g_PlayerTargetId = Player.GetTargetId()
end

function Tracker.AddMapMarker(entityId, title, markerType, iconInfo)
    local markerId = tostring(entityId)

    if (w_MapMarkers[markerId]) then
        return
    end

    Debug.Table("AddMapMarker(" .. tostring(entityId) .. ")", {title = title, markerType = markerType, iconInfo = iconInfo})

    MARKER = MapMarker.Create("bem_" .. markerId)
    w_MapMarkers[markerId] = MARKER

    MARKER:BindToEntity(entityId, 100)
    MARKER:SetTitle(title.name)
    MARKER.cMarkerType = markerType

    if (title.sub) then
        MARKER:SetSubtitle(title.sub)
    end

    if (iconInfo) then
        if (iconInfo.asset) then
            MARKER:GetIcon():SetIcon(iconInfo.asset)

        elseif (iconInfo.url) then
            MARKER:GetIcon():SetUrl(iconInfo.url)

        elseif (iconInfo.texture and iconInfo.region) then
            MARKER:GetIcon():SetTexture(iconInfo.texture, iconInfo.region)

        elseif (iconInfo.texture) then
            MARKER:GetIcon():SetTexture(iconInfo.texture)
        end
    end

    MARKER:SetRadarEdgeMode(c_RadarEdgeMode[Options.IO.Marker.RadarEdgeMode[markerType]])
    MARKER:SetThemeColor(Options.IO.Marker.Color[markerType])
    MARKER:ShowOnHud(Options.IO.Marker.HUD[markerType])
    MARKER:ShowOnRadar(Options.IO.Marker.Radar[markerType])
    MARKER:ShowOnWorldMap(Options.IO.Marker.WorldMap[markerType])

    if (Options.IO.Marker.Ping[markerType]) then
        MARKER:Ping()
    end
end

function Tracker.RemoveMapMarker(entityId)
    local markerId = tostring(entityId)

    if (w_MapMarkers[markerId]) then
        Debug.Log("RemoveMapMarker()", entityId)
        w_MapMarkers[markerId]:Destroy()
        w_MapMarkers[markerId] = nil
    end
end

function Tracker.CheckEntity(entityId)
    if (not Options.IO.General.Enable or entityId == g_PlayerTargetId) then
        return

    elseif (Game.IsTargetAvailable(entityId)) then
        local entityInfo = Game.GetTargetInfo(entityId)

        -- Abort if there is no entityInfo or entityInfo.type
        if (not entityInfo or not entityInfo.type) then
            Debug.Warn("No entityInfo or entityInfo.type:", entityId)
            return

        -- Player character tracking
        elseif (entityInfo.type == "character" and not entityInfo.isNpc and entityInfo.name) then
            local entityName = ChatLib.StripArmyTag(entityInfo.name)

            -- Tracking by name
            if (Options.IO.Character.Name.Enable and Options.IO.Character.Name.List[entityName]) then
                Tracker.AddMapMarker(entityId, {name = entityName}, "Name", {asset = 159939})

            -- Tracking of special characters like developers and mentors
            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Developer and entityInfo.isDev) then
                Tracker.AddMapMarker(entityId, {name = "<Developer> " .. entityName}, "Special", {texture = "icons", region = "r5_logo"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Ranger and entityInfo.isRanger) then
                Tracker.AddMapMarker(entityId, {name = "<Ranger> " .. entityName}, "Special", {texture = "Ranger"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Publisher and entityInfo.isPublisher) then
                Tracker.AddMapMarker(entityId, {name = "<Publisher> " .. entityName}, "Special", {texture = "Publisher"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Mentor and entityInfo.isMentor) then
                Tracker.AddMapMarker(entityId, {name = "<Mentor> " .. entityName}, "Special", {texture = "Mentor"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Army and entityInfo.army_member) then
                Tracker.AddMapMarker(entityId, {name = "<Army> " .. entityName}, "Special", {asset = 159939})

            -- Tracking by battleframe
            elseif (Options.IO.Character.Frame.Enable and entityInfo.battleframe and Options.IO.Character.Frame["_" .. entityInfo.battleframe] and entityInfo.frame_icon_id  and c_Battleframes[tonumber(entityInfo.frame_icon_id)] and Options.IO.Character.Frame[c_Battleframes[tonumber(entityInfo.frame_icon_id)]]) then
                Tracker.AddMapMarker(entityId, {name = "<" .. c_Battleframes[tonumber(entityInfo.frame_icon_id)] .. "> " .. entityName}, "Frame")

            -- Remove marker if existent
            else
                Tracker.RemoveMapMarker(entityId)
            end

        -- Deployable tracking
        elseif (entityInfo.type == "deployable" and entityInfo.deployableTypeId) then

            -- Check if there is an entry defined for this deployableTypeId and if it is enabled
            if (c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)] and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)) then
                local markerData = c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)
                Tracker.AddMapMarker(entityId, {name = markerData.title}, markerData.markerType, markerData.iconInfo)

            -- Remove marker if existent
            else
                Tracker.RemoveMapMarker(entityId)
            end

        -- Tracking by name for "unknown" type of entities, such as Datapads in ARES missions
        elseif (entityInfo.type == "unknown" and entityInfo.name) then

            -- Check if there is an entry defined for this name and if it is enabled
            if (c_NameMarkerData[entityInfo.name] and c_NameMarkerData[entityInfo.name](entityInfo)) then
                local markerData = c_NameMarkerData[entityInfo.name](entityInfo)
                Tracker.AddMapMarker(entityId, {name = markerData.title}, markerData.markerType, markerData.iconInfo)

            -- Remove marker if existent
            else
                Tracker.RemoveMapMarker(entityId)
            end

        end
    end
end

function Tracker.CheckAvailableTargets()
    if (not Options.IO.General.Enable) then
        return
    end

    local availableTargets = Game.GetAvailableTargets()

    for _, entityId in pairs(availableTargets) do
        Tracker.CheckEntity(entityId)
    end
end

function Tracker.ClearMapMarkers()
    for k, _ in pairs(w_MapMarkers) do
        Tracker.RemoveMapMarker(k)
    end
end

function Tracker.UpdateDeployableRoster(args)
    if (args.tracking) then
        g_Deployables[tostring(args.entityId)] = true

    elseif (g_Deployables[tostring(args.entityId)]) then
        g_Deployables[tostring(args.entityId)] = nil
    end
end

function Tracker.UpdateMapMarkerVisibility()
    for _, MARKER in pairs(w_MapMarkers) do
        local markerType = MARKER.cMarkerType

        MARKER:SetRadarEdgeMode(c_RadarEdgeMode[Options.IO.Marker.RadarEdgeMode[markerType]])
        MARKER:SetThemeColor(Options.IO.Marker.Color[markerType])
        MARKER:ShowOnHud(Options.IO.Marker.HUD[markerType])
        MARKER:ShowOnRadar(Options.IO.Marker.Radar[markerType])
        MARKER:ShowOnWorldMap(Options.IO.Marker.WorldMap[markerType])
    end
end
