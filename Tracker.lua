-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

if (Tracker) then
    return
end

require "lib/lib_MapMarker"

require "./TrackerData"


-- =============================================================================
--  Globals
-- =============================================================================

Tracker = {}


-- =============================================================================
--  Variables
-- =============================================================================

local lf                = {}

local g_Deployables     = {}
local g_GroupLeader     = false
local g_PlayerTargetId  = -1

local w_MapMarkers      = {}


-- =============================================================================
--  Functions
-- =============================================================================

function Tracker.Setup()
    -- Always keep the player targetId up-to-date
    g_PlayerTargetId = Player.GetTargetId()
end

function Tracker.RemoveMapMarker(entityId)
    if (lf.HasMapMarker(entityId)) then
        local markerId = tostring(entityId)
        Debug.Log("RemoveMapMarker()", entityId)
        w_MapMarkers[markerId]:Destroy()
        w_MapMarkers[markerId] = nil
    end
end

function Tracker.CheckEntity(entityId)
    if (not Options.IO.General.Enable or isequal(entityId, g_PlayerTargetId)) then
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
                lf.AddMapMarker(entityId, {name = entityName}, "Name", {asset = 159939})

            -- Tracking of special characters like developers and mentors
            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Developer and entityInfo.isDev) then
                lf.AddMapMarker(entityId, {name = "<Developer> " .. entityName}, "Special", {texture = "icons", region = "r5_logo"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Ranger and entityInfo.isRanger) then
                lf.AddMapMarker(entityId, {name = "<Ranger> " .. entityName}, "Special", {texture = "Ranger"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Publisher and entityInfo.isPublisher) then
                lf.AddMapMarker(entityId, {name = "<Publisher> " .. entityName}, "Special", {texture = "Publisher"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Mentor and entityInfo.isMentor) then
                lf.AddMapMarker(entityId, {name = "<Mentor> " .. entityName}, "Special", {texture = "Mentor"})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.Army and entityInfo.army_member) then
                lf.AddMapMarker(entityId, {name = "<Army> " .. entityName}, "Special", {asset = 159939})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.GroupLeader and entityInfo.squad_leader) then
                lf.AddMapMarker(entityId, {name = "<Leader> " .. entityName}, "Special", {asset = 159939})

            elseif (Options.IO.Character.Special.Enable and Options.IO.Character.Special.GroupMember and entityInfo.squad_member) then
                lf.AddMapMarker(entityId, {name = "<Group> " .. entityName}, "Special", {asset = 159939})

            -- Tracking by battleframe
            elseif (Options.IO.Character.Frame.Enable and entityInfo.battleframe and Options.IO.Character.Frame["_" .. entityInfo.battleframe] and entityInfo.frame_icon_id  and c_Battleframes[tonumber(entityInfo.frame_icon_id)] and Options.IO.Character.Frame[c_Battleframes[tonumber(entityInfo.frame_icon_id)]]) then
                lf.AddMapMarker(entityId, {name = "<" .. c_Battleframes[tonumber(entityInfo.frame_icon_id)] .. "> " .. entityName}, "Frame")

            -- Remove marker if existent
            else
                Tracker.RemoveMapMarker(entityId)
            end

        -- Deployable tracking
        elseif (entityInfo.type == "deployable" and entityInfo.deployableTypeId) then

            -- Check if there is an entry defined for this deployableTypeId and if it is enabled
            if (c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)] and c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)) then
                local markerData = c_DeployableMarkerData[tonumber(entityInfo.deployableTypeId)](entityInfo)
                lf.AddMapMarker(entityId, {name = markerData.title}, markerData.markerType, markerData.iconInfo)

            -- Remove marker if existent
            else
                Tracker.RemoveMapMarker(entityId)
            end

        -- Tracking by name for "unknown" type of entities, such as Datapads in ARES missions
        elseif (entityInfo.type == "unknown" and entityInfo.name) then

            -- Check if there is an entry defined for this name and if it is enabled
            if (c_NameMarkerData[entityInfo.name] and c_NameMarkerData[entityInfo.name](entityInfo)) then
                local markerData = c_NameMarkerData[entityInfo.name](entityInfo)
                lf.AddMapMarker(entityId, {name = markerData.title}, markerData.markerType, markerData.iconInfo)

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

        MARKER:SetRadarEdgeMode(MapMarker[Options.IO.Marker.RadarEdgeMode[markerType]])
        MARKER:SetThemeColor(Options.IO.Marker.Color[markerType])
        MARKER:ShowOnHud(Options.IO.Marker.HUD[markerType])
        MARKER:ShowOnRadar(Options.IO.Marker.Radar[markerType])
        MARKER:ShowOnWorldMap(Options.IO.Marker.WorldMap[markerType])
    end
end

function Tracker.UpdateGroupMarkers()
    if (Squad.IsInSquad() or Platoon.IsInPlatoon()) then
        local roster = Squad.GetRoster() or Platoon.GetRoster()

        if (g_GroupLeader ~= roster.leader) then
            for _, member in pairs(roster.members) do
                if (lf.HasMapMarker(member.entityId)) then
                    local MARKER = w_MapMarkers[tostring(member.entityId)]

                    if (Options.IO.Character.Special.GroupLeader and namecompare(member.name, roster.leader)) then
                        MARKER:SetTitle("<Leader> " .. ChatLib.StripArmyTag(member.name))

                    else
                        MARKER:SetTitle("<Group> " .. ChatLib.StripArmyTag(member.name))
                    end

                else
                    Tracker.CheckEntity(member.entityId)
                end
            end

        else
            for _, member in pairs(roster.members) do
                Tracker.CheckEntity(member.entityId)
            end
        end

        g_GroupLeader = roster.leader

    else
        g_GroupLeader = false

        Tracker.CheckAvailableTargets()
    end
end


-- =============================================================================
--  Local functions
-- =============================================================================

function lf.AddMapMarker(entityId, title, markerType, iconInfo)
    Debug.Table("AddMapMarker(" .. tostring(entityId) .. ")", {title = title, markerType = markerType, iconInfo = iconInfo})
    local MARKER

    if (not lf.HasMapMarker(entityId)) then
        MARKER = MapMarker.Create("bem_" .. tostring(entityId))
        w_MapMarkers[tostring(entityId)] = MARKER

    else
        MARKER = w_MapMarkers[tostring(entityId)]
    end

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

    MARKER:SetRadarEdgeMode(MapMarker[Options.IO.Marker.RadarEdgeMode[markerType]])
    MARKER:SetThemeColor(Options.IO.Marker.Color[markerType])
    MARKER:ShowOnHud(Options.IO.Marker.HUD[markerType])
    MARKER:ShowOnRadar(Options.IO.Marker.Radar[markerType])
    MARKER:ShowOnWorldMap(Options.IO.Marker.WorldMap[markerType])

    if (Options.IO.Marker.Ping[markerType]) then
        MARKER:Ping()
    end
end

function lf.HasMapMarker(entityId)
    return w_MapMarkers[tostring(entityId)] ~= nil
end
