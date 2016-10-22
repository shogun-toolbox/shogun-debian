#!/bin/sh

# called by uscan with '--upstream-version' <version> <file>

tar xjf $3
(cd shogun-$2 && ../debian/light-scrubber.sh)
mv shogun-$2 shogun_$2
tar cJf shogun_$2.orig.tar.xz shogun_$2
rm -rf $3 shogun-$2 shogun_$2

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv shogun_$2.orig.tar.xz $origDir
  echo "moved shogun_$2.orig.tar.xz to $origDir"
fi
