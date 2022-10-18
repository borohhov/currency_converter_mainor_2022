import 'dart:convert';

import 'package:currency_converter/controllers/currency_converter_interface.dart';
import 'package:http/http.dart' as http;

const String apiKey = '14e1167030-c7743be3d4-rjxtlb';

class CurrencyConverterForexApiController implements CurrencyConverterInterface {
  @override
  Future<num> convert(num value, String from, String to) async {
    
    http.Response response = await http.get(Uri.parse('https://api.fastforex.io/fetch-one?from=$from&to=$to&api_key=$apiKey'));
    var resultString = jsonDecode(response.body);
    num result = resultString['result'].values.toList().first;

    return result * value;
  }
}