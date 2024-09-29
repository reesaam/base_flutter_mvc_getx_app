import 'package:flutter_regex/flutter_regex.dart';

class AppRegexes {
  final String regexValue;

  const AppRegexes({required this.regexValue});

  factory AppRegexes.numeric() => const AppRegexes(regexValue: r'^[0-9]+');
  factory AppRegexes.url() => AppRegexes(regexValue: RegexPattern.url);
  factory AppRegexes.phoneNumber() => AppRegexes(regexValue: RegexPattern.phone);
  factory AppRegexes.email() => const AppRegexes(regexValue: r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z.]');
  factory AppRegexes.username() => AppRegexes(regexValue: RegexPattern.username);
  factory AppRegexes.passwordEasy() => AppRegexes(regexValue: RegexPattern.passwordEasy);
  factory AppRegexes.passwordHard() => AppRegexes(regexValue: RegexPattern.passwordHard);
  factory AppRegexes.macAddress() => AppRegexes(regexValue: RegexPattern.macAddress);
  factory AppRegexes.google() => AppRegexes(regexValue: RegexPattern.usernameGoogle);
  factory AppRegexes.github() => AppRegexes(regexValue: RegexPattern.github);
  factory AppRegexes.youTube() => AppRegexes(regexValue: RegexPattern.youtube);
}

class AppRegexesList {
  final List<AppRegexes>? regexesList;

  const AppRegexesList(this.regexesList);
  factory AppRegexesList.exceptionsForFormatting() => AppRegexesList(List<AppRegexes>.of([
        AppRegexes.email(),
        AppRegexes.google(),
        AppRegexes.github(),
        AppRegexes.youTube(),
      ]));
}
