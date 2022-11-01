import 'package:currency_converter/model/currency_conversion_model.dart';

abstract class CurrencyConverterInterface {
  Future<num> convert(CurrencyConversionModel model);
}