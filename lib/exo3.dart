import 'package:flutter/material.dart';

class Exo3Page extends StatefulWidget {
  const Exo3Page({super.key});

  @override
  State<Exo3Page> createState() => _Exo3PageState();
}

class _Exo3PageState extends State<Exo3Page> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  String? _selectedOperation;

  void _calculate() {
    final double? num1 = double.tryParse(_num1Controller.text);
    final double? num2 = double.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      _resultController.text = 'Entrée invalide';
      return;
    }

    if (_selectedOperation == null) {
      _resultController.text = 'Veuillez sélectionner une opération';
      return;
    }

    double result;
    switch (_selectedOperation) {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Exercice 3 - Calculatrice Radio')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Nombre 1
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nombre 1',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Nombre 2
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nombre 2',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Boutons radio
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Addition'),
                  value: 'Addition',
                  groupValue: _selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      _selectedOperation = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Soustraction'),
                  value: 'Soustraction',
                  groupValue: _selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      _selectedOperation = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Multiplication'),
                  value: 'Multiplication',
                  groupValue: _selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      _selectedOperation = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Division'),
                  value: 'Division',
                  groupValue: _selectedOperation,
                  onChanged: (value) {
                    setState(() {
                      _selectedOperation = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Bouton calculer
            ElevatedButton(
              onPressed: _calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 40,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('Calculer'),
            ),
            const SizedBox(height: 20),

            // Résultat
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Résultat',
                border: UnderlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
