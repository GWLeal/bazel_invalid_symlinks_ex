#!/bin/bash

if [ $# == 2 ]; then
    mkdir "$2"
fi

ln -s "/some/inexistent/path" "$1"
