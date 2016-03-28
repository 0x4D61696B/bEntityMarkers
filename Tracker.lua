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
}

local c_RadarEdgeMode = {
    ["EDGE_ALWAYS"] = MapMarker.EDGE_ALWAYS,
    ["EDGE_CULLED"] = MapMarker.EDGE_CULLED,
    ["EDGE_NONE"] = MapMarker.EDGE_NONE
}

local g_Deployables = {}
local g_PlayerTargetId = -1
local g_PlayerTargetInfo = false

local w_MapMarkers = {}


-- =============================================================================
--  Functions
-- =============================================================================

function Tracker.Setup()
    g_PlayerTargetId    = Player.GetTargetId()
    g_PlayerTargetInfo  = Game.GetTargetInfo(g_PlayerTargetId)
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

function Tracker.GetEntityOwnerInfo(entityId, entityInfo)
    if (g_Deployables[tostring(entityId)]) then
        return g_PlayerTargetInfo

    elseif (entityInfo and entityInfo.ownerId and Game.IsTargetAvailable(entityInfo.ownerId)) then
        return Game.GetTargetInfo(entityInfo.ownerId)

    else
        return false
    end
end

function Tracker.CheckEntity(entityId)
    if (not Options.IO.General.Enable or entityId == g_PlayerTargetId) then
        return

    elseif (Game.IsTargetAvailable(entityId)) then
        local entityInfo = Game.GetTargetInfo(entityId)

        if (not entityInfo) then
            Debug.Warn("No entityInfo:", entityId)
            return

        -- Player character tracking
        elseif (not entityInfo.isNpc and not entityInfo.hostile and entityInfo.name and entityInfo.type and entityInfo.type == "character") then
            if (Options.IO.Debug.Character) then
                Debug.Table("entityInfo " .. tostring(entityId), entityInfo)
            end

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
            elseif (w_MapMarkers[tostring(entityId)]) then
                Tracker.RemoveMapMarker(entityId)
            end

        -- Deployable tracking
        elseif (entityInfo and not entityInfo.hostile and entityInfo.deployableTypeId) then
            local markerData = {}
            local ownerInfo = Tracker.GetEntityOwnerInfo(entityId)

            if (Options.IO.Deployable.Enable and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)] and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)) then
                markerData = c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)
                Tracker.AddMapMarker(entityId, {name = markerData.title}, markerData.markerType, markerData.iconInfo)

            -- Remove marker if existent
            elseif (w_MapMarkers[tostring(entityId)]) then
                Tracker.RemoveMapMarker(entityId)

            -- Log to console if debug mode is active
            elseif (Options.IO.Debug.Deployable.Owner and ownerInfo and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)] == nil) then
                Debug.Table("entityInfo " .. tostring(entityId), entityInfo)
                Debug.Table("ownerInfo", ownerInfo)

            elseif (Options.IO.Debug.Deployable.Other and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)] == nil) then
                Debug.Table("entityInfo " .. tostring(entityId), {name = entityInfo.name, deployableType = entityInfo.deployableType, deployableTypeId = entityInfo.deployableTypeId})
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
