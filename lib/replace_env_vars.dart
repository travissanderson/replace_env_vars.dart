/// Provides a transformer for replacing values in Dart files with environment variable values
///
/// Remember to add "- replace_env_vars" to your list of transformers in pubspec.yaml
library replace_env_vars;

import 'dart:async';
import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:barback/barback.dart';

import 'src/implementation.dart';

class ReplaceEnvVarsTransformer extends Transformer {
  ReplaceEnvVarsTransformer.asPlugin();

  @override
  String get allowedExtensions => '.dart';

  AnsiPen _orangePen = new AnsiPen()..xterm(208);

  Future apply(Transform transform) async {
    var content = await transform.primaryInput.readAsString();
    var id = transform.primaryInput.id;
    var results = transformStringWithEnvironment(content, Platform.environment);
    for (var missing in results.missingVars) {
      print(_orangePen('Found text replacement marker for "$missing" but environment variable is not set!\n'));
    }
    transform.addOutput(new Asset.fromString(id, results.newContent));
  }
}
