#!/bin/bash

set -x

mkdir html

for i in 0 1 2 3 4 5 6 7 8 9; do
  while ! curl -m 2 -L -o "html/$i.jpg" "https://picsum.photos/1280/960"; do 
    sleep 1;
  done
done

# add transparent png
while ! curl -m 2 -o html/transparent-test.png "https://www.w3.org/Graphics/PNG/alphatest.png"; do
  sleep 1;
done

# add video
while ! curl -m 10 -L -o html/video.mp4 "https://ik.imagekit.io/demo/sample-video.mp4"; do
  sleep 1;
done

# add PDF
while ! curl -m 2 -L -o html/dummy.pdf "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"; do
  sleep 1;
done

# create som inaccessible files for testing
mkdir -p html/inaccessible-dir

while ! curl -m 2 -L -o html/inaccessible-dir/inaccessible-image.jpg "https://picsum.photos/1280/960"; do
  sleep 1;
done

echo 'Lorem ipsum dolor sit amet' > html/inaccessible-dir/inaccessible-text-file.txt
