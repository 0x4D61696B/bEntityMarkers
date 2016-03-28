-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

require "math"
require "table"
require "unicode"

require "lib/lib_Callback2"
require "lib/lib_ChatLib"
require "lib/lib_Debug"
require "lib/lib_PlayerContextualMenu"
require "lib/lib_Slash"

require "./Options"
require "./Tracker"

Debug.EnableLogging(false)


-- =============================================================================
--  Functions
-- =============================================================================

function Notification(message)
    ChatLib.Notification({text = "[bEntityMarkers] " .. tostring(message)})
end

function OnPlayerMenuShow(playerName)
    if (not namecompare(playerName, Player.GetInfo())) then
        local MENU = PlayerMenu:AddMenu({label = "bEntityMarkers", menu = "bEntityMarkers_menu"})

        MENU:AddButton({label = (Options.IO.Character.Name.List[ChatLib.StripArmyTag(playerName)] and "Remove from" or "Add to") .. " tracking list", id = "bEntityMarkers_toggle"}, function()
            Options.AddRemovePlayerName(playerName)
        end)
    end
end

function OnSlashCommand(args)
    Debug.Table("OnSlashCommand()", args)

    if (args[1]) then
        if (args[1] == "-clear") then
            Options.ClearPlayerNames()

        elseif (args[1] == "-list") then
            Options.ListPlayerNames()

        elseif (unicode.len(args[1]) > 0) then
            Options.AddRemovePlayerName(args[1])
        end
    else
        Notification("/bem <-clear|-list|player_name>\n\t-clear : Clears all currently tracked character names\n\t-list : Lists all currently tracked player names\n\tplayer_name - Adds/removes the specified player name to/from the tracking list")
    end
end


-- =============================================================================
--  Events
-- =============================================================================

function OnComponentLoad()
    LIB_SLASH.BindCallback({
        slash_list = "bentitymarkers, bem",
        description = "bEntityMarkers",
        func = OnSlashCommand,
        autocomplete_name = 1
    })

    Options.Setup()

    PlayerMenu.BindOnShow(OnPlayerMenuShow)
end

function OnEnterExitZone()
    Tracker.ClearMapMarkers()
end

function OnDeployableRosterUpdate(args)
    Debug.Event(args)

    if (args.entityId) then
        Tracker.UpdateDeployableRoster(args)
    end
end

function OnEntityAvailable(args)
    if (Options.IO.General.Enable) then
        Callback2.FireAndForget(Tracker.CheckEntity, args.entityId, Options.IO.General.TrackingDelay)
    end
end

function OnEntityLost(args)
    Tracker.RemoveMapMarker(args.entityId)
end

function OnPlayerReady()
    Tracker.Setup()
end
