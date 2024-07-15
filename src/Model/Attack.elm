module Model.Attack exposing ( Attack, attackEncoder, attackDecoder, initAttack,
  attackbonus, attackdamage, attackname )

-- THIS MODULE IS AUTO-GENERATED. Do not edit it - change the generator.

import Json.Decode as Decode
import Json.Decode.Pipeline exposing ( optional, required )
import Json.Encode as Encode
import Monocle.Lens exposing (Lens)

-- Type definition for Attack

type alias Attack = 
  { attackbonus_ : String
  , attackdamage_ : String
  , attackname_ : String
  }

-- Lenses for Attack

attackbonus : Lens Attack String
attackbonus = Lens .attackbonus_ (\b a -> { a | attackbonus_ = b } )

attackdamage : Lens Attack String
attackdamage = Lens .attackdamage_ (\b a -> { a | attackdamage_ = b } )

attackname : Lens Attack String
attackname = Lens .attackname_ (\b a -> { a | attackname_ = b } )

-- JSON Encoder for Attack

attackEncoder : Attack -> Encode.Value
attackEncoder x = Encode.object
  [ ("attackbonus", Encode.string x.attackbonus_)
  , ("attackdamage", Encode.string x.attackdamage_)
  , ("attackname", Encode.string x.attackname_)
  ]

-- JSON Decoder for Attack

attackDecoder : Decode.Decoder Attack
attackDecoder = Decode.succeed Attack
  |> optional "attackbonus" Decode.string ""
  |> optional "attackdamage" Decode.string ""
  |> required "attackname" Decode.string

-- Initial value for Attack
initAttack : Attack
initAttack =
  { attackbonus_ = ""
  , attackdamage_ = ""
  , attackname_ = ""
  }
