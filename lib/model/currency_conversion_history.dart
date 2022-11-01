import 'dart:collection';

import 'package:currency_converter/controllers/persistence_controller/persistence_controller_interface.dart';
import 'package:currency_converter/controllers/persistence_controller/shared_preferences_controller.dart';
import 'package:flutter/material.dart';

import 'currency_conversion_model.dart';

const HistoryTable = "HistoryTable";

class CurrencyConversionHistory extends ChangeNotifier {
  final List<String> _history = [];
  PersistenceController persistenceController = SharedPreferencesController();

  Future<List<String>?> getHistory() {
    var list = persistenceController.getListString(HistoryTable);
    return list;
  }


  void add(CurrencyConversionModel m) {
    CurrencyConversionModel m1 = CurrencyConversionModel();
    m1.convertedValue = m.convertedValue;
    m1.amountToConvert = m.amountToConvert;
    m1.toCurrency = m.toCurrency;
    m1.fromCurrency = m.fromCurrency;

    _history.add(m1.toString());
    persistenceController.saveListData(HistoryTable, _history);
    notifyListeners();
  }
}
