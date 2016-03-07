#!/bin/bash
rm -rf bin
elm make src/SierpinskiCarpet/Main.elm --output=bin/sierpinski-carpet.js
