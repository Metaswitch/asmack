#!/usr/bin/env bash

[ "Darwin" = $(uname) ] && SEDI="sed -i ''" || SEDI='sed -i'

mkdir -p org/apache/harmony/
mv javax org/apache/harmony/
<<<<<<< HEAD
find org/apache/harmony/ -name '*.java' -exec sed -i '' 's:package javax:package org.apache.harmony.javax:g' '{}' ';'
find . -name '*.java' -exec sed -i '' 's:import javax.security.sasl:import org.apache.harmony.javax.security.sasl:g' '{}' ';'
find . -name '*.java' -exec sed -i '' 's:import javax.security.auth:import org.apache.harmony.javax.security.auth:g' '{}' ';'
=======
find org/apache/harmony/ -name '*.java' -exec $SEDI 's:package javax:package org.apache.harmony.javax:g' '{}' ';'
find . -name '*.java' -exec $SEDI 's:import javax.security.sasl:import org.apache.harmony.javax.security.sasl:g' '{}' ';'
find . -name '*.java' -exec $SEDI 's:import javax.security.auth:import org.apache.harmony.javax.security.auth:g' '{}' ';'
>>>>>>> 18a81494e8f2752740f2e450cb2b024aeafd3bc5

