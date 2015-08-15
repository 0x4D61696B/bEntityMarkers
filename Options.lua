-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

require "lib/lib_InterfaceOptions"

if (Options) then
    return
end


-- =============================================================================
--  Variables
-- =============================================================================

Options = {}

Options.IO = {
    General = {
        Enable = false,
        TrackingDelay = 0.0
    },
    Debug = {
        Enable = false,
        Character = false,
        Deployable = {
            Owner = false,
            Other = false
        }
    },
    Marker = {
        HUD = {
            Name = true,
            Frame = true,
            Special = true,
            Deployable = true,
            Collectible = true
        },
        Ping = {
            Name = false,
            Frame = false,
            Special = false,
            Deployable = false,
            Collectible = false
        },
        Radar = {
            Name = false,
            Frame = false,
            Special = false,
            Deployable = false,
            Collectible = false
        },
        WorldMap = {
            Name = false,
            Frame = false,
            Special = false,
            Deployable = false,
            Collectible = false
        }
    },
    Character = {
        Name = {
            Enable = false,
            List = {}
        },
        Special = {
            Enable = false,
            Developer = false,
            Ranger = false,
            Publisher = false,
            Mentor = false
        },
        Frame = {
            Enable = false,
            -- Assault
            _berzerker = false,
            Assault = false,
            Firecat = false,
            Tigerclaw = false,
            -- Biotech
            _medic = false,
            Biotech = false,
            Dragonfly = false,
            Recluse = false,
            -- Dreadnaught
            _guardian = false,
            Dreadnaught = false,
            Arsenal = false,
            Mammoth = false,
            Rhino = false,
            -- Engineer
            _bunker = false,
            Engineer = false,
            Bastion = false,
            Electron = false,
            -- Recon
            _recon = false,
            Recon = false,
            Nighthawk = false,
            Raptor = false
        }
    },
    Deployable = {
        Enable = false,
        Biotech = {
            Enable = false,
            HealingGenerator = false
        },
        Dreadnaught = {
            Enable = false,
            GravityFieldGrenade = false
        },
        Engineer = {
            Enable = false,
            DeployableShield = false,
            HeavyTurret = false,
            MultiTurret = false,
            OverclockingStation = false,
            PulseGenerator = false,
            SentinelPod = false,
            SupplyStation = false
        },
        Recon = {
            Enable = false,
            PowerField = false,
            RemoteFlashbang = false,
            SINBeacon = false,
            SmokeScreen = false,
            Teleportal = false
        },
        Collectible = {
            Enable = false,
            Codex = false
        }
    }
}

