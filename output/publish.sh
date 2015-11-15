#!/bin/bash

cd `dirname $0`
bin/jekyll clean
bin/jekyll build

rsync -avzK _site/ output/
(
    cd output
    git add .
    git commit -m "Update documentation"
    git push origin master
)
