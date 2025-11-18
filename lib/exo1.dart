import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exo1Page extends StatelessWidget {
  const Exo1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercice 1')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Text(
                'Types de boutons en Flutter',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 150),

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Elevated Button'),
                ),
              ),
              const SizedBox(height: 15),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Text Button'),
                ),
              ),
              const SizedBox(height: 15),

              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Outlined Button'),
                ),
              ),
              const SizedBox(height: 10),

              Center(
                child: IconButton(
                  onPressed: () {},
                  iconSize: 60,
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),

              Center(
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(height: 15),

              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Select Option'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Center(
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                  child: const Text(
                    'Cupertino Button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
