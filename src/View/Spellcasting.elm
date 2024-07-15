module View.Spellcasting exposing ( viewSpellcasting )

import Html exposing ( Html, form, header, li, node, section, ul )
import Html.Attributes exposing (class)

import Model.Character exposing ( Character, spellclass, spellability, spellsavedc, spellattackb, preparespells )
import Model.Messages exposing ( Msg )
import Utils.ViewUtils exposing ( labelInput )

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