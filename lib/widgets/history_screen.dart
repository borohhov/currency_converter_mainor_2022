import 'package:currency_converter/model/currency_conversion_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  List<Widget> getHistoryItems(BuildContext context) {
    List<Widget> items = [];
    Provider.of<CurrencyConversionHistory>(context, listen: false)
        .history
        .forEach((element) {
      items.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "From ${element.amountToConvert} ${element.fromCurrency} to ${element.convertedValue} ${element.toCurrency}",
              style: TextStyle(fontSize: 18)),
        ),
      );
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: getHistoryItems(context),
          ),
        ),
      ),
    );
  }
}
