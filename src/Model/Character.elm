module Model.Character exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode
import Result exposing (Result(..))
import Monocle.Lens exposing (Lens)

type alias Character =
  { charname_ : String
  , player_ : String
  , age_ : String
  , height_ : String
  , weight_ : String
  , eyes_ : String
  , skin_ : String
  , hair_ : String
  , faction_ : String
  , fullbackground_ : String
  , bedroll_ : String
  , rope_ : String
  , ammo_ : String
  , torches_ : String
  , copper_ : String
  , silver_ : String
  , electrum_ : String
  , gold_ : String
  , platinum_ : String
  , pocket1_ : String
  , pocket2_ : String
  , pocket3_ : String
  , pocket4_ : String
  , flappouch_ : String
  , middlepouch_ : String
  , mainpouch_ : String
  , features_ : String
  , traits_ : String
  , charclass_ : String
  , level_ : Int
  , background_ : String
  , race_ : String
  , alignment_ : String
  , experiencepoints_ : String
  , strength_ : Int
  , dexterity_ : Int
  , constitution_ : Int
  , wisdom_ : Int
  , intelligence_ : Int
  , charisma_ : Int
  , strengthProficiency_ : Bool
  , dexterityProficiency_ : Bool
  , constitutionProficiency_ : Bool
  , wisdomProficiency_ : Bool
  , intelligenceProficiency_ : Bool
  , charismaProficiency_ : Bool
  , acrobatics_ : Bool
  , animalhandling_ : Bool
  , arcana_ : Bool
  , athletics_ : Bool
  , deception_ : Bool
  , history_ : Bool
  , insight_ : Bool
  , intimidation_ : Bool
  , investigation_ : Bool
  , medicine_ : Bool
  , nature_ : Bool
  , perception_ : Bool
  , performance_ : Bool
  , persuasion_ : Bool
  , religion_ : Bool
  , sleightofhand_ : Bool
  , stealth_ : Bool
  , survival_ : Bool
  , otherprofs_ : String
  , ac_ : Int
  , initiative_ : Int
  , speed_ : Int
  , maxhp_ : Int
  , currhp_ : Int
  , temphp_ : Int
  , totalhd_ : Int
  , remaininghd_ : Int
  , attacks_ : List Attack
  , cp_ : Int
  , sp_ : Int
  , ep_ : Int
  , gp_ : Int
  , pp_ : Int
  , equipment_ : String
  , personality_ : String
  , ideals_ : String
  , bonds_ : String
  , flaws_ : String
  , fullfeatures_ : String
  , imageurl_ : String
  , imagesize_ : String
  , passiveperception_ : Int
  , passiveinsight_ : Int
  , passiveinvestigation_ : Int
  , deathsavesuccess1_ : Bool
  , deathsavesuccess2_ : Bool
  , deathsavesuccess3_ : Bool
  , deathsavefail1_ : Bool
  , deathsavefail2_ : Bool
  , deathsavefail3_ : Bool
  , inspiration_ : Bool
  , spellclass_ : String
  , spellability_ : String
  , spellsavedc_ : String
  , spellattackb_ : String
  , preparespells_ : String
  , potionsgems_ : String
  , phitems1_ : String
  , phitems2_ : String
  }

