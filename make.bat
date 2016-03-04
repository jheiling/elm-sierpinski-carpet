@echo off
rmdir bin /s /q
elm make src/SierpinskiCarpet/Main.elm --output=bin/sierpinski-carpet.js
pause
