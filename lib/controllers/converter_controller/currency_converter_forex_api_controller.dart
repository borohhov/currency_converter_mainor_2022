import 'dart:convert';

import 'package:currency_converter/controllers/converter_controller/currency_converter_interface.dart';
import 'package:currency_converter/model/currency_conversion_model.dart';
import 'package:http/http.dart' as http;

const String apiKey = '0236edf637-9e64ab7203-rl0san';

class CurrencyConverterForexApiController implements CurrencyConverterInterface {
  @override
  Future<num> convert(CurrencyConversionModel model) async {
    
    http.Response response = await http.get(Uri.parse('https://api.fastforex.io/fetch-one?from=${model.fromCurrency}&to=${model.toCurrency}&api_key=$apiKey'));
    var resultString = jsonDecode(response.body);
    num result = resultString['result'].values.toList().first;

    return result * model.amountToConvert;
  }
}