module View.Features exposing (..)

import Html exposing (..)
import Html.Attributes exposing ( class )
import Html.Events exposing (..)

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewFeatures : Character -> List (Html Msg)
viewFeatures c = 
  [ form [ class "charsheet" ]
    [ header [ class "charform" ] 
      [ section [ class "charname" ] (labelInput "charname" "Character Name" Nothing c charname)
      , section [ class "misc" ]
        [ ul []
          [ li [] (labelInput "age"    "Age"    (Just "input-center") c age)
          , li [] (labelInput "height" "Height" (Just "input-center") c height)
          , li [] (labelInput "weight" "Weight" (Just "input-center") c weight)
          , li [] (labelInput "eyes"   "Eyes"   (Just "input-center") c eyes)
          , li [] (labelInput "skin"   "Skin"   (Just "input-center") c skin)
          , li [] (labelInput "hair"   "Hair"   (Just "input-center") c hair)
          ]
        ]
      ]
    , node "main" []
      [ section []
        (  labelTextarea "faction"    "Faction"    "3em"  c faction
        ++ labelTextarea "background" "Background" "50em" c fullbackground
        )
      , section [] ( labelTextarea "features" "Features" "56em"  c features)
      , section [] ( labelTextarea "traits"   "Traits"   "56em"  c traits)
      ]
    ]
  ]
