#!/bin/bash
input=$1
while IFS= read -r line
do
  echo "SA on project ----------> $line"
  sa_list=$(gcloud iam service-accounts list --project $line --format json | jq -r '.[].email')
  for sa in $sa_list
  do
   echo "Keys on SA ---> $sa"
   gcloud iam service-accounts keys list  --iam-account $sa
  done
  echo "-------------------------------"
done < "$input"