characterEncoder : Character -> String
characterEncoder c = Encode.encode 0 
  ( Encode.object
    [ ("name", Encode.string c.charname_)
    , ("player", Encode.string c.player_)
    , ("age", Encode.string c.age_)
    , ("height", Encode.string c.height_)
    , ("weight", Encode.string c.weight_)
    , ("eyes", Encode.string c.eyes_)
    , ("skin", Encode.string c.skin_)
    , ("hair", Encode.string c.hair_)
    , ("faction", Encode.string c.faction_)
    , ("fullbackground", Encode.string c.fullbackground_)
    , ("bedroll", Encode.string c.bedroll_)
    , ("rope", Encode.string c.rope_)
    , ("ammo", Encode.string c.ammo_)
    , ("torches", Encode.string c.torches_)
    , ("copper", Encode.string c.copper_)
    , ("silver", Encode.string c.silver_)
    , ("electrum", Encode.string c.electrum_)
    , ("gold", Encode.string c.gold_)
    , ("platinum", Encode.string c.platinum_)
    , ("pocket1", Encode.string c.pocket1_)
    , ("pocket2", Encode.string c.pocket2_)
    , ("pocket3", Encode.string c.pocket3_)
    , ("pocket4", Encode.string c.pocket4_)
    , ("flap", Encode.string c.flappouch_)
    , ("middle", Encode.string c.middlepouch_)
    , ("mainpouch", Encode.string c.mainpouch_)
    , ("features", Encode.string c.features_)
    , ("traits", Encode.string c.traits_)
    , ("class", Encode.string c.charclass_)
    , ("level", Encode.int c.level_)
    , ("background", Encode.string c.background_)
    , ("race", Encode.string c.race_)
    , ("alignment", Encode.string c.alignment_)
    , ("experiencepoints", Encode.string c.experiencepoints_)
    , ("strength", Encode.int c.strength_)
    , ("dexterity", Encode.int c.dexterity_)
    , ("constitution", Encode.int c.constitution_)
    , ("wisdom", Encode.int c.wisdom_)
    , ("intelligence", Encode.int c.intelligence_)
    , ("charisma", Encode.int c.charisma_)
    , ("strengthProficiency", Encode.bool c.strengthProficiency_)
    , ("dexterityProficiency", Encode.bool c.dexterityProficiency_)
    , ("constitutionProficiency", Encode.bool c.constitutionProficiency_)
    , ("wisdomProficiency", Encode.bool c.wisdomProficiency_)
    , ("intelligenceProficiency", Encode.bool c.intelligenceProficiency_)
    , ("charismaProficiency", Encode.bool c.charismaProficiency_)
    , ("acrobatics", Encode.bool c.acrobatics_)
    , ("animalhandling", Encode.bool c.animalhandling_)
    , ("arcana", Encode.bool c.arcana_)
    , ("athletics", Encode.bool c.athletics_)
    , ("deception", Encode.bool c.deception_)
    , ("history", Encode.bool c.history_)
    , ("insight", Encode.bool c.insight_)
    , ("intimidation", Encode.bool c.intimidation_)
    , ("investigation", Encode.bool c.investigation_)
    , ("medicine", Encode.bool c.medicine_)
    , ("nature", Encode.bool c.nature_)
    , ("perception", Encode.bool c.perception_)
    , ("performance", Encode.bool c.performance_)
    , ("persuasion", Encode.bool c.persuasion_)
    , ("religion", Encode.bool c.religion_)
    , ("sleightofhand", Encode.bool c.sleightofhand_)
    , ("stealth", Encode.bool c.stealth_)
    , ("survival", Encode.bool c.survival_)
    , ("otherprofs", Encode.string c.otherprofs_)
    , ("ac", Encode.int c.ac_)
    , ("initiative", Encode.int c.initiative_)
    , ("speed", Encode.int c.speed_)
    , ("maxhp", Encode.int c.maxhp_)
    , ("currhp", Encode.int c.currhp_)
    , ("temphp", Encode.int c.temphp_)
    , ("totalhd", Encode.int c.totalhd_)
    , ("remaininghd", Encode.int c.remaininghd_)
    , ("attacks", Encode.list attackEncoder c.attacks_)
    , ("cp", Encode.int c.cp_)
    , ("sp", Encode.int c.sp_)
    , ("ep", Encode.int c.ep_)
    , ("gp", Encode.int c.gp_)
    , ("pp", Encode.int c.pp_)
    , ("equipment", Encode.string c.equipment_)
    , ("personality", Encode.string c.personality_)
    , ("ideals", Encode.string c.ideals_)
    , ("bonds", Encode.string c.bonds_)
    , ("flaws", Encode.string c.flaws_)
    , ("fullfeatures", Encode.string c.fullfeatures_)
    , ("imageurl", Encode.string c.imageurl_)
    , ("imagesize", Encode.string c.imagesize_)
    , ("passiveperception", Encode.int c.passiveperception_)
    , ("passiveinsight", Encode.int c.passiveinsight_)
    , ("passiveinvestigation", Encode.int c.passiveinvestigation_)
    , ("deathsavesuccess1", Encode.bool c.deathsavesuccess1_)
    , ("deathsavesuccess2", Encode.bool c.deathsavesuccess2_)
    , ("deathsavesuccess3", Encode.bool c.deathsavesuccess3_)
    , ("deathsavefail1", Encode.bool c.deathsavefail1_)
    , ("deathsavefail2", Encode.bool c.deathsavefail2_)
    , ("deathsavefail3", Encode.bool c.deathsavefail3_)
    , ("inspiration", Encode.bool c.inspiration_)
    , ("spellclass", Encode.string c.spellclass_)
    , ("spellability", Encode.string c.spellability_)
    , ("spellsavedc", Encode.string c.spellsavedc_)
    , ("spellattackb", Encode.string c.spellattackb_)
    , ("preparespells", Encode.string c.preparespells_)
    , ("potionsgems", Encode.string c.potionsgems_)
    , ("phitems1", Encode.string c.phitems1_)
    , ("phitems2", Encode.string c.phitems2_)
    ]
  )

