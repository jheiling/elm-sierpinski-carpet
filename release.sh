#!/bin/bash
sh make.sh
rm -rf release
7z a release/web/elm-sierpinski-carpet.zip sierpinski-carpet.html bin/sierpinski-carpet.js
