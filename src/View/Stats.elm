module View.Stats exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, for, id, name, placeholder, type_, value, width)
import Html.Events exposing (..)
import Monocle.Common exposing (list)
import Monocle.Lens exposing (Lens)
import Monocle.Optional exposing (fromLens, compose, composeLens)

import Model.Attack exposing (..)
import Model.Character exposing (..)
import Model.Messages exposing (..)
import Utils.ViewUtils exposing (..)

viewStats : Character -> Html Msg
viewStats c = 
  form [ class "charsheet" ]
    [ header [ class "charform" ]
      [ section [class "charname" ] (labelInput "charname" "Character Name" Nothing c charname)
      , section [class "misc"]
        [ ul []
          [ li [] (labelInput "classlevel"       "Class"             (Just "input-center") c charclass)
          , li [] (labelInputInt "level"         "Level"             (Just "input-center") c level)
          , li [] (labelInput "playername"       "Player Name"       (Just "input-center") c player)
          , li [] (labelInput "race"             "Race"              (Just "input-center") c race)
          , li [] (labelInput "background"       "Background"        (Just "input-center") c background)
          , li [] (labelInput "experiencepoints" "Experience Points" (Just "input-center") c experiencepoints)
          ]
        ]
      ]
    , node "main" []
      [ sectionAttributes c
      , section []
        [ sectionCombat c
        , sectionAttacks c
        , sectionEquipment c
        ] 
      , sectionFlavor c
      ]
    ]

sectionAttributes : Character -> Html Msg
sectionAttributes c =
  section []
  [ section [ class "attributes" ]
    [ div [ class "scores" ]
    [ ul []
      [ li [] ( scoreSection "strength"     "Strength"     c strength )
      , li [] ( scoreSection "dexterity"    "Dexterity"    c dexterity )
      , li [] ( scoreSection "constitution" "Constitution" c constitution )
      , li [] ( scoreSection "wisdom"       "Wisdom"       c wisdom )
      , li [] ( scoreSection "intelligence" "Intelligence" c intelligence )
      , li [] ( scoreSection "charisma"     "Charisma"     c charisma )
      ]
    ]
    , div [ class "attr-applications" ]
    [ div [ class "inspiration box" ]
      [ div [ class "label-container" ] [ label [ for "inspiration" ] [ text "Inspiration" ] ]
      , linkedCheckbox "inspiration" inspiration c
      ]
    , div [ class "proficiencybonus box" ]
      [ div [ class "label-container" ] [ label [ for "proficiencybonus" ] [ text "Proficiency Bonus" ] ]
      , input [ id "proficiencybonus", name "proficiencybonus", value (String.fromInt (profBonus c)) ] []
      ]
    , div [ class "saves list-section box" ]
      [ ul []
        [ statSaveItem "Strength"     strength     strengthProficiency     c 
        , statSaveItem "Dexterity"    dexterity    dexterityProficiency    c 
        , statSaveItem "Constitution" constitution constitutionProficiency c 
        , statSaveItem "Wisdom"       wisdom       wisdomProficiency       c 
        , statSaveItem "Intelligence" intelligence intelligenceProficiency c 
        , statSaveItem "Charisma"     charisma     charismaProficiency     c 
        ]
      , div [ class "label"] [ text "Saving Throws" ]
      ]
    , div [ class "skills list-section box" ]
      [ ul [] 
        [ skillBox "Acrobatics"      "Dex" dexterity    acrobatics     c
        , skillBox "Animal Handling" "Wis" wisdom       animalhandling c
        , skillBox "Arcana"          "Int" intelligence arcana         c
        , skillBox "Athletics"       "Str" strength     athletics      c 
        , skillBox "Deception"       "Cha" charisma     deception      c 
        , skillBox "History"         "Int" intelligence history        c 
        , skillBox "Insight"         "Wis" wisdom       insight        c 
        , skillBox "Intimidation"    "Cha" charisma     intimidation   c 
        , skillBox "Investigation"   "Int" intelligence investigation  c 
        , skillBox "Medicine"        "Wis" wisdom       medicine       c 
        , skillBox "Nature"          "Int" intelligence nature         c 
        , skillBox "Perception"      "Wis" wisdom       perception     c 
        , skillBox "Performance"     "Cha" charisma     performance    c 
        , skillBox "Persuasion"      "Cha" charisma     persuasion     c 
        , skillBox "Religion"        "Int" intelligence religion       c 
        , skillBox "Sleight of Hand" "Dex" dexterity    sleightofhand  c 
        , skillBox "Stealth"         "Dex" dexterity    stealth        c 
        , skillBox "Survival"        "Wis" wisdom       survival       c 
        ]
      , div [ class "label" ] [ text "Skills" ]
      ]
    ]
    ]
  , passiveBox "passive-perception"    "Passive Perception"    c passiveperception
  , passiveBox "passive-insight"       "Passive Insight"       c passiveinsight
  , passiveBox "passive-investigation" "Passive Investigation" c passiveinvestigation
  , div [ class "otherprofs box textblock"] (labelTextarea "otherprofs" "Other Proficiencies and Languages" "16em" c otherprofs)
  ]