characterDecoder : Decode.Decoder Character
characterDecoder =
  Decode.succeed Character
    |> optional "name" Decode.string ""
    |> optional "player" Decode.string ""
    |> optional "age" Decode.string ""
    |> optional "height" Decode.string ""
    |> optional "weight" Decode.string ""
    |> optional "eyes" Decode.string ""
    |> optional "skin" Decode.string ""
    |> optional "hair" Decode.string ""
    |> optional "faction" Decode.string ""
    |> optional "fullbackground" Decode.string ""
    |> optional "bedroll" Decode.string ""
    |> optional "rope" Decode.string ""
    |> optional "ammo" Decode.string ""
    |> optional "torches" Decode.string ""
    |> optional "copper" Decode.string ""
    |> optional "silver" Decode.string ""
    |> optional "electrum" Decode.string ""
    |> optional "gold" Decode.string ""
    |> optional "platinum" Decode.string ""
    |> optional "pocket1" Decode.string ""
    |> optional "pocket2" Decode.string ""
    |> optional "pocket3" Decode.string ""
    |> optional "pocket4" Decode.string ""
    |> optional "flappouch" Decode.string ""
    |> optional "middlepouch" Decode.string ""
    |> optional "mainpouch" Decode.string ""
    |> optional "features" Decode.string ""
    |> optional "traits" Decode.string ""
    |> optional "class" Decode.string ""
    |> optional "level" Decode.int 0
    |> optional "background" Decode.string ""
    |> optional "race" Decode.string ""
    |> optional "alignment" Decode.string ""
    |> optional "experiencepoints" Decode.string ""
    |> optional "strength" Decode.int 0
    |> optional "dexterity" Decode.int 0
    |> optional "constitution" Decode.int 0
    |> optional "wisdom" Decode.int 0
    |> optional "intelligence" Decode.int 0
    |> optional "charisma" Decode.int 0
    |> optional "strengthProficiency" Decode.bool False
    |> optional "dexterityProficiency" Decode.bool False
    |> optional "constitutionProficiency" Decode.bool False
    |> optional "wisdomProficiency" Decode.bool False
    |> optional "intelligenceProficiency" Decode.bool False
    |> optional "charismaProficiency" Decode.bool False
    |> optional "acrobatics" Decode.bool False
    |> optional "animalhandling" Decode.bool False
    |> optional "arcana" Decode.bool False
    |> optional "athletics" Decode.bool False
    |> optional "deception" Decode.bool False
    |> optional "history" Decode.bool False
    |> optional "insight" Decode.bool False
    |> optional "intimidation" Decode.bool False
    |> optional "investigation" Decode.bool False
    |> optional "medicine" Decode.bool False
    |> optional "nature" Decode.bool False
    |> optional "perception" Decode.bool False
    |> optional "performance" Decode.bool False
    |> optional "persuasion" Decode.bool False
    |> optional "religion" Decode.bool False
    |> optional "sleightofhand" Decode.bool False
    |> optional "stealth" Decode.bool False
    |> optional "survival" Decode.bool False
    |> optional "otherprofs" Decode.string ""
    |> optional "ac" Decode.int 0
    |> optional "initiative" Decode.int 0
    |> optional "speed" Decode.int 0
    |> optional "maxhp" Decode.int 0
    |> optional "currhp" Decode.int 0
    |> optional "temphp" Decode.int 0
    |> optional "totalhd" Decode.int 0
    |> optional "remaininghd" Decode.int 0
    |> optional "attacks" (Decode.list attackDecoder) []
    |> optional "cp" Decode.int 0
    |> optional "sp" Decode.int 0
    |> optional "ep" Decode.int 0
    |> optional "gp" Decode.int 0
    |> optional "pp" Decode.int 0
    |> optional "equipment" Decode.string ""
    |> optional "personality" Decode.string ""
    |> optional "ideals" Decode.string ""
    |> optional "bonds" Decode.string ""
    |> optional "flaws" Decode.string ""
    |> optional "fullfeatures" Decode.string ""
    |> optional "imageurl" Decode.string ""
    |> optional "imagesize" Decode.string ""
    |> optional "passiveperception" Decode.int 0
    |> optional "passiveinsight" Decode.int 0
    |> optional "passiveinvestigation" Decode.int 0
    |> optional "deathsavesuccess1" Decode.bool False
    |> optional "deathsavesuccess2" Decode.bool False
    |> optional "deathsavesuccess3" Decode.bool False
    |> optional "deathsavefail1" Decode.bool False
    |> optional "deathsavefail2" Decode.bool False
    |> optional "deathsavefail3" Decode.bool False
    |> optional "inspiration" Decode.bool False
    |> optional "spellclass" Decode.string ""
    |> optional "spellability" Decode.string ""
    |> optional "spellsavedc" Decode.string ""
    |> optional "spellattackb" Decode.string ""
    |> optional "preparespells" Decode.string ""
    |> optional "potionsgems" Decode.string ""
    |> optional "phitems1" Decode.string ""
    |> optional "phitems2" Decode.string ""

