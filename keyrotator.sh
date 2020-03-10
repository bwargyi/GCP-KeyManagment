#!/bin/bash
sa=$1
project=$2
echo "[*] Keys on SA: $sa"
keyIDlist=$(gcloud iam service-accounts keys list --iam-account $sa --project $project --format json | jq -r '.[].name')
for keyID in $keyIDlist
do
 echo "[*] Key: $keyID"
 gcloud iam service-accounts keys delete $keyID --iam-account=$sa
 gcloud iam service-accounts keys create $sa --iam-account=$sa
done
