module Model.Character exposing (..)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (..)
import Json.Encode as Encode
import Result exposing (Result(..))
import Monocle.Lens exposing (Lens)
import Model.Attack exposing (..)

-- Type definition for Character

type alias Character = 
  { ac_ : Int
  , acrobatics_ : Bool
  , age_ : String
  , alignment_ : String
  , ammo_ : String
  , animalhandling_ : Bool
  , arcana_ : Bool
  , athletics_ : Bool
  , attacks_ : List Attack
  , background_ : String
  , bedroll_ : String
  , bonds_ : String
  , charclass_ : String
  , charisma_ : Int
  , charismaProficiency_ : Bool
  , charname_ : String
  , constitution_ : Int
  , constitutionProficiency_ : Bool
  , copper_ : String
  , cp_ : Int
  , currhp_ : Int
  , deathsavefail1_ : Bool
  , deathsavefail2_ : Bool
  , deathsavefail3_ : Bool
  , deathsavesuccess1_ : Bool
  , deathsavesuccess2_ : Bool
  , deathsavesuccess3_ : Bool
  , deception_ : Bool
  , dexterity_ : Int
  , dexterityProficiency_ : Bool
  , electrum_ : String
  , ep_ : Int
  , equipment_ : String
  , experiencepoints_ : String
  , eyes_ : String
  , faction_ : String
  , features_ : String
  , flappouch_ : String
  , flaws_ : String
  , fullbackground_ : String
  , fullfeatures_ : String
  , gold_ : String
  , gp_ : Int
  , hair_ : String
  , height_ : String
  , history_ : Bool
  , ideals_ : String
  , imagesize_ : String
  , imageurl_ : String
  , initiative_ : Int
  , insight_ : Bool
  , inspiration_ : Bool
  , intelligence_ : Int
  , intelligenceProficiency_ : Bool
  , intimidation_ : Bool
  , investigation_ : Bool
  , level_ : Int
  , mainpouch_ : String
  , maxhp_ : Int
  , medicine_ : Bool
  , middlepouch_ : String
  , nature_ : Bool
  , otherprofs_ : String
  , passiveinsight_ : Int
  , passiveinvestigation_ : Int
  , passiveperception_ : Int
  , perception_ : Bool
  , performance_ : Bool
  , personality_ : String
  , persuasion_ : Bool
  , phitems1_ : String
  , phitems2_ : String
  , platinum_ : String
  , player_ : String
  , pocket1_ : String
  , pocket2_ : String
  , pocket3_ : String
  , pocket4_ : String
  , potionsgems_ : String
  , pp_ : Int
  , preparespells_ : String
  , race_ : String
  , religion_ : Bool
  , remaininghd_ : Int
  , rope_ : String
  , silver_ : String
  , skin_ : String
  , sleightofhand_ : Bool
  , sp_ : Int
  , speed_ : Int
  , spellability_ : String
  , spellattackb_ : String
  , spellclass_ : String
  , spellsavedc_ : String
  , stealth_ : Bool
  , strength_ : Int
  , strengthProficiency_ : Bool
  , survival_ : Bool
  , temphp_ : Int
  , torches_ : String
  , totalhd_ : Int
  , traits_ : String
  , weight_ : String
  , wisdom_ : Int
  , wisdomProficiency_ : Bool
  }

-- Lenses for Character

ac : Lens Character Int
ac = Lens .ac_ (\b a -> { a | ac_ = b } )

acrobatics : Lens Character Bool
acrobatics = Lens .acrobatics_ (\b a -> { a | acrobatics_ = b } )

age : Lens Character String
age = Lens .age_ (\b a -> { a | age_ = b } )

alignment : Lens Character String
alignment = Lens .alignment_ (\b a -> { a | alignment_ = b } )

ammo : Lens Character String
ammo = Lens .ammo_ (\b a -> { a | ammo_ = b } )

animalhandling : Lens Character Bool
animalhandling = Lens .animalhandling_ (\b a -> { a | animalhandling_ = b } )

arcana : Lens Character Bool
arcana = Lens .arcana_ (\b a -> { a | arcana_ = b } )

athletics : Lens Character Bool
athletics = Lens .athletics_ (\b a -> { a | athletics_ = b } )

attacks : Lens Character (List Attack)
attacks = Lens .attacks_ (\b a -> { a | attacks_ = b } )

