import 'package:currency_converter/model/currency_conversion_model.dart';

import 'currency_converter_interface.dart';

class CurrencyConverterController implements CurrencyConverterInterface {
  @override
  Future<num> convert(CurrencyConversionModel model) async {
    String currencies = model.fromCurrency.toUpperCase() + model.toCurrency.toUpperCase();
    return (conversionRatio[currencies]  ?? 1) * model.amountToConvert;
  }

  Map<String, num> conversionRatio = {
    'USDEUR': 1.03,
    'EURUSD': 0.97,
    'USDGBP': 0.91,
    'GBPUSD': 1.1,
    'USDTRY': 18.58,
    'TRYUSD': 0.054,
  };
}