module View.Spellcasting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, for, name, placeholder, type_, value, width)
import Html.Events exposing (..)
import Monocle.Common exposing (list)
import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (fromLens, compose, composeLens)

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewSpellcasting : Character -> List (Html Msg)
viewSpellcasting c = 
  [ tr [] [ text "Spellcasting" ]
  ]