type alias Attack =
  { name_ : String
  , bonus_ : String
  , damage_ : String
  }

attackname : Lens Attack String
attackname = Lens .name_ (\b a -> { a | name_ = b } )

attackbonus : Lens Attack String
attackbonus = Lens .bonus_ (\b a -> { a | bonus_ = b } )

attackdamage : Lens Attack String
attackdamage = Lens .damage_ (\b a -> { a | damage_ = b } )

attackEncoder : Attack -> Encode.Value
attackEncoder a = 
  Encode.object
    [ ("name", Encode.string a.name_)
    , ("bonus", Encode.string a.bonus_)
    , ("damage", Encode.string a.damage_)
    ]

attackDecoder : Decode.Decoder Attack
attackDecoder =
  Decode.succeed Attack
    |> required "name" Decode.string
    |> required "bonus" Decode.string
    |> required "damage" Decode.string

initAttack : Attack
initAttack = { name_ = "", bonus_ = "", damage_ = "" }

decode : String -> Character
decode s = 
  case (Decode.decodeString characterDecoder s) of
    Ok c -> c
    Err _ -> initCharacter

initCharacter : Character
initCharacter = 
  { charname_ = ""
  , player_ = ""
  , age_ = ""
  , height_ = ""
  , weight_ = ""
  , eyes_ = ""
  , skin_ = ""
  , hair_ = ""
  , faction_ = ""
  , fullbackground_ = ""
  , bedroll_ = ""
  , rope_ = ""
  , ammo_ = ""
  , torches_ = ""
  , copper_ = ""
  , silver_ = ""
  , electrum_ = ""
  , gold_ = ""
  , platinum_ = ""
  , pocket1_ = ""
  , pocket2_ = ""
  , pocket3_ = ""
  , pocket4_ = ""
  , flappouch_ = ""
  , middlepouch_ = ""
  , mainpouch_ = ""
  , features_ = ""
  , traits_ = ""
  , charclass_ = ""
  , level_ = 0
  , background_ = ""
  , race_ = ""
  , alignment_ = ""
  , experiencepoints_ = ""
  , strength_ = 0
  , dexterity_ = 0
  , constitution_ = 0
  , wisdom_ = 0
  , intelligence_ = 0
  , charisma_ = 0
  , strengthProficiency_ = False
  , dexterityProficiency_ = False
  , constitutionProficiency_ = False
  , wisdomProficiency_ = False
  , intelligenceProficiency_ = False
  , charismaProficiency_ = False
  , acrobatics_ = False
  , animalhandling_ = False
  , arcana_ = False
  , athletics_ = False
  , deception_ = False
  , history_ = False
  , insight_ = False
  , intimidation_ = False
  , investigation_ = False
  , medicine_ = False
  , nature_ = False
  , perception_ = False
  , performance_ = False
  , persuasion_ = False
  , religion_ = False
  , sleightofhand_ = False
  , stealth_ = False
  , survival_ = False
  , otherprofs_ = ""
  , ac_ = 0
  , initiative_ = 0
  , speed_ = 0
  , maxhp_ = 0
  , currhp_ = 0
  , temphp_ = 0
  , totalhd_ = 0
  , remaininghd_ = 0
  , attacks_ = [ initAttack, initAttack, initAttack, initAttack, initAttack, initAttack ]
  , cp_ = 0
  , sp_ = 0
  , ep_ = 0
  , gp_ = 0
  , pp_ = 0
  , equipment_ = ""
  , personality_ = ""
  , ideals_ = ""
  , bonds_ = ""
  , flaws_ = ""
  , fullfeatures_ = ""
  , imageurl_ = "https://static1.cbrimages.com/wordpress/wp-content/uploads/2022/02/Dennis-Dracula-Loughran-And-Bela-In-Hotel-Transylvania-2.jpg"   -- TODO : Make this modifiable
  , imagesize_ = "1000px"
  , passiveperception_ = 0
  , passiveinsight_ = 0
  , passiveinvestigation_ = 0
  , deathsavesuccess1_ = False
  , deathsavesuccess2_ = False
  , deathsavesuccess3_ = False
  , deathsavefail1_ = False
  , deathsavefail2_ = False
  , deathsavefail3_ = False
  , inspiration_ = False
  , spellclass_ = ""
  , spellability_ = ""
  , spellsavedc_ = ""
  , spellattackb_ = ""
  , preparespells_ = ""
  , potionsgems_ = ""
  , phitems1_ = ""
  , phitems2_ = ""
  }

