# ./run_debug_development.sh <deviceId>
# ./run_debug_development.sh 261262C9-9C12-49CD-8190-C3BC1B19A9C9
fvm flutter run --debug --flavor dev -d $1 -t lib/main-dev.dart
