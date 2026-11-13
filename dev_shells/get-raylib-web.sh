#!/usr/bin/env bash

git clone --depth 1 https://github.com/raysan5/raylib.git raylib && 
mkdir lib headers && mkdir headers/raylib 

cd raylib/src/

make PLATFORM=PLATFORM_WEB && 
mv libraylib.web.a ../../lib && 
cp raylib.h rlgl.h raymath.h rcamera.h ../../headers/raylib/ &&
echo "raylib web sucessfully installed in current project"
