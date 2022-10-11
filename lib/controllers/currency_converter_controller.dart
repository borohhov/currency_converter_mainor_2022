class CurrencyConverterController {
  num value;
  String from;
  String to;

  CurrencyConverterController(this.value, this.from, this.to);

  num convert() {
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