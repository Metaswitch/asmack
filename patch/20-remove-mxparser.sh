#!/usr/bin/env bash

<<<<<<< HEAD
find org/jivesoftware -name '*.java' -exec sed -i '' 's:import org.xmlpull.mxp1.MXParser:import org.xmlpull.v1.XmlPullParserFactory:' '{}' ';'
find org/jivesoftware -name '*.java' -exec sed -i '' 's:new MXParser():XmlPullParserFactory.newInstance().newPullParser():g' '{}' ';'
=======
[ "Darwin" = $(uname) ] && SEDI="sed -i ''" || SEDI='sed -i'

find org/jivesoftware -name '*.java' -exec $SEDI 's:import org.xmlpull.mxp1.MXParser:import org.xmlpull.v1.XmlPullParserFactory:' '{}' ';'
find org/jivesoftware -name '*.java' -exec $SEDI 's:new MXParser():XmlPullParserFactory.newInstance().newPullParser():g' '{}' ';'
>>>>>>> 18a81494e8f2752740f2e450cb2b024aeafd3bc5

