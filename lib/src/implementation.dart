TransformResults transformStringWithEnvironment(String text, Map<String, String> env) {
  var matches = new RegExp(r'\{\{\{(.+?)\}\}\}').allMatches(text);
  var newContent = text;
  var results = new TransformResults();
  for (var match in matches) {
    if (!env.containsKey(match.group(1))) {
      results.missingVars.add(match.group(1));
    } else {
      newContent = newContent.replaceFirst(match.group(0), env[match.group(1)]);
    }
  }
  results.newContent = newContent;
  return results;
}

class TransformResults {
  String newContent;
  List<String> missingVars = [];
}
