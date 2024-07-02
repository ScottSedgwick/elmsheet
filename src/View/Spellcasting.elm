module View.Spellcasting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (..)

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewSpellcasting : Character -> List (Html Msg)
viewSpellcasting c = 
  [
  form [ class "charsheet" ]
    [ header [ class "charform" ]
      [ section [class "charname" ] (labelInput "spellclass" "Spellcasting Class" Nothing c spellclass)
      , section [class "misc"]
        [ ul []
          [ li [] (labelInput "spellability"  "Spellcasting Ability" (Just "input-center") c spellability)
          , li [] (labelInput "spellsavedc"   "Spell Save DC"        (Just "input-center") c spellsavedc)
          , li [] (labelInput "spellattackb"  "Spell Attack Bonus"   (Just "input-center") c spellattackb)
          , li [] (labelInput "preparespells" "Prepare # spells"     (Just "input-center") c preparespells)
          ]
        ]
      ]
    , node "main" []
      [ ]
    ]
  ]