background : Lens Character String
background = Lens .background_ (\b a -> { a | background_ = b } )

bedroll : Lens Character String
bedroll = Lens .bedroll_ (\b a -> { a | bedroll_ = b } )

bonds : Lens Character String
bonds = Lens .bonds_ (\b a -> { a | bonds_ = b } )

charclass : Lens Character String
charclass = Lens .charclass_ (\b a -> { a | charclass_ = b } )

charisma : Lens Character Int
charisma = Lens .charisma_ (\b a -> { a | charisma_ = b } )

charismaProficiency : Lens Character Bool
charismaProficiency = Lens .charismaProficiency_ (\b a -> { a | charismaProficiency_ = b } )

charname : Lens Character String
charname = Lens .charname_ (\b a -> { a | charname_ = b } )

constitution : Lens Character Int
constitution = Lens .constitution_ (\b a -> { a | constitution_ = b } )

constitutionProficiency : Lens Character Bool
constitutionProficiency = Lens .constitutionProficiency_ (\b a -> { a | constitutionProficiency_ = b } )

copper : Lens Character String
copper = Lens .copper_ (\b a -> { a | copper_ = b } )

cp : Lens Character Int
cp = Lens .cp_ (\b a -> { a | cp_ = b } )

currhp : Lens Character Int
currhp = Lens .currhp_ (\b a -> { a | currhp_ = b } )

deathsavefail1 : Lens Character Bool
deathsavefail1 = Lens .deathsavefail1_ (\b a -> { a | deathsavefail1_ = b } )

deathsavefail2 : Lens Character Bool
deathsavefail2 = Lens .deathsavefail2_ (\b a -> { a | deathsavefail2_ = b } )

deathsavefail3 : Lens Character Bool
deathsavefail3 = Lens .deathsavefail3_ (\b a -> { a | deathsavefail3_ = b } )

deathsavesuccess1 : Lens Character Bool
deathsavesuccess1 = Lens .deathsavesuccess1_ (\b a -> { a | deathsavesuccess1_ = b } )

deathsavesuccess2 : Lens Character Bool
deathsavesuccess2 = Lens .deathsavesuccess2_ (\b a -> { a | deathsavesuccess2_ = b } )

deathsavesuccess3 : Lens Character Bool
deathsavesuccess3 = Lens .deathsavesuccess3_ (\b a -> { a | deathsavesuccess3_ = b } )

deception : Lens Character Bool
deception = Lens .deception_ (\b a -> { a | deception_ = b } )

dexterity : Lens Character Int
dexterity = Lens .dexterity_ (\b a -> { a | dexterity_ = b } )

dexterityProficiency : Lens Character Bool
dexterityProficiency = Lens .dexterityProficiency_ (\b a -> { a | dexterityProficiency_ = b } )

electrum : Lens Character String
electrum = Lens .electrum_ (\b a -> { a | electrum_ = b } )

ep : Lens Character Int
ep = Lens .ep_ (\b a -> { a | ep_ = b } )

equipment : Lens Character String
equipment = Lens .equipment_ (\b a -> { a | equipment_ = b } )

experiencepoints : Lens Character String
experiencepoints = Lens .experiencepoints_ (\b a -> { a | experiencepoints_ = b } )

eyes : Lens Character String
eyes = Lens .eyes_ (\b a -> { a | eyes_ = b } )

faction : Lens Character String
faction = Lens .faction_ (\b a -> { a | faction_ = b } )

features : Lens Character String
features = Lens .features_ (\b a -> { a | features_ = b } )

flappouch : Lens Character String
flappouch = Lens .flappouch_ (\b a -> { a | flappouch_ = b } )

flaws : Lens Character String
flaws = Lens .flaws_ (\b a -> { a | flaws_ = b } )

fullbackground : Lens Character String
fullbackground = Lens .fullbackground_ (\b a -> { a | fullbackground_ = b } )

fullfeatures : Lens Character String
fullfeatures = Lens .fullfeatures_ (\b a -> { a | fullfeatures_ = b } )

gold : Lens Character String
gold = Lens .gold_ (\b a -> { a | gold_ = b } )

gp : Lens Character Int
gp = Lens .gp_ (\b a -> { a | gp_ = b } )

hair : Lens Character String
hair = Lens .hair_ (\b a -> { a | hair_ = b } )