passiveBox : String -> String -> Character -> (Lens Character Int) -> Html Msg
passiveBox ident caption char lens =
  div [ class "passive-perception box" ] 
    [ div [ class "label-container"] [ label [ for ident ] [ text caption] ]
    , linkedInputInt ident caption Nothing char lens
    ]

sectionCombat : Character -> Html Msg
sectionCombat c =
  section [] 
  [ section [ class "combat" ]
    [ div [ class "armorclass" ] [ div [] (labelInputInt "ac" "AC" Nothing c ac) ]
    , div [ class "initiative" ] [ div [] (labelInputInt "initiative" "Initiative" Nothing c initiative) ]
    , div [ class "speed" ] [ div [] (labelInputInt "speed" "Speed" Nothing c speed) ]
    , div [ class "hp" ] 
      [ div [class "regular" ]
        [ div [ class "max" ] (labelInputInt "maxhp" "Hit Point Maximum" Nothing c maxhp)
        , div [ class "current" ] (labelInputInt "currenthp" "Current Hit Points" Nothing c currhp)
        ]
      , div [ class "temporary" ] (labelInputInt "temphp" "Temporary Hit Points" Nothing c temphp)
      ]
    , div [ class "hitdice" ] 
      [ div []
        [ div [ class "total" ] (labelInputInt "totalhd" "Total" Nothing c totalhd)
        , div [ class "remaining" ] (labelInputInt "remaininghd" "Hit Dice" Nothing c remaininghd)
        ]
      ]
    , div [ class "deathsaves" ] 
      [ div []
        [ div [ class "label" ] [ label [ for "deathsavesuccess2" ] [ text "Death Saves" ] ]
        , div [ class "marks" ]
          [ div [ class "deathsuccesses" ] 
            [ label [ for "deathsavesuccess1" ] [ text "Successes" ]
            , div [ class "bubbles" ] 
              [ linkedCheckbox "deathsavesuccess1" deathsavesuccess1 c
              , linkedCheckbox "deathsavesuccess2" deathsavesuccess2 c
              , linkedCheckbox "deathsavesuccess3" deathsavesuccess3 c
              ]
            ]
          , div [ class "deathfails" ] 
            [ label [ for "deathsavefail1" ] [ text "Failures" ]
            , div [ class "bubbles" ] 
              [ linkedCheckbox "deathsavefail1" deathsavefail1 c
              , linkedCheckbox "deathsavefail2" deathsavefail2 c
              , linkedCheckbox "deathsavefail3" deathsavefail3 c
              ]
            ]
          ]
        ]
      ]    
    ]
  ]

sectionAttacks : Character -> Html Msg
sectionAttacks c = 
  section [ class "attacksandspellcasting"] 
  [ div []
    [ label [for "attack1name" ] [ text "Attacks & Spellcasting" ]
    , table []
      [ thead []
        [ tr []
          [ th [ width 90 ] [ text "Name" ]
          , th [ width 40 ] [ text "Bonus" ]
          , th [] [ text "Damage/Type" ]
          ]
        ]
      , tbody [] (List.indexedMap (rowAttack c) (attacks.get c))
      ]
    ]
  ]

