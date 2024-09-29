import '../../core_models/verifier_models/regexes.dart';

extension Equal on AppRegexes {
  bool equalTo(AppRegexes regExp) => regexValue == regExp.regexValue;
}

extension GetRegExp on AppRegexes {
  RegExp get regExp => RegExp(regexValue);
}

extension ListContain on List<AppRegexes> {
  bool contains(AppRegexes regExp) => where((element) => element.equalTo(regExp)).isNotEmpty;
}
