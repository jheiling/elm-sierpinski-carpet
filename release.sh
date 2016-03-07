#!/bin/bash
sh make.sh
rm -rf release
7z a release/elm-sierpinski-carpet.zip sierpinski-carpet.html bin/sierpinski-carpet.js
asar pack electron-elm-sierpinski-carpet release/electron-elm-sierpinski-carpet.asar
