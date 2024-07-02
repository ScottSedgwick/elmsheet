module Utils.ViewUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing ( checked, class, for, id, name, placeholder, style, type_, value )
import Html.Events exposing (..)
import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (Optional)
import Json.Decode as Decode

import Model.Character exposing (..)
import Model.Messages exposing (..)

labelInput : String -> String -> Maybe String -> Character -> (Lens Character String) -> List (Html Msg)
labelInput ident caption mcls char lens =
  [ label [ for ident ] [ text caption ]
  , linkedInput ident caption mcls char lens
  ]

labelInputInt : String -> String -> Maybe String -> Character -> (Lens Character Int) -> List (Html Msg)
labelInputInt ident caption mcls char lens =
  [ label [ for ident ] [ text caption ]
  , linkedInputInt ident caption mcls char lens
  ]

linkedInput : String -> String -> Maybe String -> Character -> (Lens Character String) -> Html Msg
linkedInput ident caption mcls char lens = 
  case mcls of
      Nothing  -> input [ id ident, name ident, placeholder caption, value (lens.get char), onInput (UpdateStr lens) ] []
      Just cls -> input [ id ident, name ident, placeholder caption, class cls, value (lens.get char), onInput (UpdateStr lens) ] []

linkedInputOpt : String -> String -> Maybe String -> Character -> (Optional Character String) -> Html Msg
linkedInputOpt ident caption mcls char lens = 
  let
    val = case lens.getOption char of
            Nothing -> ""
            Just s  -> s
  in
    case mcls of
      Nothing  -> input [ id ident, name ident, placeholder caption, value val, onInput (UpdateOptStr lens) ] []
      Just cls -> input [ id ident, name ident, placeholder caption, class cls, value val, onInput (UpdateOptStr lens) ] []

linkedInputInt : String -> String -> Maybe String -> Character -> (Lens Character Int) -> Html Msg
linkedInputInt ident caption mcls char lens = 
  case mcls of
    Nothing  -> input [ id ident, name ident, placeholder caption, value (String.fromInt (lens.get char)), onInput (UpdateInt lens) ] []
    Just cls -> input [ id ident, name ident, placeholder caption, class cls, value (String.fromInt (lens.get char)), onInput (UpdateInt lens) ] []

labelTextarea : String -> String -> String -> Character -> (Lens Character String) -> List (Html Msg)
labelTextarea ident caption height char lens =
  [ label [ for ident ] [ text caption ]
  , linkedTextarea ident height char lens
  ]

linkedTextarea : String -> String -> Character -> (Lens Character String) -> Html Msg
linkedTextarea ident height char lens = textarea [ id ident, name ident, style "height" height, onInput (UpdateStr lens) ] [ text (lens.get char) ]

decodeCharacterNames : String -> List String
decodeCharacterNames s = 
  case Decode.decodeString (Decode.list Decode.string) s of
    Ok xs -> xs
    Err _ -> []

toInt : String -> Int
toInt s = case (String.toInt s) of
            Just x  -> x
            Nothing -> 0

toBool : String -> Bool
toBool s = if (s == "True" || s == "true") then True else False

linkedCheckbox : String -> Lens Character Bool -> Character -> Html Msg
linkedCheckbox ident lens c = input [ id ident, name ident, type_ "checkbox", checked (lens.get c), onCheck (UpdateBool lens)] []