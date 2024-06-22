import 'dart:isolate';

import 'package:lintme/analyzer_plugin.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}
