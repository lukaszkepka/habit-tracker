import 'package:logging/logging.dart';

final mainLogger = Logger('main');

void initializeLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
      '[${record.loggerName}] ${record.level.name}: ${record.time}: ${record.message}',
    );
  });
}
