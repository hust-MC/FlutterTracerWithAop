#!/bin/bash

flutter clean
rm -r ~/Android/workspace/MC/flutter/bin/cache/flutter_tools.stamp
rm -r ~/Android/workspace/MC/aspectd/lib/src/flutter_frontend_server/frontend_server.dart.snapshot
flutter run --profile