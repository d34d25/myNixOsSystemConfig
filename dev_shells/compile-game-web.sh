#!/usr/bin/env bash

emcc main.c src/*c ./lib/libraylib.web.a -I ./headers -I ./headers/raylib -I ./lib --preload-file assets -s USE_GLFW=3 -s ASYNCIFY -o webGame/index.html

