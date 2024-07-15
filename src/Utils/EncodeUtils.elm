module Utils.EncodeUtils exposing ( stringEncoder )

import Json.Encode as Encode

stringEncoder : (a -> Encode.Value) -> a -> String
stringEncoder e x = Encode.encode 0 (e x)