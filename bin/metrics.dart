import 'package:lintme/src/cli/cli_runner.dart';

Future<void> main(List<String> args) async {
  await CliRunner().run(args);
}