local c_OptionsMap = {
    GENERAL_ENABLE = function(value)
        Options.IO.General.Enable = value
        
        if (not value) then
            Tracker.ClearMapMarkers()
        end
    end,
    
    GENERAL_TRACKING_DELAY = function(value)
        Options.IO.General.TrackingDelay = value
    end,
    
    DEBUG_GROUP = function(value)
        Options.IO.Debug.Enable = value
        Debug.EnableLogging(value)
    end,
    
    DEBUG_CHARACTER = function(value)
        Options.IO.Debug.Character = value
    end,
    
    DEBUG_DEPLOYABLE_OWNER = function(value)
        Options.IO.Debug.Deployable.Owner = value
    end,
    
    DEBUG_DEPLOYABLE_OTHER = function(value)
        Options.IO.Debug.Deployable.Other = value
    end,
    
    MARKER_HUD_NAME = function(value)
        Options.IO.Marker.HUD.Name = value
    end,
    
    MARKER_HUD_SPECIAL = function(value)
        Options.IO.Marker.HUD.Special = value
    end,
    
    MARKER_HUD_FRAME = function(value)
        Options.IO.Marker.HUD.Frame = value
    end,
    
    MARKER_HUD_DEPLOYABLE = function(value)
        Options.IO.Marker.HUD.Deployable = value
    end,
    
    MARKER_HUD_COLLECTIBLE = function(value)
        Options.IO.Marker.HUD.Collectible = value
    end,
    
    MARKER_PING_NAME = function(value)
        Options.IO.Marker.Ping.Name = value
    end,
    
    MARKER_PING_SPECIAL = function(value)
        Options.IO.Marker.Ping.Special = value
    end,
    
    MARKER_PING_FRAME = function(value)
        Options.IO.Marker.Ping.Frame = value
    end,
    
    MARKER_PING_DEPLOYABLE = function(value)
        Options.IO.Marker.Ping.Deployable = value
    end,
    
    MARKER_PING_COLLECTIBLE = function(value)
        Options.IO.Marker.Ping.Collectible = value
    end,
    
    MARKER_RADAR_NAME = function(value)
        Options.IO.Marker.Radar.Name = value
    end,
    
    MARKER_RADAR_SPECIAL = function(value)
        Options.IO.Marker.Radar.Special = value
    end,
    
    MARKER_RADAR_FRAME = function(value)
        Options.IO.Marker.Radar.Frame = value
    end,
    
    MARKER_RADAR_DEPLOYABLE = function(value)
        Options.IO.Marker.Radar.Deployable = value
    end,
    
    MARKER_RADAR_COLLECTIBLE = function(value)
        Options.IO.Marker.Radar.Collectible = value
    end,
    
    MARKER_WORLDMAP_NAME = function(value)
        Options.IO.Marker.WorldMap.Name = value
    end,
    
    MARKER_WORLDMAP_SPECIAL = function(value)
        Options.IO.Marker.WorldMap.Special = value
    end,
    
    MARKER_WORLDMAP_FRAME = function(value)
        Options.IO.Marker.WorldMap.Frame = value
    end,
    
    MARKER_WORLDMAP_DEPLOYABLE = function(value)
        Options.IO.Marker.WorldMap.Deployable = value
    end,
    
    MARKER_WORLDMAP_COLLECTIBLE = function(value)
        Options.IO.Marker.WorldMap.Collectible = value
    end,
    
    CHARACTER_NAME = function (value)
        Options.IO.Character.Name.Enable = value
    end,
    
    CHARACTER_NAME_LIST = function(value)
        Options.ListPlayerNames()
    end,
    
    CHARACTER_NAME_CLEAR = function(value)
        Options.ClearPlayerNames()
    end,
    
    CHARACTER_SPECIAL_GROUP = function(value)
        Options.IO.Character.Special.Enable = value
    end,
    
    CHARACTER_DEVELOPERS = function(value)
        Options.IO.Character.Special.Developer = value
    end,
    
    CHARACTER_RANGERS = function(value)
        Options.IO.Character.Special.Ranger = value
    end,
    
    CHARACTER_PUBLISHERS = function(value)
        Options.IO.Character.Special.Publisher = value
    end,
    
    CHARACTER_MENTORS = function(value)
        Options.IO.Character.Special.Mentor = value
    end,
    
    CHARACTER_FRAME_GROUP = function(value)
        Options.IO.Character.Frame.Enable = value
    end,
    
    CHARACTER_FRAME_ASSAULT_GROUP = function(value)
        Options.IO.Character.Frame["_berzerker"] = value
    end,
    
    CHARACTER_FRAME_ASSAULT = function(value)
        Options.IO.Character.Frame.Assault = value
    end,
    
    CHARACTER_FRAME_FIRECAT = function(value)
        Options.IO.Character.Frame.Firecat = value
    end,
    
    CHARACTER_FRAME_TIGERCLAW = function(value)
        Options.IO.Character.Frame.Tigerclaw = value
    end,
    
    CHARACTER_FRAME_BIOTECH_GROUP = function(value)
        Options.IO.Character.Frame["_medic"] = value
    end,
    
    CHARACTER_FRAME_BIOTECH = function(value)
        Options.IO.Character.Frame.Biotech = value
    end,
    
    CHARACTER_FRAME_DRAGONFLY = function(value)
        Options.IO.Character.Frame.Dragonfly = value
    end,
    
    CHARACTER_FRAME_RECLUSE = function(value)
        Options.IO.Character.Frame.Recluse = value
    end,
    
    CHARACTER_FRAME_DREADNAUGHT_GROUP = function(value)
        Options.IO.Character.Frame["_guardian"] = value
    end,
    
    CHARACTER_FRAME_DREADNAUGHT = function(value)
        Options.IO.Character.Frame.Dreadnaught = value
    end,
    
    CHARACTER_FRAME_ARSENAL = function(value)
        Options.IO.Character.Frame.Arsenal = value
    end,
    
    CHARACTER_FRAME_MAMMOTH = function(value)
        Options.IO.Character.Frame.Mammoth = value
    end,
    
    CHARACTER_FRAME_RHINO = function(value)
        Options.IO.Character.Frame.Rhino = value
    end,
    
    CHARACTER_FRAME_ENGINEER_GROUP = function(value)
        Options.IO.Character.Frame["_bunker"] = value
    end,
    
    CHARACTER_FRAME_ENGINEER = function(value)
        Options.IO.Character.Frame.Engineer = value
    end,
    
    CHARACTER_FRAME_BASTION = function(value)
        Options.IO.Character.Frame.Bastion = value
    end,
    
    CHARACTER_FRAME_ELECTRON = function(value)
        Options.IO.Character.Frame.Electron = value
    end,
    
    CHARACTER_FRAME_RECON_GROUP = function(value)
        Options.IO.Character.Frame["_recon"] = value
    end,
    
    CHARACTER_FRAME_RECON = function(value)
        Options.IO.Character.Frame.Recon = value
    end,
    
    CHARACTER_FRAME_NIGHTHAWK = function(value)
        Options.IO.Character.Frame.Nighthawk = value
    end,
    
    CHARACTER_FRAME_RAPTOR = function(value)
        Options.IO.Character.Frame.Raptor = value
    end,
    
    DEPLOYABLE_GROUP = function(value)
        Options.IO.Deployable.Enable = value
    end,
    
    DEPLOYABLE_BIOTECH_GROUP = function(value)
        Options.IO.Deployable.Biotech.Enable = value
    end,
    
    DEPLOYABLE_BIOTECH_HEALINGGENERATOR = function(value)
        Options.IO.Deployable.Biotech.HealingGenerator = value
    end,
    
    DEPLOYABLE_DREADNAUGHT_GROUP = function(value)
        Options.IO.Deployable.Dreadnaught.Enable = value
    end,
    
    DEPLOYABLE_DREADNAUGHT_GRAVITYFIELDGRENADE = function(value)
        Options.IO.Deployable.Dreadnaught.GravityFieldGrenade = value
    end,
    
    DEPLOYABLE_ENGINEER_GROUP = function(value)
        Options.IO.Deployable.Engineer.Enable = value
    end,
    
    DEPLOYABLE_ENGINEER_DEPLOYABLESHIELD = function(value)
        Options.IO.Deployable.Engineer.DeployableShield = value
    end,
    
    DEPLOYABLE_ENGINEER_HEAVYTURRET = function(value)
        Options.IO.Deployable.Engineer.HeavyTurret = value
    end,
    
    DEPLOYABLE_ENGINEER_MULTITURRET = function(value)
        Options.IO.Deployable.Engineer.MultiTurret = value
    end,
    
    DEPLOYABLE_ENGINEER_OVERCLOCKINGSTATION = function(value)
        Options.IO.Deployable.Engineer.OverclockingStation = value
    end,
    
    DEPLOYABLE_ENGINEER_PULSEGENERATOR = function(value)
        Options.IO.Deployable.Engineer.PulseGenerator = value
    end,
    
    DEPLOYABLE_ENGINEER_SENTINELPOD = function(value)
        Options.IO.Deployable.Engineer.SentinelPod = value
    end,
    
    DEPLOYABLE_ENGINEER_SUPPLYSTATION = function(value)
        Options.IO.Deployable.Engineer.SupplyStation = value
    end,
    
    DEPLOYABLE_RECON_GROUP = function(value)
        Options.IO.Deployable.Recon.Enable = value
    end,
    
    DEPLOYABLE_RECON_POWERFIELD = function(value)
        Options.IO.Deployable.Recon.PowerField = value
    end,
    
    DEPLOYABLE_RECON_REMOTEFLASHBANG = function(value)
        Options.IO.Deployable.Recon.RemoteFlashbang = value
    end,
    
    DEPLOYABLE_RECON_SINBEACON = function(value)
        Options.IO.Deployable.Recon.SINBeacon = value
    end,
    
    DEPLOYABLE_RECON_SMOKESCREEN = function(value)
        Options.IO.Deployable.Recon.SmokeScreen = value
    end,
    
    DEPLOYABLE_RECON_TELEPORTAL = function(value)
        Options.IO.Deployable.Recon.Teleportal = value
    end,
    
    DEPLOYABLE_COLLECTIBLE_GROUP = function(value)
        Options.IO.Deployable.Collectible.Enable = value
    end,
    
    DEPLOYABLE_COLLECTIBLE_CODEX = function(value)
        Options.IO.Deployable.Collectible.Codex = value
    end
}

