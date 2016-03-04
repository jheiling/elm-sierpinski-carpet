module SierpinskiCarpet.View ( view ) where

import SierpinskiCarpet.Model exposing ( Model , isFilled )

import List                   exposing ( foldr , concat )
import Graphics.Element       exposing ( Element )
import Graphics.Collage       exposing ( collage , rect , filled , move )


view : ( Int , Int ) -> Model -> Element
view ( w , h ) { color , pixelSize } =
  let
    rows = foldr ( \ y -> (::) ( line y ) ) [] [ 0 .. hMax ] |> concat
    line y = foldr ( \ x acc -> if isFilled x y then drawPixel x y :: acc else acc ) [] [ 0 .. wMax ]
    drawPixel x y = move ( toFloat x * pixelSizeX + offsetX , toFloat y * pixelSizeY + offsetY ) pixel
    pixel = rect pixelSizeX pixelSizeY |> filled color
    ( pixelSizeX , pixelSizeY ) = pixelSize
    wMax = toFloat ( w - 1 ) / pixelSizeX |> ceiling
    hMax = toFloat ( h - 1 ) / pixelSizeY |> ceiling
    offsetX = ( toFloat -w ) / 2.0
    offsetY = ( toFloat -h ) / 2.0
  in
    collage w h rows
