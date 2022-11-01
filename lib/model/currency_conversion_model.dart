class CurrencyConversionModel {
  num amountToConvert = 0;
  num convertedValue = 0;
  String fromCurrency = listOfCurrencies[0];
  String toCurrency = listOfCurrencies[1];

  String toString() {
    return "From ${amountToConvert} ${fromCurrency} to ${convertedValue} ${toCurrency}";
  }

}

const List<String> listOfCurrencies = <String>['USD', 'EUR', 'GBP', 'TRY'];
const List<String> listSymbols = <String>['\$', '€', '£', '₺'];