rowAttack : Character -> Int -> Attack -> Html Msg
rowAttack c n _ =
  let
    ident = "attack" ++ String.fromInt n
    clens = compose (fromLens attacks) (list n)
  in
    tr []
    [ td [] [ linkedInputOpt (ident ++ "name"  ) "" Nothing c (composeLens clens attackname  ) ]
    , td [] [ linkedInputOpt (ident ++ "bonus" ) "" Nothing c (composeLens clens attackbonus ) ]
    , td [] [ linkedInputOpt (ident ++ "damage") "" Nothing c (composeLens clens attackdamage) ]
    ]

sectionEquipment : Character -> Html Msg
sectionEquipment c = 
  section [ class "equipment" ] 
  [ div []
    [ label [ for "equipment" ] [ text "Equipment" ]
    , div [ class "money" ]
      [ ul []
        [ li [] [ div [] (labelInputInt "cp" "CP" Nothing c cp) ]
        , li [] [ div [] (labelInputInt "sp" "SP" Nothing c sp) ]
        , li [] [ div [] (labelInputInt "ep" "EP" Nothing c ep) ]
        , li [] [ div [] (labelInputInt "gp" "GP" Nothing c gp) ]
        , li [] [ div [] (labelInputInt "pp" "PP" Nothing c pp) ]
        ]
      ]
    , linkedTextarea "equipment" "22em" c equipment
    ]
  ]

sectionFlavor : Character -> Html Msg
sectionFlavor c = 
  section [] 
  [ section [ class "flavor" ]
    [ div [ class "personality" ] (labelTextarea "personality" "Personality" "4em" c personality)
    , div [ class "ideals" ]      (labelTextarea "ideals"      "Ideals"      "4em" c ideals)
    , div [ class "bonds" ]       (labelTextarea "bonds"       "Bonds"       "4em" c bonds)
    , div [ class "flaws" ]       (labelTextarea "flaws"       "Flaws"       "4em" c flaws)
    ]
  , section [ class "features" ]
    [ div [ class "features" ]    (labelTextarea "features"    "Features"   "45em" c fullfeatures) ]
  ]

scoreSection : String -> String -> Character -> (Lens Character Int) -> List (Html Msg)
scoreSection ident caption c lens =
  [ div [ class "score" ]
      [ label [ for ident ] [ text caption ]
      , input [ id ident, name ident, placeholder caption, value (String.fromInt (lens.get c)), onInput (UpdateInt lens) ] []
      ]
  , div [ class "modifier" ]
    [ input [ id (ident ++ "modifier"), placeholder "0", value (String.fromInt (statBonus (lens.get c)))] []]
  ]

statBonus : Int -> Int
statBonus x = (x - 10) // 2

statSaveItem : String -> (Lens Character Int) -> (Lens Character Bool) -> Character -> Html Msg
statSaveItem ident statLens profLens c =
  li [] 
    [ label [ for (ident ++ "-save") ] [ text ident]
    , input [ id (ident ++ "-save"), name (ident ++ "-save"), placeholder "0", type_ "text", value (String.fromInt (calcSave statLens profLens c))] []
    , linkedCheckbox (ident ++ "-save-prof") profLens c
    ]

calcSave : (Lens Character Int) -> (Lens Character Bool) -> Character -> Int
calcSave statLens profLens c = 
  let
    prof = if profLens.get c then profBonus c else 0
    stat = statBonus (statLens.get c)
  in
    prof + stat 

profBonus : Character -> Int
profBonus c = ((level.get c - 1) // 4) + 2

skillBox : String -> String -> (Lens Character Int) -> (Lens Character Bool) -> Character -> Html Msg
skillBox caption stat statLens profLens c =
  li []
    [ label [ for caption ] [ text caption, span [ class "skill" ] [ text (" (" ++ stat ++ ")")] ]
    , input [ id caption, name caption, value (String.fromInt (calcSkillBonus statLens profLens c)), type_ "text" ] []
    , linkedCheckbox (caption ++ "-prof") profLens c
    ]

calcSkillBonus : (Lens Character Int) -> (Lens Character Bool) -> Character -> Int
calcSkillBonus statLens profLens c =
  let
    pb = if (profLens.get c) then profBonus c else 0
    sb = statBonus (statLens.get c)
  in
    pb + sb