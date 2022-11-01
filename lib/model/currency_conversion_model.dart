class CurrencyConversionModel {
  num amountToConvert = 0;
  num convertedValue = 0;
  String fromCurrency = listOfCurrencies[0];
  String toCurrency = listOfCurrencies[1];
}

const List<String> listOfCurrencies = <String>['USD', 'EUR', 'GBP', 'TRY'];
const List<String> listSymbols = <String>['\$', '€', '£', '₺'];