module Model.Messages exposing (..)

import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)
import Model.Character exposing (Character)

type TabName
  = Stats
  | Features
  | Backpack
  | PortableHole
  | Spellcasting

allTabs : List TabName
allTabs = [Stats, Features, Backpack, PortableHole, Spellcasting]

tabName : TabName -> String
tabName x = 
  case x of
    Stats -> "Stats"
    Features -> "Features"
    Backpack -> "Backpack"
    PortableHole -> "Portable Hole"
    Spellcasting -> "Spellcasting"

type Msg
  = ChangeTab TabName
  | UpdateStr (Lens Character String) String
  | UpdateInt (Lens Character Int) String
  | UpdateBool (Lens Character Bool) Bool
  | UpdateOptStr (Optional Character String) String
  | DoSave
  | DoLoad String
  | Load String
  | DoList
  | List String
  | SaveData