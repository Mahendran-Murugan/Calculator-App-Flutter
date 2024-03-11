import 'package:calculator/utils/custom_button.dart';
import 'package:calculator/utils/operator_check.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  var question = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '/',
    '9',
    '8',
    '7',
    '+',
    '0',
    '.',
    "ANS",
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 40, right: 30),
              alignment: Alignment.bottomRight,
              child: const Text(
                "0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.6),
              ),
              itemBuilder: (context, index) {
                return CustomButton(
                  btnText: buttons[index],
                  color: isOperator(buttons[index])
                      ? Colors.blue
                      : Colors.blue[100]!,
                  textColor: isOperator(buttons[index])
                      ? Colors.white
                      : Colors.blue[800]!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