height : Lens Character String
height = Lens .height_ (\b a -> { a | height_ = b } )

history : Lens Character Bool
history = Lens .history_ (\b a -> { a | history_ = b } )

ideals : Lens Character String
ideals = Lens .ideals_ (\b a -> { a | ideals_ = b } )

imagesize : Lens Character String
imagesize = Lens .imagesize_ (\b a -> { a | imagesize_ = b } )

imageurl : Lens Character String
imageurl = Lens .imageurl_ (\b a -> { a | imageurl_ = b } )

initiative : Lens Character Int
initiative = Lens .initiative_ (\b a -> { a | initiative_ = b } )

insight : Lens Character Bool
insight = Lens .insight_ (\b a -> { a | insight_ = b } )

inspiration : Lens Character Bool
inspiration = Lens .inspiration_ (\b a -> { a | inspiration_ = b } )

intelligence : Lens Character Int
intelligence = Lens .intelligence_ (\b a -> { a | intelligence_ = b } )

intelligenceProficiency : Lens Character Bool
intelligenceProficiency = Lens .intelligenceProficiency_ (\b a -> { a | intelligenceProficiency_ = b } )

intimidation : Lens Character Bool
intimidation = Lens .intimidation_ (\b a -> { a | intimidation_ = b } )

investigation : Lens Character Bool
investigation = Lens .investigation_ (\b a -> { a | investigation_ = b } )

level : Lens Character Int
level = Lens .level_ (\b a -> { a | level_ = b } )

mainpouch : Lens Character String
mainpouch = Lens .mainpouch_ (\b a -> { a | mainpouch_ = b } )

maxhp : Lens Character Int
maxhp = Lens .maxhp_ (\b a -> { a | maxhp_ = b } )

medicine : Lens Character Bool
medicine = Lens .medicine_ (\b a -> { a | medicine_ = b } )

middlepouch : Lens Character String
middlepouch = Lens .middlepouch_ (\b a -> { a | middlepouch_ = b } )

nature : Lens Character Bool
nature = Lens .nature_ (\b a -> { a | nature_ = b } )

otherprofs : Lens Character String
otherprofs = Lens .otherprofs_ (\b a -> { a | otherprofs_ = b } )

passiveinsight : Lens Character Int
passiveinsight = Lens .passiveinsight_ (\b a -> { a | passiveinsight_ = b } )

passiveinvestigation : Lens Character Int
passiveinvestigation = Lens .passiveinvestigation_ (\b a -> { a | passiveinvestigation_ = b } )

passiveperception : Lens Character Int
passiveperception = Lens .passiveperception_ (\b a -> { a | passiveperception_ = b } )

perception : Lens Character Bool
perception = Lens .perception_ (\b a -> { a | perception_ = b } )

performance : Lens Character Bool
performance = Lens .performance_ (\b a -> { a | performance_ = b } )

personality : Lens Character String
personality = Lens .personality_ (\b a -> { a | personality_ = b } )

persuasion : Lens Character Bool
persuasion = Lens .persuasion_ (\b a -> { a | persuasion_ = b } )

phitems1 : Lens Character String
phitems1 = Lens .phitems1_ (\b a -> { a | phitems1_ = b } )

phitems2 : Lens Character String
phitems2 = Lens .phitems2_ (\b a -> { a | phitems2_ = b } )

platinum : Lens Character String
platinum = Lens .platinum_ (\b a -> { a | platinum_ = b } )

player : Lens Character String
player = Lens .player_ (\b a -> { a | player_ = b } )

pocket1 : Lens Character String
pocket1 = Lens .pocket1_ (\b a -> { a | pocket1_ = b } )

pocket2 : Lens Character String
pocket2 = Lens .pocket2_ (\b a -> { a | pocket2_ = b } )

pocket3 : Lens Character String
pocket3 = Lens .pocket3_ (\b a -> { a | pocket3_ = b } )

pocket4 : Lens Character String
pocket4 = Lens .pocket4_ (\b a -> { a | pocket4_ = b } )

potionsgems : Lens Character String
potionsgems = Lens .potionsgems_ (\b a -> { a | potionsgems_ = b } )

pp : Lens Character Int
pp = Lens .pp_ (\b a -> { a | pp_ = b } )

