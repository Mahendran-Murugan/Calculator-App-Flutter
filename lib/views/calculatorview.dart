import 'package:flutter/material.dart';

class CalCulatorView extends StatefulWidget {
  const CalCulatorView({super.key});

  @override
  State<CalCulatorView> createState() => _CalCulatorViewState();
}

class _CalCulatorViewState extends State<CalCulatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      ),
    );
  }
}
