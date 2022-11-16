# ./run_release_production.sh <deviceId>
# ./run_release_production.sh 261262C9-9C12-49CD-8190-C3BC1B19A9C9
fvm flutter run --debug --flavor prod -d $1 -t lib/main-prod.dart