-- Character Lenses

charname : Lens Character String
charname = Lens .charname_ (\b a -> { a | charname_ = b } )

player : Lens Character String
player = Lens .player_ (\b a -> { a | player_ = b } )

age : Lens Character String
age = Lens .age_ (\b a -> { a | age_ = b } )

height : Lens Character String
height = Lens .height_ (\b a -> { a | height_ = b } )

weight : Lens Character String
weight = Lens .weight_ (\b a -> { a | weight_ = b } )

eyes : Lens Character String
eyes = Lens .eyes_ (\b a -> { a | eyes_ = b } )

skin : Lens Character String
skin = Lens .skin_ (\b a -> { a | skin_ = b } )

hair : Lens Character String
hair = Lens .hair_ (\b a -> { a | hair_ = b } )

faction : Lens Character String
faction = Lens .faction_ (\b a -> { a | faction_ = b } )

fullbackground : Lens Character String
fullbackground = Lens .fullbackground_ (\b a -> { a | fullbackground_ = b } )

features : Lens Character String
features = Lens .features_ (\b a -> { a | features_ = b } )

traits : Lens Character String
traits = Lens .traits_ (\b a -> { a | traits_ = b } )

bedroll : Lens Character String
bedroll = Lens .bedroll_ (\b a -> { a | bedroll_ = b } )

