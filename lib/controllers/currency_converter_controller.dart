import 'currency_converter_interface.dart';

class CurrencyConverterController implements CurrencyConverterInterface {
  @override
  Future<num> convert(num value, String from, String to) async {
    String currencies = from.toUpperCase() + to.toUpperCase();
    return (conversionRatio[currencies]  ?? 1) * value;
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