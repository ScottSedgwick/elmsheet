module View.Backpack exposing (..)

import Html exposing (..)
import Html.Attributes exposing ( class, for )
import Html.Events exposing (..)
import Monocle.Lens exposing (Lens)

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewBackpack : Character -> List (Html Msg)
viewBackpack c = 
  [ form [ class "charsheet" ]
    [ header [ class "charform" ] 
      [ section [ class "charname" ] (labelInput "charname" "Character Name" Nothing c charname)
      , section [ class "misc" ]
        [ b [] [ text "Backpacks can hold no more than 30 lbs of gear." ]
        , br [] []
        , text "Note weight of items to not exceed the 30 lbs limit."
        , br [] []
        , text "Note the quantity of items for quick reference."
        , br [] []
        , text "Your treasure pouch is not part of your backpack so its weight will not count."
        ]
      ]
    , node "main" [] 
      [ section []
        ([ section []
          [ label [ for "bedroll" ] [ text "Exterior" ]
          , table []
            [ tableRow "bedroll" "Bed Roll" c bedroll
            , tableRow "rope"    "Rope"     c rope
            , tableRow "ammo"    "Ammo"     c ammo
            , tableRow "torches" "Torches"  c torches
            ]
          ]
        , label [ for "copper" ] [ text "Treasure Purse" ]  
        , table []
          [ tableRow "copper"   "Copper"   c copper
          , tableRow "silver"   "Silver"   c silver
          , tableRow "electrum" "Electrum" c electrum
          , tableRow "gold"     "Gold"     c gold
          , tableRow "platinum" "Platinum" c platinum
          ]
         ]
         ++ labelTextarea "pocket1" "Small Pocket 1" "7em" c pocket1
         ++ labelTextarea "pocket2" "Small Pocket 2" "7em" c pocket2
         ++ labelTextarea "pocket3" "Small Pocket 3" "7em" c pocket3
         ++ labelTextarea "pocket4" "Small Pocket 4" "7em" c pocket4
        )
      , section []
        (  labelTextarea "flap"   "Flap Pouch"   "19em" c flappouch
        ++ labelTextarea "middle" "Middle Pouch" "37em" c middlepouch
        )
      , section [] (labelTextarea "mainpouch" "Main Pouch" "59em" c mainpouch)
      ]
    ]
  ]

tableRow : String -> String -> Character -> (Lens Character String) -> Html Msg
tableRow ident  caption char lens = 
  tr []
    [ td [] [ text caption ]
    , td [] [ linkedInput ident caption Nothing char lens ]
    ]