local CB2_ApplyOptions


-- =============================================================================
--  Interface Options
-- =============================================================================

function Options.OnOptionChanged(id, value)
    if (c_OptionsMap[id]) then
        c_OptionsMap[id](value)
    else
        Debug.Log("Unhandled message", {id = id, value = value})
    end
    
    -- Don't spam marker visibity updates
    if (CB2_ApplyOptions:Pending()) then
        CB2_ApplyOptions:Reschedule(1)
    else
        CB2_ApplyOptions:Schedule(1)
    end
end

function Options.Setup()
    InterfaceOptions.SaveVersion(3)
    
    -- General options
    InterfaceOptions.StartGroup({label = "General options"})
        InterfaceOptions.AddCheckBox({id = "GENERAL_ENABLE", label = "Addon enabled", default = false})
        InterfaceOptions.AddSlider({id = "GENERAL_TRACKING_DELAY", label = "Tracking Delay", default = 0.0, min = 0.0, max = 1.0, inc = 0.1, format = "%0.1f", suffix = "s"})
    InterfaceOptions.StopGroup()
    
    -- Debug options
    InterfaceOptions.StartGroup({label = "Debug", id = "DEBUG_GROUP", checkbox = true, default = false})
        InterfaceOptions.AddCheckBox({id = "DEBUG_CHARACTER", label = "Characters", default = false})
        InterfaceOptions.AddCheckBox({id = "DEBUG_DEPLOYABLE_OWNER", label = "Deployables with owner info", default = false})
        InterfaceOptions.AddCheckBox({id = "DEBUG_DEPLOYABLE_OTHER", label = "Other deployables", default = false})
    InterfaceOptions.StopGroup()
    
    -- Name tracking
    InterfaceOptions.AddCheckBox({id = "CHARACTER_NAME", label = "Track names", default = false, subtab = {"Name Tracking"}})
    
    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_NAME", label = "Show on HUD", default = true, subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_NAME", label = "Show on radar", default = false, subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_NAME", label = "Show on world map", default = false, subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_NAME", label = "Enable ping", default = false, subtab = {"Name Tracking"}})
    InterfaceOptions.StopGroup({subtab = {"Name Tracking"}})
    
    InterfaceOptions.AddButton({id = "CHARACTER_NAME_LIST", label = "Print tracking list", subtab = {"Name Tracking"}})
    InterfaceOptions.AddButton({id = "CHARACTER_NAME_CLEAR", label = "Clear tracking list", subtab = {"Name Tracking"}})
    
    -- Special tracking
    InterfaceOptions.AddCheckBox({id = "CHARACTER_SPECIAL_GROUP", label = "Track special characters", default = false, subtab = {"Special Characters"}})
    
    InterfaceOptions.StartGroup({label = "Tracking options", subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_DEVELOPERS", label = "Developers", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_RANGERS", label = "Rangers", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_PUBLISHERS", label = "Publishers", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_MENTORS", label = "Mentors", default = false, subtab = {"Special Characters"}})
    InterfaceOptions.StopGroup({subtab = {"Special Characters"}})
    
    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_SPECIAL", label = "Show on HUD", default = true, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_SPECIAL", label = "Show on radar", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_SPECIAL", label = "Show on world map", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_SPECIAL", label = "Enable ping", default = false, subtab = {"Special Characters"}})
    InterfaceOptions.StopGroup({subtab = {"Special Characters"}})
        
    -- Frame tracking
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_GROUP", label = "Track Battleframes", default = false, subtab = {"Battleframes"}})
    
    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_FRAME", label = "Show on HUD", default = true, subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_FRAME", label = "Show on radar", default = false, subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_FRAME", label = "Show on world map", default = false, subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_FRAME", label = "Enable ping", default = false, subtab = {"Battleframes"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes"}})
    
    -- Assault
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ASSAULT_GROUP", label = "Track Assault Battleframes", default = false, subtab = {"Battleframes", "Assault"}})
    
    InterfaceOptions.StartGroup({label = "Assault", subtab = {"Battleframes", "Assault"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ASSAULT", label = "Accord Assault", default = false, subtab = {"Battleframes", "Assault"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_FIRECAT", label = "Astrek Firecat", default = false, subtab = {"Battleframes", "Assault"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_TIGERCLAW", label = "Omnidyne-M Tigerclaw", default = false, subtab = {"Battleframes", "Assault"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes", "Assault"}})
    
    -- Biotech
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_BIOTECH_GROUP", label = "Track Biotech Battleframes", default = false, subtab = {"Battleframes", "Biotech"}})
    
    InterfaceOptions.StartGroup({label = "Biotech", subtab = {"Battleframes", "Biotech"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_BIOTECH", label = "Accord Biotech", default = false, subtab = {"Battleframes", "Biotech"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_DRAGONFLY", label = "Omnidyne-M Dragonfly", default = false, subtab = {"Battleframes", "Biotech"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_RECLUSE", label = "Astrek Recluse", default = false, subtab = {"Battleframes", "Biotech"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes", "Biotech"}})
    
    -- Dreadnaught
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_DREADNAUGHT_GROUP", label = "Track Dreadnaught Battleframes", default = false, subtab = {"Battleframes", "Dreadnaught"}})
    
    InterfaceOptions.StartGroup({label = "Dreadnaught", subtab = {"Battleframes", "Dreadnaught"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_DREADNAUGHT", label = "Accord Dreadnaught", default = false, subtab = {"Battleframes", "Dreadnaught"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ARSENAL", label = "Omnidyne-M Arsenal", default = false, subtab = {"Battleframes", "Dreadnaught"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_MAMMOTH", label = "Omnidyne-M Mammoth", default = false, subtab = {"Battleframes", "Dreadnaught"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_RHINO", label = "Astrek Rhino", default = false, subtab = {"Battleframes", "Dreadnaught"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes", "Dreadnaught"}})
    
    -- Engineer
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ENGINEER_GROUP", label = "Track Engineer Battleframes", default = false, subtab = {"Battleframes", "Engineer"}})
    
    InterfaceOptions.StartGroup({label = "Engineer", subtab = {"Battleframes", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ENGINEER", label = "Accord Engineer", default = false, subtab = {"Battleframes", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_BASTION", label = "Omnidyne-M Bastion", default = false, subtab = {"Battleframes", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_ELECTRON", label = "Astrek Electron", default = false, subtab = {"Battleframes", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes", "Engineer"}})
    
    -- Recon
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_RECON_GROUP", label = "Track Recon Battleframes", default = false, subtab = {"Battleframes", "Recon"}})
    
    InterfaceOptions.StartGroup({label = "Recon", subtab = {"Battleframes", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_RECON", label = "Accord Recon", default = false, subtab = {"Battleframes", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_NIGHTHAWK", label = "Omnidyne-M Nighthawk", default = false, subtab = {"Battleframes", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_RAPTOR", label = "Astrek Raptor", default = false, subtab = {"Battleframes", "Recon"}})
    InterfaceOptions.StopGroup({subtab = {"Battleframes", "Recon"}})
    
    -- Deployable tracking
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_GROUP", label = "Track deployables", default = false, subtab = {"Deployables"}})
    
    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_DEPLOYABLE", label = "Show on HUD", default = true, subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_DEPLOYABLE", label = "Show on radar", default = false, subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_DEPLOYABLE", label = "Show on world map", default = false, subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_DEPLOYABLE", label = "Enable ping", default = false, subtab = {"Deployables"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables"}})
    
    -- Biotech
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_BIOTECH_GROUP", label = "Track Biotech Deployables", default = false, subtab = {"Deployables", "Biotech"}})
    
    InterfaceOptions.StartGroup({label = "Biotech", subtab = {"Deployables", "Biotech"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_BIOTECH_HEALINGGENERATOR", label = "Healing Generator", default = false, subtab = {"Deployables", "Biotech"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Biotech"}})
    
    -- Dreadnaught
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_DREADNAUGHT_GROUP", label = "Track Dreadnaught Deployables", default = false, subtab = {"Deployables", "Dreadnaught"}})
    InterfaceOptions.StartGroup({label = "Rhino", subtab = {"Deployables", "Dreadnaught"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_DREADNAUGHT_GRAVITYFIELDGRENADE", label = "Gravity Field Grenade", default = false, subtab = {"Deployables", "Dreadnaught"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Dreadnaught"}})
    
    -- Engineer
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_GROUP", label = "Track Engineer Deployables", default = false, subtab = {"Deployables", "Engineer"}})
    
    InterfaceOptions.StartGroup({label = "Engineer", subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_DEPLOYABLESHIELD", label = "Deployable Shield", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_HEAVYTURRET", label = "Heavy Turret", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_PULSEGENERATOR", label = "Pulse Generator", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_SUPPLYSTATION", label = "Supply Station", default = false, subtab = {"Deployables", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Engineer"}})
    
    InterfaceOptions.StartGroup({label = "Bastion", subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_MULTITURRET", label = "Multi Turret", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_SENTINELPOD", label = "Sentinel Pod", default = false, subtab = {"Deployables", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Engineer"}})
    
    InterfaceOptions.StartGroup({label = "Electron", subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_OVERCLOCKINGSTATION", label = "Overclocking Station", default = false, subtab = {"Deployables", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Engineer"}})
    
    -- Recon
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_GROUP", label = "Track Recon Deployables", default = false, subtab = {"Deployables", "Recon"}})
    
    InterfaceOptions.StartGroup({label = "Recon", subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_SINBEACON", label = "SIN Beacon", default = false, subtab = {"Deployables", "Recon"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Recon"}})
    
    InterfaceOptions.StartGroup({label = "Nighthawk", subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_REMOTEFLASHBANG", label = "Remote Flashbang", default = false, subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_SMOKESCREEN", label = "Smoke Screen", default = false, subtab = {"Deployables", "Recon"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Recon"}})
    
    InterfaceOptions.StartGroup({label = "Raptor", subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_POWERFIELD", label = "Power Field", default = false, subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_TELEPORTAL", label = "Teleportal", default = false, subtab = {"Deployables", "Recon"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Recon"}})
    
    -- Collectibles
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_COLLECTIBLE_GROUP", label = "Track Collectibles", default = false, subtab = {"Collectibles"}})
    
	InterfaceOptions.StartGroup({label = "Tracking Options", subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_COLLECTIBLE_CODEX", label = "Codex", default = false, subtab = {"Collectibles"}})
    InterfaceOptions.StopGroup({subtab = {"Collectibles"}})
	
    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_COLLECTIBLE", label = "Show on HUD", default = true, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_COLLECTIBLE", label = "Show on radar", default = false, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_COLLECTIBLE", label = "Show on world map", default = false, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_COLLECTIBLE", label = "Enable ping", default = false, subtab = {"Collectibles"}})
    InterfaceOptions.StopGroup({subtab = {"Collectibles"}})
    
    CB2_ApplyOptions = Callback2.Create()
    CB2_ApplyOptions:Bind(Options.ApplyOptions)
    
    InterfaceOptions.SetCallbackFunc(Options.OnOptionChanged)
    
    if (Component.GetSetting("PLAYER_NAMES")) then
        Options.IO.Character.Name.List = Component.GetSetting("PLAYER_NAMES")
    end
end

-- =============================================================================
--  Functions
-- =============================================================================

function Options.AddRemovePlayerName(name)
    Debug.Log("AddRemovePlayerName()", name)
    local playerName = ChatLib.StripArmyTag(name)
    
    if (Options.IO.Character.Name.List[playerName]) then
        Notification("Removing " .. ChatLib.EncodePlayerLink(playerName) .. " from the tracking list")
        Options.IO.Character.Name.List[playerName] = nil
        Tracker.CheckAvailableTargets()
    elseif (namecompare(playerName, Player.GetInfo())) then
        Notification("You can't add yourself to the tracking list")
    else
        Notification("Adding " .. ChatLib.EncodePlayerLink(playerName) .. " to the tracking list")
        Options.IO.Character.Name.List[playerName] = true
        Tracker.CheckAvailableTargets()
    end
    
    Component.SaveSetting("PLAYER_NAMES", Options.IO.Character.Name.List)
end

function Options.ClearPlayerNames()
    Notification("Clearing the list of tracked character names")
    Options.IO.Character.Name.List = {}
    Tracker.CheckAvailableTargets()
    Component.SaveSetting("PLAYER_NAMES", Options.IO.Character.Name.List)
end

function Options.ListPlayerNames()
    local count = 0
    local names = ""
    
    for k, _ in pairs(Options.IO.Character.Name.List) do
        names = names .. " " .. ChatLib.EncodePlayerLink(k)
        count = count + 1
    end
    
    if (count > 0) then
        local plural = function() if (count > 2) then return "s" else return "" end end
        
        Notification("Currently tracking " .. count .. " name" .. plural() .. ":" .. names)
    else
        Notification("There are no names on the tracking list.")
    end
end

function Options.ApplyOptions()
    Debug.Log("Options.IO", Options.IO)
    Debug.Log("Applying options ...")
    Tracker.CheckAvailableTargets()
    Tracker.UpdateMapMarkerVisibility()
end
