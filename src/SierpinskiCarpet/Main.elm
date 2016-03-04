module SierpinskiCarpet.Main where

import SierpinskiCarpet.Model   exposing ( Model , defaultModel )
import SierpinskiCarpet.View    exposing ( view )
import SierpinskiCarpet.Interop exposing ( ModelJS , toModel )

import Maybe                    exposing ( withDefault )
import Signal                   exposing ( map2 , filterMap )
import Graphics.Element         exposing ( Element )
import Window                   exposing ( dimensions )


main : Signal Element
main = map2 ( view ) dimensions model

model : Signal Model
model = filterMap ( Maybe.map toModel ) defaultModel loadModel

port loadModel : Signal ( Maybe ModelJS )
