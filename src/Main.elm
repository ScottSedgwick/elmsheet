module Main exposing ( main )

import Browser
import File
import File.Download as Save
import File.Select as Select
import Html exposing ( Attribute, Html, button, div, node, table, td, text, tr )
import Html.Attributes exposing ( attribute, class, id, style )
import Html.Events exposing ( onClick )
import Json.Decode as Decode
import Json.Encode as Encode
import Task

import Model.Character exposing ( Character, characterDecoder, characterEncoder, charname, imagesize, imageurl, initCharacter )
import Model.Messages exposing ( Msg(..), TabName(..), allTabs, tabName )
import Ports.Ports exposing ( save, doload, load, dolist, listChars, updatetitle, dolog )
import View.Backpack exposing ( viewBackpack )
import View.Features exposing ( viewFeatures )
import View.PortableHole exposing ( viewPortableHole )
import View.Spellcasting exposing ( viewSpellcasting )
import View.Stats exposing ( viewStats )
import Utils.EncodeUtils exposing ( stringEncoder )
import Utils.ViewUtils exposing ( decodeCharacterNames, toInt )

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
    DoSave              -> ( model, save (Encode.encode 0 (Encode.object [("key", Encode.string (charname.get model.character)), ("value", Encode.string ((stringEncoder characterEncoder) model.character)) ] ) ) )
    DoLoad key          -> ( model, Cmd.batch [doload key, updatetitle key] )
    Load value          -> ( model, decodeCharacter value )
    LoadCharacter c     -> ( { model | character = c }, Cmd.none )
    List value          -> ( { model | characterNames = decodeCharacterNames value}, Cmd.none )
    SaveData            -> ( model, Save.string (charname.get model.character ++ ".json") "text/json" ((stringEncoder characterEncoder) model.character) )
    DoLoadFile          -> ( model, Select.file ["text/json"] FileSelected )
    FileSelected file   -> ( model, Task.perform Load (File.toString file))
    ConsoleLog message  -> ( model, dolog message)

decodeCharacter : String -> Cmd Msg --Character
decodeCharacter s =
  case Decode.decodeString characterDecoder s of
    Ok value -> Task.perform LoadCharacter (Task.succeed value)
    Err e -> Task.perform ConsoleLog (Task.succeed ((Decode.errorToString e) ++ "\n" ++ s))

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
              , tr [] [ td [] [ button [ onClick DoSave,     class "loadbutton" ] [ text "Save" ] ] ]
              , tr [] [ td [] [ button [ onClick SaveData,   class "loadbutton" ] [ text "Save To File" ] ] ]
              , tr [] [ td [] [ button [ onClick DoLoadFile, class "loadbutton" ] [ text "Load from File" ] ] ]
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
    c : String
    c = if (a == n) then " active" else ""
  in
    button [ class ("tablink tablinks" ++ c), onClick (ChangeTab n) ] [ text (tabName n) ]

tabBody : Character -> TabName -> TabName -> Html Msg
tabBody c a n = 
  let
    attrs : List (Attribute Msg)
    attrs = if (a == n) then [ id (tabName n), class "tabcontent", style "display" "block" ] else [ id (tabName n), class "tabcontent" ]
    tabView : List (Html Msg)
    tabView = 
      case n of
        Stats -> [viewStats c]
        Features -> viewFeatures c
        Backpack -> viewBackpack c
        PortableHole -> viewPortableHole c
        Spellcasting -> viewSpellcasting c
  in
    div attrs tabView

subscriptions : Model -> Sub Msg
subscriptions _ = Sub.batch [load Load, listChars List]