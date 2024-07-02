module View.PortableHole exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (..)

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewPortableHole : Character -> List (Html Msg)
viewPortableHole c = 
  [ form [ class "charsheet" ]
    [ header [ class "charform" ] 
      [ section [ class "charname" ] (labelInput "charname" "Character Name" Nothing c charname)
      , section [ class "misc" ]
        [ b [] [ text "Bag of Holding:" ]
        , br [] []
        , text "This bag has an interior space considerably larger than its outside dimesnions, roughly"
        , br [] []
        , text "2 feet in diameter at the mouth and 4 feet deep. The bag can hold up to 500 pounds,"
        , br [] []
        , text "not exceeding a volume of 64 cubic feet."
        ]
      ]
    , node "main" [] 
      [ section [] ( labelTextarea "potionsgems" "Potions & Gems" "59em" c potionsgems )
      , section [] ( labelTextarea "phitems1"    "Items"          "59em" c phitems1 )
      , section [] ( labelTextarea "phitems2"    "Items"          "59em" c phitems2 )
      ]
    ]
  ]