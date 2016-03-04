module SierpinskiCarpet.Model ( Model , defaultModel , isFilled ) where

import Color exposing ( Color , red )


type alias Model =
  { color     : Color
  , pixelSize : ( Float , Float )
  }


defaultModel : Model
defaultModel =
  { color     = red
  , pixelSize = ( 5.0 , 5.0 )
  }

isFilled : Int -> Int -> Bool
isFilled x y =
  if x > 0 && y > 0 then
    if x % 3 == 1 && y % 3 == 1 then False
    else isFilled ( x // 3 ) ( y // 3 )
  else True
