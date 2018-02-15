# Sierpinski Carpet
## Dependencies
[elm 0.16.x](http://elm-lang.org/install)

If you want to run it as an [electron](http://electron.atom.io/) app, you will of course also need electron and it's dependencies.  
You can find more information and an excellent tutorial on using electron with elm [here](https://medium.com/@ezekeal/building-an-electron-app-with-elm-part-1-boilerplate-3416a730731f#.i6d3hh3sl).
## Setup
In the project folder run  

    elm package install  
## Compiling
In the project folder run  

    elm make src/SierpinskiCarpet/Main.elm --output=bin/sierpinski-carpet.js  

or, if you have npm installed

    npm run make

There is also a bash script (make.sh) and a windows batch file (make.bat) you can use.
## Testing
Open sierpinski-carpet.html.  
You should see a beautiful hand woven Sierpinski carpet...
