port module Ports.Ports exposing ( save, doload, load, dolist, listChars, updatetitle, dolog )

port save : String -> Cmd msg
port doload : String -> Cmd msg
port load : (String -> msg) -> Sub msg
port dolist : () -> Cmd msg
port listChars : (String -> msg) -> Sub msg
port updatetitle : String -> Cmd msg
port dolog : String -> Cmd msg