preparespells : Lens Character String
preparespells = Lens .preparespells_ (\b a -> { a | preparespells_ = b } )

race : Lens Character String
race = Lens .race_ (\b a -> { a | race_ = b } )

religion : Lens Character Bool
religion = Lens .religion_ (\b a -> { a | religion_ = b } )

remaininghd : Lens Character Int
remaininghd = Lens .remaininghd_ (\b a -> { a | remaininghd_ = b } )

rope : Lens Character String
rope = Lens .rope_ (\b a -> { a | rope_ = b } )

silver : Lens Character String
silver = Lens .silver_ (\b a -> { a | silver_ = b } )

skin : Lens Character String
skin = Lens .skin_ (\b a -> { a | skin_ = b } )

sleightofhand : Lens Character Bool
sleightofhand = Lens .sleightofhand_ (\b a -> { a | sleightofhand_ = b } )

sp : Lens Character Int
sp = Lens .sp_ (\b a -> { a | sp_ = b } )

speed : Lens Character Int
speed = Lens .speed_ (\b a -> { a | speed_ = b } )

spellability : Lens Character String
spellability = Lens .spellability_ (\b a -> { a | spellability_ = b } )

spellattackb : Lens Character String
spellattackb = Lens .spellattackb_ (\b a -> { a | spellattackb_ = b } )

spellclass : Lens Character String
spellclass = Lens .spellclass_ (\b a -> { a | spellclass_ = b } )

spellsavedc : Lens Character String
spellsavedc = Lens .spellsavedc_ (\b a -> { a | spellsavedc_ = b } )

stealth : Lens Character Bool
stealth = Lens .stealth_ (\b a -> { a | stealth_ = b } )

strength : Lens Character Int
strength = Lens .strength_ (\b a -> { a | strength_ = b } )

strengthProficiency : Lens Character Bool
strengthProficiency = Lens .strengthProficiency_ (\b a -> { a | strengthProficiency_ = b } )

survival : Lens Character Bool
survival = Lens .survival_ (\b a -> { a | survival_ = b } )

temphp : Lens Character Int
temphp = Lens .temphp_ (\b a -> { a | temphp_ = b } )

torches : Lens Character String
torches = Lens .torches_ (\b a -> { a | torches_ = b } )

totalhd : Lens Character Int
totalhd = Lens .totalhd_ (\b a -> { a | totalhd_ = b } )

traits : Lens Character String
traits = Lens .traits_ (\b a -> { a | traits_ = b } )

weight : Lens Character String
weight = Lens .weight_ (\b a -> { a | weight_ = b } )

wisdom : Lens Character Int
wisdom = Lens .wisdom_ (\b a -> { a | wisdom_ = b } )

wisdomProficiency : Lens Character Bool
wisdomProficiency = Lens .wisdomProficiency_ (\b a -> { a | wisdomProficiency_ = b } )

-- JSON Encoder for Character

