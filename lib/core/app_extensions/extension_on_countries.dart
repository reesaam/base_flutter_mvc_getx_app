import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../data/resources/app_countries.dart';

extension ExtensionCountryFlagWidget on AppCountries {
  Widget get flag => AspectRatio(aspectRatio: 1.5, child: CountryFlag.fromCountryCode(countryNameAbbreviation ?? ''));
}
