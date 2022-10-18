abstract class CurrencyConverterInterface {
  Future<num> convert(num value, String from, String to);
}