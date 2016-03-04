module SierpinskiCarpet.Interop ( ModelJS , toModel ) where

import SierpinskiCarpet.Model exposing ( Model )

import Color                  exposing ( rgba )


type alias ModelJS =
  { colorRGBA : ( Int , Int , Int , Float )
  , pixelSize : ( Float , Float )
  }


toModel : ModelJS -> Model
toModel { colorRGBA , pixelSize } =
  let
    ( r , g , b , a ) = colorRGBA
  in
    { color     = rgba r g b a
    , pixelSize = pixelSize
    }