rope : Lens Character String
rope = Lens .rope_ (\b a -> { a | rope_ = b } )

ammo : Lens Character String
ammo = Lens .ammo_ (\b a -> { a | ammo_ = b } )

torches : Lens Character String
torches = Lens .torches_ (\b a -> { a | torches_ = b } )

copper : Lens Character String
copper = Lens .copper_ (\b a -> { a | copper_ = b } )

silver : Lens Character String
silver = Lens .silver_ (\b a -> { a | silver_ = b } )

electrum : Lens Character String
electrum = Lens .electrum_ (\b a -> { a | electrum_ = b } )

gold : Lens Character String
gold = Lens .gold_ (\b a -> { a | gold_ = b } )

platinum : Lens Character String
platinum = Lens .platinum_ (\b a -> { a | platinum_ = b } )

pocket1 : Lens Character String
pocket1 = Lens .pocket1_ (\b a -> { a | pocket1_ = b } )

pocket2 : Lens Character String
pocket2 = Lens .pocket2_ (\b a -> { a | pocket2_ = b } )

pocket3 : Lens Character String
pocket3 = Lens .pocket3_ (\b a -> { a | pocket3_ = b } )

pocket4 : Lens Character String
pocket4 = Lens .pocket4_ (\b a -> { a | pocket4_ = b } )

flappouch : Lens Character String
flappouch = Lens .flappouch_ (\b a -> { a | flappouch_ = b } )

middlepouch : Lens Character String
middlepouch = Lens .middlepouch_ (\b a -> { a | middlepouch_ = b } )

mainpouch : Lens Character String
mainpouch = Lens .mainpouch_ (\b a -> { a | mainpouch_ = b } )

charclass : Lens Character String
charclass = Lens .charclass_ (\b a -> { a | charclass_ = b } )

level : Lens Character Int
level = Lens .level_ (\b a -> { a | level_ = b } )

background : Lens Character String
background = Lens .background_ (\b a -> { a | background_ = b } )

race : Lens Character String
race = Lens .race_ (\b a -> { a | race_ = b } )

alignment : Lens Character String
alignment = Lens .alignment_ (\b a -> { a | alignment_ = b } )

experiencepoints : Lens Character String
experiencepoints = Lens .experiencepoints_ (\b a -> { a | experiencepoints_ = b } )

strength : Lens Character Int
strength = Lens .strength_ (\b a -> { a | strength_ = b })

dexterity : Lens Character Int
dexterity = Lens .dexterity_ (\b a -> { a | dexterity_ = b })

constitution : Lens Character Int
constitution = Lens .constitution_ (\b a -> { a | constitution_ = b })

wisdom : Lens Character Int
wisdom = Lens .wisdom_ (\b a -> { a | wisdom_ = b })

intelligence : Lens Character Int
intelligence = Lens .intelligence_ (\b a -> { a | intelligence_ = b })

charisma : Lens Character Int
charisma = Lens .charisma_ (\b a -> { a | charisma_ = b })

strengthProficiency : Lens Character Bool
strengthProficiency = Lens .strengthProficiency_ (\b a -> { a | strengthProficiency_ = b })

dexterityProficiency : Lens Character Bool
dexterityProficiency = Lens .dexterityProficiency_ (\b a -> { a | dexterityProficiency_ = b })

