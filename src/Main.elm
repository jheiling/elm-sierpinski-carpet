module Main where

import Model            exposing ( Model , defaultModel )
import View             exposing ( view )

import Maybe
import Maybe            exposing ( withDefault )
import Signal           exposing ( map2 , filterMap )
import Color            exposing ( rgba )
import Graphics.Element exposing ( Element )
import Window           exposing ( dimensions )


type alias ModelJS =
  { colorRGBA : ( Int , Int , Int , Float )
  , pixelSize : ( Float , Float )
  }


main : Signal Element
main = map2 ( view ) dimensions model

model : Signal Model
model = filterMap ( Maybe.map fromModelJS ) defaultModel loadModel

fromModelJS : ModelJS -> Model
fromModelJS modelJS =
  let
    ( r , g , b , a ) = modelJS.colorRGBA
  in
    { color     = rgba r g b a
    , pixelSize = modelJS.pixelSize
    }

port loadModel : Signal ( Maybe ModelJS )