characterEncoder : Character -> Encode.Value
characterEncoder x = Encode.object
  [ ("ac", Encode.int x.ac_)
  , ("acrobatics", Encode.bool x.acrobatics_)
  , ("age", Encode.string x.age_)
  , ("alignment", Encode.string x.alignment_)
  , ("ammo", Encode.string x.ammo_)
  , ("animalhandling", Encode.bool x.animalhandling_)
  , ("arcana", Encode.bool x.arcana_)
  , ("athletics", Encode.bool x.athletics_)
  , ("attacks", Encode.list attackEncoder x.attacks_)
  , ("background", Encode.string x.background_)
  , ("bedroll", Encode.string x.bedroll_)
  , ("bonds", Encode.string x.bonds_)
  , ("charclass", Encode.string x.charclass_)
  , ("charisma", Encode.int x.charisma_)
  , ("charismaProficiency", Encode.bool x.charismaProficiency_)
  , ("charname", Encode.string x.charname_)
  , ("constitution", Encode.int x.constitution_)
  , ("constitutionProficiency", Encode.bool x.constitutionProficiency_)
  , ("copper", Encode.string x.copper_)
  , ("cp", Encode.int x.cp_)
  , ("currhp", Encode.int x.currhp_)
  , ("deathsavefail1", Encode.bool x.deathsavefail1_)
  , ("deathsavefail2", Encode.bool x.deathsavefail2_)
  , ("deathsavefail3", Encode.bool x.deathsavefail3_)
  , ("deathsavesuccess1", Encode.bool x.deathsavesuccess1_)
  , ("deathsavesuccess2", Encode.bool x.deathsavesuccess2_)
  , ("deathsavesuccess3", Encode.bool x.deathsavesuccess3_)
  , ("deception", Encode.bool x.deception_)
  , ("dexterity", Encode.int x.dexterity_)
  , ("dexterityProficiency", Encode.bool x.dexterityProficiency_)
  , ("electrum", Encode.string x.electrum_)
  , ("ep", Encode.int x.ep_)
  , ("equipment", Encode.string x.equipment_)
  , ("experiencepoints", Encode.string x.experiencepoints_)
  , ("eyes", Encode.string x.eyes_)
  , ("faction", Encode.string x.faction_)
  , ("features", Encode.string x.features_)
  , ("flappouch", Encode.string x.flappouch_)
  , ("flaws", Encode.string x.flaws_)
  , ("fullbackground", Encode.string x.fullbackground_)
  , ("fullfeatures", Encode.string x.fullfeatures_)
  , ("gold", Encode.string x.gold_)
  , ("gp", Encode.int x.gp_)
  , ("hair", Encode.string x.hair_)
  , ("height", Encode.string x.height_)
  , ("history", Encode.bool x.history_)
  , ("ideals", Encode.string x.ideals_)
  , ("imagesize", Encode.string x.imagesize_)
  , ("imageurl", Encode.string x.imageurl_)
  , ("initiative", Encode.int x.initiative_)
  , ("insight", Encode.bool x.insight_)
  , ("inspiration", Encode.bool x.inspiration_)
  , ("intelligence", Encode.int x.intelligence_)
  , ("intelligenceProficiency", Encode.bool x.intelligenceProficiency_)
  , ("intimidation", Encode.bool x.intimidation_)
  , ("investigation", Encode.bool x.investigation_)
  , ("level", Encode.int x.level_)
  , ("mainpouch", Encode.string x.mainpouch_)
  , ("maxhp", Encode.int x.maxhp_)
  , ("medicine", Encode.bool x.medicine_)
  , ("middlepouch", Encode.string x.middlepouch_)
  , ("nature", Encode.bool x.nature_)
  , ("otherprofs", Encode.string x.otherprofs_)
  , ("passiveinsight", Encode.int x.passiveinsight_)
  , ("passiveinvestigation", Encode.int x.passiveinvestigation_)
  , ("passiveperception", Encode.int x.passiveperception_)
  , ("perception", Encode.bool x.perception_)
  , ("performance", Encode.bool x.performance_)
  , ("personality", Encode.string x.personality_)
  , ("persuasion", Encode.bool x.persuasion_)
  , ("phitems1", Encode.string x.phitems1_)
  , ("phitems2", Encode.string x.phitems2_)
  , ("platinum", Encode.string x.platinum_)
  , ("player", Encode.string x.player_)
  , ("pocket1", Encode.string x.pocket1_)
  , ("pocket2", Encode.string x.pocket2_)
  , ("pocket3", Encode.string x.pocket3_)
  , ("pocket4", Encode.string x.pocket4_)
  , ("potionsgems", Encode.string x.potionsgems_)
  , ("pp", Encode.int x.pp_)
  , ("preparespells", Encode.string x.preparespells_)
  , ("race", Encode.string x.race_)
  , ("religion", Encode.bool x.religion_)
  , ("remaininghd", Encode.int x.remaininghd_)
  , ("rope", Encode.string x.rope_)
  , ("silver", Encode.string x.silver_)
  , ("skin", Encode.string x.skin_)
  , ("sleightofhand", Encode.bool x.sleightofhand_)
  , ("sp", Encode.int x.sp_)
  , ("speed", Encode.int x.speed_)
  , ("spellability", Encode.string x.spellability_)
  , ("spellattackb", Encode.string x.spellattackb_)
  , ("spellclass", Encode.string x.spellclass_)
  , ("spellsavedc", Encode.string x.spellsavedc_)
  , ("stealth", Encode.bool x.stealth_)
  , ("strength", Encode.int x.strength_)
  , ("strengthProficiency", Encode.bool x.strengthProficiency_)
  , ("survival", Encode.bool x.survival_)
  , ("temphp", Encode.int x.temphp_)
  , ("torches", Encode.string x.torches_)
  , ("totalhd", Encode.int x.totalhd_)
  , ("traits", Encode.string x.traits_)
  , ("weight", Encode.string x.weight_)
  , ("wisdom", Encode.int x.wisdom_)
  , ("wisdomProficiency", Encode.bool x.wisdomProficiency_)
  ]

