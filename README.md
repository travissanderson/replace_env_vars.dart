# replace_env_vars

Provides a transformer that can insert environment variable values into Dart files.

## Usage

Add as a dependency **and as a transformer** to your pubspec.yaml:

    dependencies:
      replace_env_vars: ^0.1.0
  	transformers:
  	- replace_env_vars

In your Dart code, you can mark an area for replacement by wrapping with three curly braces:

	const String secretApiKey = '{{{NAME_OF_ENV_VAR}}}';

In the example above, the value of `NAME_OF_ENV_VAR` from your environment will replace `{{{NAME_OF_ENV_VAR}}}`.  If you set the environment, for example using `export NAME_OF_ENV_VAR="awesome"`, the transformer will change the code like so:

	const String secretApiKey = 'awesome';

## Features and bugs

Please file feature requests and bugs on [https://github.com/travissanderson/replace_env_vars.dart](https://github.com/travissanderson/replace_env_vars.dart)