#!/usr/bin/env bash

<<<<<<< HEAD
find . -name '*.java' -exec sed -i '' 's:import org.apache.harmony.javax.security.sasl.Sasl;:import de.measite.smack.Sasl;:g' '{}' ';'
=======
[ "Darwin" = $(uname) ] && SEDI="sed -i ''" || SEDI='sed -i'

find . -name '*.java' -exec $SEDI 's:import org.apache.harmony.javax.security.sasl.Sasl;:import de.measite.smack.Sasl;:g' '{}' ';'
>>>>>>> 18a81494e8f2752740f2e450cb2b024aeafd3bc5

