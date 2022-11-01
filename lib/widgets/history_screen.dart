import 'package:currency_converter/model/currency_conversion_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder<List<String>?>(
            future: Provider.of<CurrencyConversionHistory>(context).getHistory(),
            builder: (context, snapshot) {
              if(!snapshot.hasData || snapshot.data == null) {
                return Text("No data");
              }
              return Column(
                children: snapshot.data!.map((e) => Text(e)).toList(),
              );
            }
          ),
        ),
      ),
    );
  }
}
