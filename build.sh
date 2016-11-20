#!/bin/sh
mkdir -p openshift-client/export
mkdir -p openshift-client/files/bin
mkdir -p .tmp
curl -sSL https://github.com/openshift/origin/releases/download/v1.3.1/openshift-origin-client-tools-v1.3.1-dad658de7465ba8a234a4fb40b5b446a45a4cee1-linux-64bit.tar.gz > .tmp/openshift.tar.gz
tar -zxvf .tmp/openshift.tar.gz -C .tmp/
cp .tmp/openshift*/* openshift-client/files/
mv openshift-client/files/oc openshift-client/files/bin/
cp metadata openshift-client/
rm -rf .tmp
flatpak build-export repo openshift-client
flatpak build-bundle repo openshift-client.flatpak nl.gbraad.OpenShiftClient
