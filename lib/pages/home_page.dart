import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listGerencia = ['SetState', 'Bloc', 'GetX'];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Row(
          children: listGerencia.map((e) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/pages/$e');
                },
                child: Card(
                  elevation: 30,
                  color: Colors.green,
                  child: Text(e),
                ));
          }).toList(),
        ));
  }
}
