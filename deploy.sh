#!/usr/bin/env bash
set -e

./gradlew clean assemble

gcloud compute scp api/build/libs/api*.jar scouting:/scouting/api.jar
gcloud compute scp archive.zip scouting:/scouting/archive.zip

gcloud compute ssh scouting --command "sudo systemctl restart api"
