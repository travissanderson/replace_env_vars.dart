import 'package:replace_env_vars/src/implementation.dart';
import 'package:test/test.dart';

void main() {
  group('replace_env_vars', () {
    test('replaces text leveraging the environment variable map', () {
      var results = transformStringWithEnvironment("""
const String secret = "{{{TEST_REPLACE}}}";
const int levelOfAwesome = {{{AWESOME_LEVEL}}};
""", {'AWESOME_LEVEL': '9001'});
      expect(results.missingVars.length, 1);
      expect(results.missingVars.first, 'TEST_REPLACE');
      expect(results.newContent, """
const String secret = "{{{TEST_REPLACE}}}";
const int levelOfAwesome = 9001;
"""
      );
    });
  });
}
