-- =============================================================================
--  bEntityMarkers
--    by: BurstBiscuit
-- =============================================================================

if (Options) then
    return
end

require "lib/lib_InterfaceOptions"


-- =============================================================================
--  Variables
-- =============================================================================

Options = {}

Options.IO = {
    General = {
        Enable          = false,
        TrackingDelay   = 0.0,
        Debug           = false
    },

    Marker = {
        Color = {
            Name        = "F7BA0B",
            Frame       = "FFFFFF",
            Special     = "A02128",
            Deployable  = "0F8558",
            Collectible = "154889",
            Objective   = "154889"
        },

        HUD = {
            Name        = true,
            Frame       = true,
            Special     = true,
            Deployable  = true,
            Collectible = true,
            Objective   = true
        },

        Ping = {
            Name        = false,
            Frame       = false,
            Special     = false,
            Deployable  = false,
            Collectible = false,
            Objective   = false
        },

        Radar = {
            Name        = false,
            Frame       = false,
            Special     = false,
            Deployable  = false,
            Collectible = false,
            Objective   = false
        },

        RadarEdgeMode = {
            Name        = "EDGE_NONE",
            Frame       = "EDGE_NONE",
            Special     = "EDGE_NONE",
            Deployable  = "EDGE_NONE",
            Collectible = "EDGE_NONE",
            Objective   = "EDGE_NONE"
        },

        WorldMap = {
            Name        = false,
            Frame       = false,
            Special     = false,
            Deployable  = false,
            Collectible = false,
            Objective   = false
        }
    },

    Character = {
        Name = {
            Enable      = false,
            List        = {}
        },

        Special = {
            Enable      = false,
            Developer   = false,
            Ranger      = false,
            Publisher   = false,
            Mentor      = false,
            Army        = false
        },

        Frame = {
            Enable      = false,

            -- Assault
            _berzerker  = false,
            Assault     = false,
            Firecat     = false,
            Tigerclaw   = false,

            -- Biotech
            _medic      = false,
            Biotech     = false,
            Dragonfly   = false,
            Recluse     = false,

            -- Dreadnaught
            _guardian   = false,
            Dreadnaught = false,
            Arsenal     = false,
            Mammoth     = false,
            Rhino       = false,

            -- Engineer
            _bunker     = false,
            Engineer    = false,
            Bastion     = false,
            Electron    = false,

            -- Recon
            _recon      = false,
            Recon       = false,
            Nighthawk   = false,
            Raptor      = false
        }
    },

    Deployable = {
        Enable                          = false,

        Biotech = {
            Enable                      = false,
            HealingGenerator            = false
        },

        Engineer = {
            Enable = false,
            AntiPersonnelTurret         = false,
            DeployableShield            = false,
            HeavyTurret                 = false,
            MultiTurret                 = false,
            SupplyStation               = false
        },

        Recon = {
            Enable                      = false,
            RemoteFlashbang             = false
        },

        Collectible = {
            Enable                      = false,
            Codex                       = false,
            RelicCache                  = false
        },

        Objective = {
            Enable                      = false,

            -- Objectives by deployableTypeId
            AccordTerminal              = false,
            ArcporterPylon              = false,
            ArmoredAranhaNest           = false,
            ChosenBomb                  = false,
            ChosenStrifebringer         = false,
            HijackedTerminal            = false,
            RaiderDistressBeacon        = false,
            RecoveryPayloadStorage      = false,

            -- Objectives by entityInfo.name
            AccordDatapad               = false,
            CrashedThumperPart          = false,
            CrystiteCore                = false,
            DeliriumEngineCore          = false,
            DisruptionDefusePin         = false,
            DrillParts                  = false,
            MedicalSupplies             = false,
            TaintedCrystite             = false
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

    GENERAL_DEBUG = function(value)
        Options.IO.General.Debug = value
        Debug.EnableLogging(value)
    end,

    MARKER_COLOR_NAME = function(value)
        Options.IO.Marker.Color.Name = value.tint
    end,

    MARKER_COLOR_SPECIAL = function(value)
        Options.IO.Marker.Color.Special = value.tint
    end,

    MARKER_COLOR_FRAME = function(value)
        Options.IO.Marker.Color.Frame = value.tint
    end,

    MARKER_COLOR_DEPLOYABLE = function(value)
        Options.IO.Marker.Color.Deployable = value.tint
    end,

    MARKER_COLOR_COLLECTIBLE = function(value)
        Options.IO.Marker.Color.Collectible = value.tint
    end,

    MARKER_COLOR_OBJECTIVE = function(value)
        Options.IO.Marker.Color.Objective = value.tint
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

    MARKER_HUD_OBJECTIVE = function(value)
        Options.IO.Marker.HUD.Objective = value
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

    MARKER_PING_OBJECTIVE = function(value)
        Options.IO.Marker.Ping.Objective = value
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

    MARKER_RADAR_OBJECTIVE = function(value)
        Options.IO.Marker.Radar.Objective = value
    end,

    MARKER_RADAR_EDGE_NAME = function(value)
        Options.IO.Marker.RadarEdgeMode.Name = value
    end,

    MARKER_RADAR_EDGE_SPECIAL = function(value)
        Options.IO.Marker.RadarEdgeMode.Special = value
    end,

    MARKER_RADAR_EDGE_FRAME = function(value)
        Options.IO.Marker.RadarEdgeMode.Frame = value
    end,

    MARKER_RADAR_EDGE_DEPLOYABLE = function(value)
        Options.IO.Marker.RadarEdgeMode.Deployable = value
    end,

    MARKER_RADAR_EDGE_COLLECTIBLE = function(value)
        Options.IO.Marker.RadarEdgeMode.Collectible = value
    end,

    MARKER_RADAR_EDGE_OBJECTIVE = function(value)
        Options.IO.Marker.RadarEdgeMode.Objective = value
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

    MARKER_WORLDMAP_OBJECTIVE = function(value)
        Options.IO.Marker.WorldMap.Objective = value
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

    CHARACTER_ARMY = function(value)
        Options.IO.Character.Special.Army = value
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

    DEPLOYABLE_ENGINEER_GROUP = function(value)
        Options.IO.Deployable.Engineer.Enable = value
    end,

    DEPLOYABLE_ENGINEER_ANTIPERSONNELTURRET = function(value)
        Options.IO.Deployable.Engineer.AntiPersonnelTurret = value
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

    DEPLOYABLE_ENGINEER_SUPPLYSTATION = function(value)
        Options.IO.Deployable.Engineer.SupplyStation = value
    end,

    DEPLOYABLE_RECON_GROUP = function(value)
        Options.IO.Deployable.Recon.Enable = value
    end,

    DEPLOYABLE_RECON_REMOTEFLASHBANG = function(value)
        Options.IO.Deployable.Recon.RemoteFlashbang = value
    end,

    DEPLOYABLE_COLLECTIBLE_GROUP = function(value)
        Options.IO.Deployable.Collectible.Enable = value
    end,

    DEPLOYABLE_COLLECTIBLE_CODEX = function(value)
        Options.IO.Deployable.Collectible.Codex = value
    end,

    DEPLOYABLE_COLLECTIBLE_RELIC_CACHE = function(value)
        Options.IO.Deployable.Collectible.RelicCache = value
    end,

    DEPLOYABLE_OBJECTIVE_GROUP = function(value)
        Options.IO.Deployable.Objective.Enable = value
    end,

    DEPLOYABLE_OBJECTIVE_ACCORDTERMINAL = function(value)
        Options.IO.Deployable.Objective.AccordTerminal = value
    end,

    DEPLOYABLE_OBJECTIVE_ARCPORTERPYLON = function(value)
        Options.IO.Deployable.Objective.ArcporterPylon = value
    end,

    DEPLOYABLE_OBJECTIVE_ARMOREDARANHANEST = function(value)
        Options.IO.Deployable.Objective.ArmoredAranhaNest = value
    end,

    DEPLOYABLE_OBJECTIVE_CHOSENBOMB = function(value)
        Options.IO.Deployable.Objective.ChosenBomb = value
    end,

    DEPLOYABLE_OBJECTIVE_CHOSENSTRIFEBRINGER = function(value)
        Options.IO.Deployable.Objective.ChosenStrifebringer = value
    end,

    DEPLOYABLE_OBJECTIVE_HIJACKEDTERMINAL = function(value)
        Options.IO.Deployable.Objective.HijackedTerminal = value
    end,

    DEPLOYABLE_OBJECTIVE_RAIDERDISTRESSBEACON = function(value)
        Options.IO.Deployable.Objective.RaiderDistressBeacon = value
    end,

    DEPLOYABLE_OBJECTIVE_RECOVERYPAYLOADSTORAGE = function(value)
        Options.IO.Deployable.Objective.RecoveryPayloadStorage = value
    end,

    DEPLOYABLE_OBJECTIVE_ACCORDDATAPAD = function(value)
        Options.IO.Deployable.Objective.AccordDatapad = value
    end,

    DEPLOYABLE_OBJECTIVE_CRASHEDTHUMPERPART = function(value)
        Options.IO.Deployable.Objective.CrashedThumperPart = value
    end,

    DEPLOYABLE_OBJECTIVE_DELIRIUMENGINECORE = function(value)
        Options.IO.Deployable.Objective.DeliriumEngineCore = value
    end,

    DEPLOYABLE_OBJECTIVE_DISRUPTIONDEFUSEPIN = function(value)
        Options.IO.Deployable.Objective.DisruptionDefusePin = value
    end,

    DEPLOYABLE_OBJECTIVE_CRYSTITECORE = function(value)
        Options.IO.Deployable.Objective.CrystiteCore = value
    end,

    DEPLOYABLE_OBJECTIVE_DRILLPARTS = function(value)
        Options.IO.Deployable.Objective.DrillParts = value
    end,

    DEPLOYABLE_OBJECTIVE_MEDICALSUPPLIES = function(value)
        Options.IO.Deployable.Objective.MedicalSupplies = value
    end,

    DEPLOYABLE_OBJECTIVE_TAINTEDCRYSTITE = function(value)
        Options.IO.Deployable.Objective.TaintedCrystite = value
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
        Debug.Table("Unhandled message", {id = id, value = value})
    end

    -- Don't spam marker visibity updates
    if (CB2_ApplyOptions:Pending()) then
        CB2_ApplyOptions:Reschedule(1)
    else
        CB2_ApplyOptions:Schedule(1)
    end
end

function Options.Setup()
    InterfaceOptions.SaveVersion(5)

    -- General options
    InterfaceOptions.StartGroup({label = "General options"})
        InterfaceOptions.AddCheckBox({id = "GENERAL_ENABLE", label = "Addon enabled", default = false})
        InterfaceOptions.AddSlider({id = "GENERAL_TRACKING_DELAY", label = "Tracking Delay", default = 0.0, min = 0.0, max = 1.0, inc = 0.1, format = "%0.1f", suffix = "s"})
        InterfaceOptions.AddCheckBox({id = "GENERAL_DEBUG", label = "Debug enabled", default = false})
    InterfaceOptions.StopGroup()

    -- Name tracking
    InterfaceOptions.AddCheckBox({id = "CHARACTER_NAME", label = "Track names", default = false, subtab = {"Name Tracking"}})

    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_NAME", label = "Show on HUD", default = true, subtab = {"Name Tracking"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_NAME", label = "Show on radar", default = false, subtab = {"Name Tracking"}})
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_NAME", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Name Tracking"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_NAME", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_NAME", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_NAME", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_NAME", label = "Radar marker color", default = {tint = "F7BA0B"}, subtab = {"Name Tracking"}})
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
        InterfaceOptions.AddCheckBox({id = "CHARACTER_ARMY", label = "Army members", default = false, subtab = {"Special Characters"}})
    InterfaceOptions.StopGroup({subtab = {"Special Characters"}})

    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_SPECIAL", label = "Show on HUD", default = true, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_SPECIAL", label = "Show on radar", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_SPECIAL", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Special Characters"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_SPECIAL", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_SPECIAL", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_SPECIAL", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_SPECIAL", label = "Radar marker color", default = {tint = "A02128"}, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_SPECIAL", label = "Show on world map", default = false, subtab = {"Special Characters"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_SPECIAL", label = "Enable ping", default = false, subtab = {"Special Characters"}})
    InterfaceOptions.StopGroup({subtab = {"Special Characters"}})

    -- Frame tracking
    InterfaceOptions.AddCheckBox({id = "CHARACTER_FRAME_GROUP", label = "Track Battleframes", default = false, subtab = {"Battleframes"}})

    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_FRAME", label = "Show on HUD", default = true, subtab = {"Battleframes"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_FRAME", label = "Show on radar", default = false, subtab = {"Battleframes"}})
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_FRAME", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Battleframes"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_FRAME", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_FRAME", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_FRAME", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_FRAME", label = "Radar marker color", default = {tint = "FFFFFF"}, subtab = {"Battleframes"}})
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
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_DEPLOYABLE", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Deployables"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_DEPLOYABLE", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_DEPLOYABLE", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_DEPLOYABLE", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_DEPLOYABLE", label = "Radar marker color", default = {tint = "0F8558"}, subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_DEPLOYABLE", label = "Show on world map", default = false, subtab = {"Deployables"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_DEPLOYABLE", label = "Enable ping", default = false, subtab = {"Deployables"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables"}})

    -- Biotech
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_BIOTECH_GROUP", label = "Track Biotech Deployables", default = false, subtab = {"Deployables", "Biotech"}})

    InterfaceOptions.StartGroup({label = "Biotech", subtab = {"Deployables", "Biotech"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_BIOTECH_HEALINGGENERATOR", label = "Healing Generator", default = false, subtab = {"Deployables", "Biotech"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Biotech"}})

    -- Engineer
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_GROUP", label = "Track Engineer Deployables", default = false, subtab = {"Deployables", "Engineer"}})

    InterfaceOptions.StartGroup({label = "Engineer", subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_ANTIPERSONNELTURRET", label = "Anti-Personnel Turret", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_DEPLOYABLESHIELD", label = "Deployable Shield", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_HEAVYTURRET", label = "Heavy Turret", default = false, subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_SUPPLYSTATION", label = "Supply Station", default = false, subtab = {"Deployables", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Engineer"}})

    InterfaceOptions.StartGroup({label = "Bastion", subtab = {"Deployables", "Engineer"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_ENGINEER_MULTITURRET", label = "Multi Turret", default = false, subtab = {"Deployables", "Engineer"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Engineer"}})

    -- Recon
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_GROUP", label = "Track Recon Deployables", default = false, subtab = {"Deployables", "Recon"}})

    InterfaceOptions.StartGroup({label = "Recon", subtab = {"Deployables", "Recon"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_RECON_REMOTEFLASHBANG", label = "Remote Explosive", default = false, subtab = {"Deployables", "Recon"}})
    InterfaceOptions.StopGroup({subtab = {"Deployables", "Recon"}})

    -- Collectibles
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_COLLECTIBLE_GROUP", label = "Track Collectibles", default = false, subtab = {"Collectibles"}})

    InterfaceOptions.StartGroup({label = "Tracking Options", subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_COLLECTIBLE_CODEX", label = "Codex", default = false, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_COLLECTIBLE_RELIC_CACHE", label = "Relic Cache", default = false, subtab = {"Collectibles"}})
    InterfaceOptions.StopGroup({subtab = {"Collectibles"}})

    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_COLLECTIBLE", label = "Show on HUD", default = true, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_COLLECTIBLE", label = "Show on radar", default = false, subtab = {"Collectibles"}})
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_COLLECTIBLE", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Collectibles"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_COLLECTIBLE", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_COLLECTIBLE", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_COLLECTIBLE", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_COLLECTIBLE", label = "Radar marker color", default = {tint = "154889"}, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_COLLECTIBLE", label = "Show on world map", default = false, subtab = {"Collectibles"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_COLLECTIBLE", label = "Enable ping", default = false, subtab = {"Collectibles"}})
    InterfaceOptions.StopGroup({subtab = {"Collectibles"}})

    -- Objectives
    InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_GROUP", label = "Track Objectives", default = false, subtab = {"Objectives"}})

    InterfaceOptions.StartGroup({label = "Miscellanous", subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_CRASHEDTHUMPERPART", label = "Crashed Thumper Part", default = false, subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_DELIRIUMENGINECORE", label = "Delirium Engine Core", default = false, subtab = {"Objectives"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives"}})

    InterfaceOptions.StartGroup({label = "Miscellanous", subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_ARCPORTERPYLON", label = "Arcporter Pylon", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_ARMOREDARANHANEST", label = "Armored Aranha Nest", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_CHOSENSTRIFEBRINGER", label = "Chosen Strifebringer", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_HIJACKEDTERMINAL", label = "Hijacked Terminal", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_RAIDERDISTRESSBEACON", label = "Raider Distress Beacon", default = false, subtab = {"Objectives", "ARES Missions"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives", "ARES Missions"}})

    InterfaceOptions.StartGroup({label = "Accord Datapad", subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_ACCORDDATAPAD", label = "Accord Datapad", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_ACCORDTERMINAL", label = "Accord Terminal", default = false, subtab = {"Objectives", "ARES Missions"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives", "ARES Missions"}})

    InterfaceOptions.StartGroup({label = "Chosen Bomb", subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_CHOSENBOMB", label = "Chosen Bomb", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_DISRUPTIONDEFUSEPIN", label = "Disruption Defuse Pin", default = false, subtab = {"Objectives", "ARES Missions"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives", "ARES Missions"}})

    InterfaceOptions.StartGroup({label = "Recovery Payload", subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_RECOVERYPAYLOADSTORAGE", label = "Recovery Payload Storage", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_CRYSTITECORE", label = "Crystite Core", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_DRILLPARTS", label = "Drill Parts", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_MEDICALSUPPLIES", label = "Medical Supplies", default = false, subtab = {"Objectives", "ARES Missions"}})
        InterfaceOptions.AddCheckBox({id = "DEPLOYABLE_OBJECTIVE_TAINTEDCRYSTITE", label = "Tainted Crystite", default = false, subtab = {"Objectives", "ARES Missions"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives", "ARES Missions"}})

    InterfaceOptions.StartGroup({label = "Marker options", subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_HUD_OBJECTIVE", label = "Show on HUD", default = true, subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_RADAR_OBJECTIVE", label = "Show on radar", default = false, subtab = {"Objectives"}})
        InterfaceOptions.AddChoiceMenu({id = "MARKER_RADAR_EDGE_OBJECTIVE", label = "Radar edge mode", tooltip = "Behavior for the marker when it reaches the edge of the radar", default = "EDGE_NONE", subtab = {"Objectives"}})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_OBJECTIVE", label = "Always show", val = "EDGE_ALWAYS"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_OBJECTIVE", label = "Replace by an arrow", val = "EDGE_CULLED"})
            InterfaceOptions.AddChoiceEntry({menuId = "MARKER_RADAR_EDGE_OBJECTIVE", label = "Never show", val = "EDGE_NONE"})
        InterfaceOptions.AddColorPicker({id = "MARKER_COLOR_OBJECTIVE", label = "Radar marker color", default = {tint = "154889"}, subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_WORLDMAP_OBJECTIVE", label = "Show on world map", default = false, subtab = {"Objectives"}})
        InterfaceOptions.AddCheckBox({id = "MARKER_PING_OBJECTIVE", label = "Enable ping", default = false, subtab = {"Objectives"}})
    InterfaceOptions.StopGroup({subtab = {"Objectives"}})

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
    local nameList = {}

    for name in pairs(Options.IO.Character.Name.List) do
        table.insert(nameList, name)
    end

    table.sort(nameList, function(a, b) return unicode.lower(a) < unicode.lower(b) end)

    if (#nameList > 0) then
        local nameString = ""

        for i = 1, #nameList do
            nameString = nameString .. ChatLib.EncodePlayerLink(nameList[i]) .. (nameList[i + 1] and (i % 5 == 0 and i < #nameList and ",\n\t" or ", ") or "")
        end

        Notification("Currently tracking " .. tostring(#nameList) .. " name" .. (#nameList > 1 and "s" or "") .. ":\n\t" .. nameString)
    else
        Notification("There are no names on the tracking list.")
    end
end

function Options.ApplyOptions()
    Debug.Table("Options.IO", Options.IO)
    Debug.Log("Applying options ...")
    Tracker.CheckAvailableTargets()
    Tracker.UpdateMapMarkerVisibility()
end
