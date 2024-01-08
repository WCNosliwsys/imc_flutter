import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: IMC()));
}

class IMC extends StatefulWidget {
  const IMC({super.key});

  @override
  State<IMC> createState() => _IMCState();
}

class _IMCState extends State<IMC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("Altura"),
            Text("174.0"),
            Slider(value: 10, onChanged: (value) {}),
            Text("Peso"),
            Text("61.0"),
            Slider(value: 10, onChanged: (value) {}),
            ElevatedButton(onPressed: () {}, child: Text("Calcular")),
            Text("20.1"),
            Text("Normal"),
            Text("Debes de comer más"),
          ],
        ));
  }
}