characterStringEncoder : Character -> String
characterStringEncoder x = Encode.encode 0 (characterEncoder x)

-- JSON Decoder for Character

characterDecoder : Decode.Decoder Character
characterDecoder = Decode.succeed Character
  |> optional "ac" Decode.int 0
  |> optional "acrobatics" Decode.bool False
  |> optional "age" Decode.string ""
  |> optional "alignment" Decode.string ""
  |> optional "ammo" Decode.string ""
  |> optional "animalhandling" Decode.bool False
  |> optional "arcana" Decode.bool False
  |> optional "athletics" Decode.bool False
  |> optional "attacks" (Decode.list attackDecoder) []
  |> optional "background" Decode.string ""
  |> optional "bedroll" Decode.string ""
  |> optional "bonds" Decode.string ""
  |> optional "charclass" Decode.string ""
  |> optional "charisma" Decode.int 0
  |> optional "charismaProficiency" Decode.bool False
  |> required "charname" Decode.string
  |> optional "constitution" Decode.int 0
  |> optional "constitutionProficiency" Decode.bool False
  |> optional "copper" Decode.string ""
  |> optional "cp" Decode.int 0
  |> optional "currhp" Decode.int 0
  |> optional "deathsavefail1" Decode.bool False
  |> optional "deathsavefail2" Decode.bool False
  |> optional "deathsavefail3" Decode.bool False
  |> optional "deathsavesuccess1" Decode.bool False
  |> optional "deathsavesuccess2" Decode.bool False
  |> optional "deathsavesuccess3" Decode.bool False
  |> optional "deception" Decode.bool False
  |> optional "dexterity" Decode.int 0
  |> optional "dexterityProficiency" Decode.bool False
  |> optional "electrum" Decode.string ""
  |> optional "ep" Decode.int 0
  |> optional "equipment" Decode.string ""
  |> optional "experiencepoints" Decode.string ""
  |> optional "eyes" Decode.string ""
  |> optional "faction" Decode.string ""
  |> optional "features" Decode.string ""
  |> optional "flappouch" Decode.string ""
  |> optional "flaws" Decode.string ""
  |> optional "fullbackground" Decode.string ""
  |> optional "fullfeatures" Decode.string ""
  |> optional "gold" Decode.string ""
  |> optional "gp" Decode.int 0
  |> optional "hair" Decode.string ""
  |> optional "height" Decode.string ""
  |> optional "history" Decode.bool False
  |> optional "ideals" Decode.string ""
  |> optional "imagesize" Decode.string ""
  |> optional "imageurl" Decode.string ""
  |> optional "initiative" Decode.int 0
  |> optional "insight" Decode.bool False
  |> optional "inspiration" Decode.bool False
  |> optional "intelligence" Decode.int 0
  |> optional "intelligenceProficiency" Decode.bool False
  |> optional "intimidation" Decode.bool False
  |> optional "investigation" Decode.bool False
  |> optional "level" Decode.int 0
  |> optional "mainpouch" Decode.string ""
  |> optional "maxhp" Decode.int 0
  |> optional "medicine" Decode.bool False
  |> optional "middlepouch" Decode.string ""
  |> optional "nature" Decode.bool False
  |> optional "otherprofs" Decode.string ""
  |> optional "passiveinsight" Decode.int 0
  |> optional "passiveinvestigation" Decode.int 0
  |> optional "passiveperception" Decode.int 0
  |> optional "perception" Decode.bool False
  |> optional "performance" Decode.bool False
  |> optional "personality" Decode.string ""
  |> optional "persuasion" Decode.bool False
  |> optional "phitems1" Decode.string ""
  |> optional "phitems2" Decode.string ""
  |> optional "platinum" Decode.string ""
  |> optional "player" Decode.string ""
  |> optional "pocket1" Decode.string ""
  |> optional "pocket2" Decode.string ""
  |> optional "pocket3" Decode.string ""
  |> optional "pocket4" Decode.string ""
  |> optional "potionsgems" Decode.string ""
  |> optional "pp" Decode.int 0
  |> optional "preparespells" Decode.string ""
  |> optional "race" Decode.string ""
  |> optional "religion" Decode.bool False
  |> optional "remaininghd" Decode.int 0
  |> optional "rope" Decode.string ""
  |> optional "silver" Decode.string ""
  |> optional "skin" Decode.string ""
  |> optional "sleightofhand" Decode.bool False
  |> optional "sp" Decode.int 0
  |> optional "speed" Decode.int 0
  |> optional "spellability" Decode.string ""
  |> optional "spellattackb" Decode.string ""
  |> optional "spellclass" Decode.string ""
  |> optional "spellsavedc" Decode.string ""
  |> optional "stealth" Decode.bool False
  |> optional "strength" Decode.int 0
  |> optional "strengthProficiency" Decode.bool False
  |> optional "survival" Decode.bool False
  |> optional "temphp" Decode.int 0
  |> optional "torches" Decode.string ""
  |> optional "totalhd" Decode.int 0
  |> optional "traits" Decode.string ""
  |> optional "weight" Decode.string ""
  |> optional "wisdom" Decode.int 0
  |> optional "wisdomProficiency" Decode.bool False

