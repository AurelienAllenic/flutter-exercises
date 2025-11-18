import 'package:flutter/material.dart';

class Exo2Page extends StatefulWidget {
  const Exo2Page({super.key});

  @override
  State<Exo2Page> createState() => _Exo2PageState();
}

class _Exo2PageState extends State<Exo2Page> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  void _calculate(String operation) {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      _resultController.text = 'Entrée invalide';
      return;
    }

    double result;
    switch (operation) {
      case 'Addition':
        result = num1 + num2;
        break;
      case 'Soustraction':
        result = num1 - num2;
        break;
      case 'Multiplication':
        result = num1 * num2;
        break;
      case 'Division':
        if (num2 == 0) {
          _resultController.text = 'Erreur : division par zéro';
          return;
        }
        result = num1 / num2;
        break;
      default:
        return;
    }

    _resultController.text = result % 1 == 0
        ? result.toInt().toString()
        : result.toString();
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> operations = [
      'Addition',
      'Soustraction',
      'Multiplication',
      'Division',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercice 2 - Calculatrice')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nombre 1',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nombre 2',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Résultat',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            LayoutBuilder(
              builder: (context, constraints) {
                double totalButtonWidth =
                    operations.length * 90 + (operations.length - 1) * 10;
                bool canFitInRow = totalButtonWidth <= constraints.maxWidth;

                return canFitInRow
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: operations
                            .map((op) => _buildButton(op))
                            .toList(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: operations.map((op) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: _buildButton(op),
                          );
                        }).toList(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String operation) {
    return ElevatedButton(
      onPressed: () => _calculate(operation),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: Text(operation),
    );
  }
}
