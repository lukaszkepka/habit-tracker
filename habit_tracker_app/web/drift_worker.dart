// Source of web/drift_worker.js. Compiled from the project's locked packages so
// the worker always matches web/sqlite3.wasm (same sqlite3 package version).
//
// Rebuild after upgrading drift or sqlite3 (and re-download sqlite3.wasm from
// the matching sqlite3.dart release):
//   dart compile js -O4 web/drift_worker.dart -o web/drift_worker.js
import 'package:drift/wasm.dart';

void main() => WasmDatabase.workerMainForOpen();
