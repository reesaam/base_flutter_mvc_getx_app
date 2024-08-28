import '../shared_models/helper_models/duration_custom_model/duration_custom_model.dart';

enum AppCountries {
  utc(
    countryName: 'GMT',
    countryNameAbbreviation: 'GMT',
    timeZoneAbbreviation: ['UTC'],
    timeZoneOffset: [DurationCustomModel()],
  ),
  iran(
    countryName: 'Iran',
    countryNameAbbreviation: 'IR',
    code: '98',
    currency: AppCurrency.irr,
    timeZoneAbbreviation: ['IRST'],
    timeZoneOffset: [DurationCustomModel(hour: 4, minute: 30)],
  ),
  germany(
    countryName: 'Germany',
    countryNameAbbreviation: 'DE',
    code: '49',
    currency: AppCurrency.euro,
    timeZoneAbbreviation: ['CET'],
    timeZoneOffset: [DurationCustomModel(hour: 2)],
  ),
  us(
    countryName: 'United States',
    countryNameAbbreviation: 'US',
    code: '1',
    currency: AppCurrency.usd,
    timeZoneAbbreviation: ['PST', 'MST', 'CST', 'EST'],
    timeZoneOffset: [
      DurationCustomModel(hour: -8),
      DurationCustomModel(hour: -7),
      DurationCustomModel(hour: -6),
      DurationCustomModel(hour: -5),
    ],
  ),
  uk(
    countryName: 'United Kingdom',
    countryNameAbbreviation: 'GB',
    code: '44',
    currency: AppCurrency.gbp,
    timeZoneAbbreviation: ['BST'],
    timeZoneOffset: [DurationCustomModel(hour: 1)],
  ),
  canada(
    countryName: 'Canada',
    countryNameAbbreviation: 'CA',
    code: '1',
    currency: AppCurrency.cad,
    timeZoneAbbreviation: ['PST', 'MST', 'CST', 'EST', 'AST'],
    timeZoneOffset: [
      DurationCustomModel(hour: -7),
      DurationCustomModel(hour: -6),
      DurationCustomModel(hour: -5),
      DurationCustomModel(hour: -4),
      DurationCustomModel(hour: -3),
    ],
  ),
  //Default
  unknown(
    countryName: 'Unknown',
    countryNameAbbreviation: 'Unknown',
    code: 'Unknown',
    currency: AppCurrency.unknown,
    timeZoneAbbreviation: ['Unknown'],
    timeZoneOffset: [DurationCustomModel()],
  );

  ///Variables
  final String? countryName;
  final String? countryNameAbbreviation;
  final String? code;
  final AppCurrency? currency;
  final List<String>? timeZoneAbbreviation;
  final List<DurationCustomModel>? timeZoneOffset;

  ///Constructor
  const AppCountries({
    this.countryName,
    this.countryNameAbbreviation,
    this.code,
    this.currency,
    this.timeZoneAbbreviation,
    this.timeZoneOffset,
  });
}

enum AppCurrency {
  irr(AppCurrencySign.rial, 'IRR'),
  euro(AppCurrencySign.euro, 'Euro'),
  usd(AppCurrencySign.dollar, 'USD'),
  cad(AppCurrencySign.dollar, 'CAD'),
  gbp(AppCurrencySign.pound, 'GBP'),
  unknown(AppCurrencySign.unknown, '');

  final AppCurrencySign sign;
  final String name;
  const AppCurrency(this.sign, this.name);
}

enum AppCurrencySign {
  rial('ریال'),
  dollar('\$'),
  euro('€'),
  pound('£'),
  unknown('');

  final String string;
  const AppCurrencySign(this.string);
}
