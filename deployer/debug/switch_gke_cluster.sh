#!/bin/bash

PROJECT=olegs-test2
CLUSTER=cluster-1
ZONE=us-east1-b

if [ "$1" == "poc" ]; then
    PROJECT=launcher-poc-207208
    CLUSTER=cluster-tmp
    ZONE=us-central1-a
fi

set -x
gcloud config set project $PROJECT
gcloud container clusters get-credentials "$CLUSTER" --zone "$ZONE"
kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
gcloud auth configure-docker
set +x
