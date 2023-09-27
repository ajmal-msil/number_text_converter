import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Number to Text Converter'),
        ),
        body: Center(
          child: NumberTextConverter(),
        ),
      ),
    );
  }
}

class NumberTextConverter extends StatefulWidget {
  @override
  _NumberTextConverterState createState() => _NumberTextConverterState();
}

class _NumberTextConverterState extends State<NumberTextConverter> {
  TextEditingController _controller = TextEditingController();
  String textRepresentation = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter a number',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final input = _controller.text;
            final number = int.tryParse(input);

            if (number != null) {
              setState(() {
                textRepresentation = formatNumber(number);
              });
            } else {
              setState(() {
                textRepresentation = 'Invalid input';
              });
            }
          },
          child: Text('Convert'),
        ),
        SizedBox(height: 20.0),
        Text(
          textRepresentation,
          style: TextStyle(fontSize: 24.0),
        ),
      ],
    );
  }

  String formatNumber(int number) {
    final format = NumberFormat.compact(locale: 'en_IN');
    return format.format(number);
  }
}
