import 'package:currency_converter/controllers/currency_converter_controller.dart';
import 'package:currency_converter/controllers/currency_converter_forex_api_controller.dart';
import 'package:currency_converter/controllers/currency_converter_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _textEditingController = TextEditingController();
  CurrencyConverterInterface exchangeController =
      CurrencyConverterForexApiController();
  String fromCurrency = list[0];
  String toCurrency = list[0];
  String fromPrefix = listSymbols[0];
  String toPrefix = listSymbols[1];
  num amountToConvert = 0;
  num result = 0;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(child: Text("From")),
                Expanded(child: CurrencyDropdownButton(
                  onChanged: (value) {
                    setState(() {
                      _textEditingController.text = '';
                      fromCurrency = value;
                      fromPrefix = listSymbols[list.indexOf(fromCurrency)];
                    });
                  },
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  onChanged: (val) => amountToConvert = double.parse(val),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: fromPrefix,
                    border: OutlineInputBorder(),
                    hintText: ' Enter amount',
                  ),
                )),
              ],
            ),
            Row(children: [
              Expanded(child: Text("To")),
              Expanded(child: CurrencyDropdownButton(

                onChanged: (value) {
                  setState(() {
                    _textEditingController.text = '';
                    toCurrency = value;
                    toPrefix = listSymbols[list.indexOf(toCurrency)];
                  });
                },
              ))
            ]),
            FutureBuilder<num>(
                future:
                    exchangeController.convert(amountToConvert, fromCurrency, toCurrency),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: _textEditingController,
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixText: toPrefix),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                exchangeController.convert(
                                    amountToConvert, fromCurrency, toCurrency);

                                setState(() {
                                  _textEditingController.text =
                                      snapshot.data.toString();
                                });
                              },
                              child: Text(snapshot.connectionState != ConnectionState.waiting ? "Convert": "Wait, converting"))
                        ],
                      )
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['USD', 'EUR', 'GBP', 'TRY'];
const List<String> listSymbols = <String>['\$', '€', '£', '₺'];

class CurrencyDropdownButton extends StatefulWidget {
  CurrencyDropdownButton({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  State<CurrencyDropdownButton> createState() => _CurrencyDropdownButtonState();
}

class _CurrencyDropdownButtonState extends State<CurrencyDropdownButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