constitutionProficiency : Lens Character Bool
constitutionProficiency = Lens .constitutionProficiency_ (\b a -> { a | constitutionProficiency_ = b })

wisdomProficiency : Lens Character Bool
wisdomProficiency = Lens .wisdomProficiency_ (\b a -> { a | wisdomProficiency_ = b })

intelligenceProficiency : Lens Character Bool
intelligenceProficiency = Lens .intelligenceProficiency_ (\b a -> { a | intelligenceProficiency_ = b })

charismaProficiency : Lens Character Bool
charismaProficiency = Lens .charismaProficiency_ (\b a -> { a | charismaProficiency_ = b })

acrobatics : Lens Character Bool
acrobatics = Lens .acrobatics_ (\b a -> { a | acrobatics_ = b } )

animalhandling : Lens Character Bool
animalhandling = Lens .animalhandling_ (\b a -> { a | animalhandling_ = b } )

arcana : Lens Character Bool
arcana = Lens .arcana_ (\b a -> { a | arcana_ = b } )

athletics : Lens Character Bool
athletics = Lens .athletics_ (\b a -> { a | athletics_ = b } )

deception : Lens Character Bool
deception = Lens .deception_ (\b a -> { a | deception_ = b } )

history : Lens Character Bool
history = Lens .history_ (\b a -> { a | history_ = b } )

insight : Lens Character Bool
insight = Lens .insight_ (\b a -> { a | insight_ = b } )

intimidation : Lens Character Bool
intimidation = Lens .intimidation_ (\b a -> { a | intimidation_ = b } )

investigation : Lens Character Bool
investigation = Lens .investigation_ (\b a -> { a | investigation_ = b } )

medicine : Lens Character Bool
medicine = Lens .medicine_ (\b a -> { a | medicine_ = b } )

nature : Lens Character Bool
nature = Lens .nature_ (\b a -> { a | nature_ = b } )

perception : Lens Character Bool
perception = Lens .perception_ (\b a -> { a | perception_ = b } )

performance : Lens Character Bool
performance = Lens .performance_ (\b a -> { a | performance_ = b } )

persuasion : Lens Character Bool
persuasion = Lens .persuasion_ (\b a -> { a | persuasion_ = b } )

religion : Lens Character Bool
religion = Lens .religion_ (\b a -> { a | religion_ = b } )

sleightofhand : Lens Character Bool
sleightofhand = Lens .sleightofhand_ (\b a -> { a | sleightofhand_ = b } )

stealth : Lens Character Bool
stealth = Lens .stealth_ (\b a -> { a | stealth_ = b } )

survival : Lens Character Bool
survival = Lens .survival_ (\b a -> { a | survival_ = b } )

passiveperception : Lens Character Int
passiveperception = Lens .passiveperception_ (\b a -> { a | passiveperception_ = b} )

passiveinsight : Lens Character Int
passiveinsight = Lens .passiveinsight_ (\b a -> { a | passiveinsight_ = b} )

passiveinvestigation : Lens Character Int
passiveinvestigation = Lens .passiveinvestigation_ (\b a -> { a | passiveinvestigation_ = b} )

otherprofs : Lens Character String
otherprofs = Lens .otherprofs_ (\b a -> { a | otherprofs_ = b} )

ac : Lens Character Int
ac = Lens .ac_ (\b a -> { a | ac_ = b } )

initiative : Lens Character Int
initiative = Lens .initiative_ (\b a -> { a | initiative_ = b } )

speed : Lens Character Int
speed = Lens .speed_ (\b a -> { a | speed_ = b } )

maxhp : Lens Character Int
maxhp = Lens .maxhp_ (\b a -> { a | maxhp_ = b } )

currhp : Lens Character Int
currhp = Lens .currhp_ (\b a -> { a | currhp_ = b } )

temphp : Lens Character Int
temphp = Lens .temphp_ (\b a -> { a | temphp_ = b } )

