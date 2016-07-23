#!/bin/bash -e

echo "Installing necessary JARs to run tests for Kafka Streams app..."

project_dir=`pwd`
tmp_dir="${project_dir}/tmp"

if [ ! -d "tmp" ]; then

mkdir -p $tmp_dir

cd ${tmp_dir}
git clone git@github.com:confluentinc/schema-registry.git
cd schema-registry
git checkout v3.0.0
cd core
mvn install -Dmaven.test.skip=true

cd ${tmp_dir}
git clone git@github.com:jeff-svds/examples.git
cd examples
git checkout testjar
cd kafka-streams
mvn install

fi
