import 'dart:collection';

import 'package:flutter/material.dart';

import 'currency_conversion_model.dart';

class CurrencyConversionHistory extends ChangeNotifier {
  final List<CurrencyConversionModel> _history = [];

  /// An unmodifiable view of the items in the history.
  UnmodifiableListView<CurrencyConversionModel> get history =>
      UnmodifiableListView(_history);

  void add(CurrencyConversionModel m) {
    CurrencyConversionModel m1 = CurrencyConversionModel();
    m1.convertedValue = m.convertedValue;
    m1.amountToConvert = m.amountToConvert;
    m1.toCurrency = m.toCurrency;
    m1.fromCurrency = m.fromCurrency;
    _history.add(m1);
    notifyListeners();
  }
}