totalhd : Lens Character Int
totalhd = Lens .totalhd_ (\b a -> { a | totalhd_ = b } )

remaininghd : Lens Character Int
remaininghd = Lens .remaininghd_ (\b a -> { a | remaininghd_ = b } )

cp : Lens Character Int
cp = Lens .cp_ (\b a -> { a | cp_ = b } )

sp : Lens Character Int
sp = Lens .sp_ (\b a -> { a | sp_ = b } )

ep : Lens Character Int
ep = Lens .ep_ (\b a -> { a | ep_ = b } )

gp : Lens Character Int
gp = Lens .gp_ (\b a -> { a | gp_ = b } )

pp : Lens Character Int
pp = Lens .pp_ (\b a -> { a | pp_ = b } )

equipment : Lens Character String
equipment = Lens .equipment_ (\b a -> { a | equipment_ = b } )

personality : Lens Character String
personality = Lens .personality_ (\b a -> { a | personality_ = b } )

ideals : Lens Character String
ideals = Lens .ideals_ (\b a -> { a | ideals_ = b } )

bonds : Lens Character String
bonds = Lens .bonds_ (\b a -> { a | bonds_ = b } )

flaws : Lens Character String
flaws = Lens .flaws_ (\b a -> { a | flaws_ = b } )

fullfeatures : Lens Character String
fullfeatures = Lens .fullfeatures_ (\b a -> { a | fullfeatures_ = b } )

imageurl : Lens Character String
imageurl = Lens .imageurl_ (\b a -> { a | imageurl_ = b } )

imagesize : Lens Character String
imagesize = Lens .imagesize_ (\b a -> { a | imagesize_ = b } )

attacks : Lens Character (List Attack)
attacks = Lens .attacks_ (\b a -> { a | attacks_ = b } )

deathsavesuccess1 : Lens Character Bool
deathsavesuccess1 = Lens .deathsavesuccess1_ (\b a -> { a | deathsavesuccess1_ = b } )

deathsavesuccess2 : Lens Character Bool
deathsavesuccess2 = Lens .deathsavesuccess2_ (\b a -> { a | deathsavesuccess2_ = b } )

deathsavesuccess3 : Lens Character Bool
deathsavesuccess3 = Lens .deathsavesuccess3_ (\b a -> { a | deathsavesuccess3_ = b } )

deathsavefail1 : Lens Character Bool
deathsavefail1 = Lens .deathsavefail1_ (\b a -> { a | deathsavefail1_ = b } )

deathsavefail2 : Lens Character Bool
deathsavefail2 = Lens .deathsavefail2_ (\b a -> { a | deathsavefail2_ = b } )

deathsavefail3 : Lens Character Bool
deathsavefail3 = Lens .deathsavefail3_ (\b a -> { a | deathsavefail3_ = b } )

inspiration : Lens Character Bool
inspiration = Lens .inspiration_ (\b a -> { a | inspiration_ = b } )

spellclass : Lens Character String
spellclass = Lens .spellclass_ (\b a -> { a | spellclass_ = b } )

spellability : Lens Character String
spellability = Lens .spellability_ (\b a -> { a | spellability_ = b } )

spellsavedc : Lens Character String
spellsavedc = Lens .spellsavedc_ (\b a -> { a | spellsavedc_ = b } )

spellattackb : Lens Character String
spellattackb = Lens .spellattackb_ (\b a -> { a | spellattackb_ = b } )

preparespells : Lens Character String
preparespells = Lens .preparespells_ (\b a -> { a | preparespells_ = b } )

potionsgems : Lens Character String
potionsgems = Lens .potionsgems_ (\ b a -> { a | potionsgems_ = b } )

phitems1 : Lens Character String
phitems1 = Lens .phitems1_ (\ b a -> { a | phitems1_ = b } )

phitems2 : Lens Character String
phitems2 = Lens .phitems2_ (\ b a -> { a | phitems2_ = b } )