-- Initial value for Character
initCharacter : Character
initCharacter =
  { ac_ = 0
  , acrobatics_ = False
  , age_ = ""
  , alignment_ = ""
  , ammo_ = ""
  , animalhandling_ = False
  , arcana_ = False
  , athletics_ = False
  , attacks_ = []
  , background_ = ""
  , bedroll_ = ""
  , bonds_ = ""
  , charclass_ = ""
  , charisma_ = 0
  , charismaProficiency_ = False
  , charname_ = ""
  , constitution_ = 0
  , constitutionProficiency_ = False
  , copper_ = ""
  , cp_ = 0
  , currhp_ = 0
  , deathsavefail1_ = False
  , deathsavefail2_ = False
  , deathsavefail3_ = False
  , deathsavesuccess1_ = False
  , deathsavesuccess2_ = False
  , deathsavesuccess3_ = False
  , deception_ = False
  , dexterity_ = 0
  , dexterityProficiency_ = False
  , electrum_ = ""
  , ep_ = 0
  , equipment_ = ""
  , experiencepoints_ = ""
  , eyes_ = ""
  , faction_ = ""
  , features_ = ""
  , flappouch_ = ""
  , flaws_ = ""
  , fullbackground_ = ""
  , fullfeatures_ = ""
  , gold_ = ""
  , gp_ = 0
  , hair_ = ""
  , height_ = ""
  , history_ = False
  , ideals_ = ""
  , imagesize_ = ""
  , imageurl_ = ""
  , initiative_ = 0
  , insight_ = False
  , inspiration_ = False
  , intelligence_ = 0
  , intelligenceProficiency_ = False
  , intimidation_ = False
  , investigation_ = False
  , level_ = 0
  , mainpouch_ = ""
  , maxhp_ = 0
  , medicine_ = False
  , middlepouch_ = ""
  , nature_ = False
  , otherprofs_ = ""
  , passiveinsight_ = 0
  , passiveinvestigation_ = 0
  , passiveperception_ = 0
  , perception_ = False
  , performance_ = False
  , personality_ = ""
  , persuasion_ = False
  , phitems1_ = ""
  , phitems2_ = ""
  , platinum_ = ""
  , player_ = ""
  , pocket1_ = ""
  , pocket2_ = ""
  , pocket3_ = ""
  , pocket4_ = ""
  , potionsgems_ = ""
  , pp_ = 0
  , preparespells_ = ""
  , race_ = ""
  , religion_ = False
  , remaininghd_ = 0
  , rope_ = ""
  , silver_ = ""
  , skin_ = ""
  , sleightofhand_ = False
  , sp_ = 0
  , speed_ = 0
  , spellability_ = ""
  , spellattackb_ = ""
  , spellclass_ = ""
  , spellsavedc_ = ""
  , stealth_ = False
  , strength_ = 0
  , strengthProficiency_ = False
  , survival_ = False
  , temphp_ = 0
  , torches_ = ""
  , totalhd_ = 0
  , traits_ = ""
  , weight_ = ""
  , wisdom_ = 0
  , wisdomProficiency_ = False
  }
