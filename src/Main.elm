module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Encode as Encode

import Model.Character exposing (..)
import Model.Messages exposing (..)
import Ports.Ports exposing (..)
import View.Backpack exposing (..)
import View.Features exposing (..)
import View.Stats exposing (..)
import Utils.ViewUtils exposing (..)

-- MAIN
main : Program () Model Msg
main = Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }

-- MODEL
type alias Model =
  { activeTab : TabName
  , character : Character
  , characterNames : List String
  }

init : flags -> (Model, Cmd Msg)
init _ = ({ character = initCharacter, activeTab = Stats, characterNames = [] }, dolist () )

-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    ChangeTab n         -> ( { model | activeTab = n }, Cmd.none)
    UpdateStr lens v    -> ( { model | character = lens.set v model.character }, updatetitle (charname.get model.character) )
    UpdateOptStr lens v -> ( { model | character = lens.set v model.character }, Cmd.none )
    UpdateInt lens v    -> ( { model | character = lens.set (toInt v) model.character }, Cmd.none )
    UpdateBool lens v   -> ( { model | character = lens.set v model.character}, Cmd.none)
    DoSave              -> ( model, save (Encode.encode 0 (Encode.object [("key", Encode.string (charname.get model.character)), ("value", Encode.string (characterEncoder model.character)) ] ) ) )
    DoLoad key          -> ( model, Cmd.batch [doload key, updatetitle key] )
    Load value          -> ( { model | character = decode value }, Cmd.none )
    DoList              -> ( model, dolist ())
    List value          -> ( { model | characterNames = decodeCharacterNames value}, Cmd.none )

-- VIEW
view : Model -> Html Msg
view model =
  div [ style "background-image" ("url('" ++ imageurl.get model.character ++ "')"), style "background-size" (imagesize.get model.character) ]
    [ table []
      [ tr []
        [ td [ class "loadpanel" ] 
          [ table [] 
            ( List.append ( List.map loadButton model.characterNames )
              [ tr [ class "spacer-row " ] [ td [] [] ]
              , tr [] [ td [] [ button [ onClick DoList, class "loadbutton" ] [ text "Refresh List" ] ] ]
              , tr [] [ td [] [ button [ onClick DoSave, class "loadbutton" ] [ text "Save" ] ] ]
              ]
            )
          ]
        , td []
          [ node "main" [ class "page-content", attribute "aria-label" "Content" ] 
            [ div [ class "wrapper" ]
              (div [ class "tab" ] (List.map (tabButton model.activeTab) allTabs) :: ( List.map (tabBody model.character model.activeTab) allTabs ))
            ]
          ]
        ]
      ]
    ]

loadButton : String -> Html Msg
loadButton s = tr [] [ td [] [ button [onClick (DoLoad s), class "loadbutton"] [ text ("Load " ++ s) ] ] ]

tabButton : TabName -> TabName -> Html Msg
tabButton a n = 
  let
    c = if (a == n) then " active" else ""
  in
    button [ class ("tablink tablinks" ++ c), onClick (ChangeTab n) ] [ text (tabName n) ]

tabBody : Character -> TabName -> TabName -> Html Msg
tabBody c a n = 
  let
    attrs = if (a == n) then [ id (tabName n), class "tabcontent", style "display" "block" ] else [ id (tabName n), class "tabcontent" ]
    tabView = 
      case n of
        Stats -> [viewStats c]
        Features -> viewFeatures c
        Backpack -> viewBackpack c
  in
    div attrs tabView

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.batch [load Load, listChars List]