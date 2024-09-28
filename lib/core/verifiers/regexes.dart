import 'package:flutter_regex/flutter_regex.dart';

class AppRegexes {

  static String get numeric => '^[0-9]+';
  static String get url => RegexPattern.url;

  static String get phoneNumber => RegexPattern.phone;
  static String get email => '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z.]';

  static String get username => RegexPattern.username;
  static String get passwordEasy => RegexPattern.passwordEasy;
  static String get passwordHard => RegexPattern.passwordHard;

  static String get macAddress => RegexPattern.macAddress;

  static String get google => RegexPattern.usernameGoogle;
  static String get github => RegexPattern.github;
  static String get youTube => RegexPattern.youtube;
}