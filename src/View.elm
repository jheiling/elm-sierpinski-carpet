module View ( view ) where

import Model            exposing ( Model , isFilled )

import List             exposing ( foldr , concat )
import Graphics.Element exposing ( Element )
import Graphics.Collage exposing ( Form , collage , rect , filled , move )


view : ( Int , Int ) -> Model -> Element
view ( w , h ) model =
  let
    rows = foldr ( \ y acc -> line y :: acc ) [] [ 0 .. hMax ] |> concat
    line y = foldr ( \ x acc -> if isFilled x y then drawPixel x y :: acc else acc ) [] [ 0 .. wMax ]
    drawPixel x y = move ( toFloat x * pixelSizeX + offsetX , toFloat y * pixelSizeY + offsetY ) pixel'
    pixel' = pixel model
    wMax = toFloat ( w - 1 ) / pixelSizeX |> ceiling
    hMax = toFloat ( h - 1 ) / pixelSizeY |> ceiling
    pixelSizeX = fst model.pixelSize
    pixelSizeY = snd model.pixelSize
    offsetX = ( toFloat -w ) / 2.0
    offsetY = ( toFloat -h ) / 2.0
  in
    collage w h rows

pixel : Model -> Form
pixel model =
    rect ( fst model.pixelSize ) ( snd model.pixelSize )
    |> filled model.color
