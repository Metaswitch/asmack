#!/usr/bin/env bash

<<<<<<< HEAD
find org/apache/harmony -name '*.java' -exec sed -i '' 's:import org.apache.harmony.auth.internal.nls.Messages;::' '{}' ';'
find org/apache/harmony -name '*.java' -exec sed -i '' 's:Messages.getString(\("[^"]*"\)):\1:g' '{}' ';'
=======
[ "Darwin" = $(uname) ] && SEDI="sed -i ''" || SEDI='sed -i'

find org/apache/harmony -name '*.java' -exec $SEDI 's:import org.apache.harmony.auth.internal.nls.Messages;::' '{}' ';'
find org/apache/harmony -name '*.java' -exec $SEDI 's:Messages.getString(\("[^"]*"\)):\1:g' '{}' ';'
>>>>>>> 18a81494e8f2752740f2e450cb2b024aeafd3bc5

