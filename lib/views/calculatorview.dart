import 'package:calculator/utils/custom_button.dart';
import 'package:calculator/utils/operator_check.dart';
import 'package:flutter/material.dart';
import 'package:calculator/utils/equal_check.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  var question = '0';
  var answer = '0';

  void getUserInput(int index) {
    setState(() {
      if (question[0] == '0' && question.length == 1) {
        question = buttons[index];
      } else {
        question += buttons[index];
      }
    });
  }

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
    "00",
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Calculator",
            style: TextStyle(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.7),
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return CustomButton(
                    buttonTapped: () => {
                      setState(() {
                        final length = question.length;
                        if (length > 1) {
                          question = question.substring(0, length - 1);
                        } else {
                          question = '0';
                        }
                      })
                    },
                    btnText: buttons[index],
                    color: Colors.blue[600]!,
                    textColor: Colors.white,
                  );
                } else if (index == 1) {
                  return CustomButton(
                    buttonTapped: () => {
                      setState(() {
                        question = '0';
                        answer = '0';
                      })
                    },
                    btnText: buttons[index],
                    color: Colors.blue[600]!,
                    textColor: Colors.white,
                  );
                } else if (index == buttons.length - 1) {
                  return CustomButton(
                    buttonTapped: () => {
                      setState(() {
                        answer = equalCheck(question);
                      })
                    },
                    btnText: buttons[index],
                    color: Colors.blue,
                    textColor: Colors.white,
                  );
                }
                return CustomButton(
                  buttonTapped: () => {getUserInput(index)},
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
