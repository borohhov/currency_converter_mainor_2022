import 'package:currency_converter/controllers/currency_converter_controller.dart';
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
  late TextEditingController _controller = TextEditingController();
  String fromCurrency = list[0];
  String toCurrency = list[0];
  String fromPrefix = listSymbols[0];
  String toPrefix = listSymbols[1];
  num value = 0;
  num result = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = result.toString();
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
                  onChanged: (val) => value = double.parse(val),
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
                    toCurrency = value;
                    toPrefix = listSymbols[list.indexOf(toCurrency)];
                  });
                },
              ))
            ]),
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  enabled: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), prefixText: toPrefix),
                )),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      CurrencyConverterController controller =
                          CurrencyConverterController(
                              value, fromCurrency, toCurrency);
                      result = controller.convert();

                      setState(() {
                        _controller.text = result.toString();
                      });
                    },
                    child: Text("Convert"))
              ],
            )
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
