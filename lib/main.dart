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
  double altura = 0;
  double peso = 0;
  bool onMostrar = false;
  List<Map<String, dynamic>> detalleIMC = [
    {
      "evaluacion": "Delgadez o bajo de Peso",
      "recomendacion":
          "Es importante consultar a un profesional de la salud para evaluar tu situación. Puede ser necesario ajustar tu dieta para asegurar una ingesta adecuada de nutrientes.",
      "imagen": "assets/delgadez_imagen.png"
    },
    {
      "evaluacion": "Normal o Peso saludable",
      "recomendacion":
          "¡Felicidades! Mantén un estilo de vida saludable con una dieta balanceada y ejercicio regular para mantener tu peso en un rango saludable.",
      "imagen": "assets/peso_saludable_imagen.png"
    },
    {
      "evaluacion": "Sobrepeso",
      "recomendacion":
          "Considera hacer cambios en tu dieta y aumentar la actividad física para alcanzar un peso saludable. Consulta a un profesional para obtener orientación personalizada.",
      "imagen": "assets/sobrepeso_imagen.png"
    },
    {
      "evaluacion": "Obesidad",
      "recomendacion":
          "Es importante buscar asesoramiento médico para desarrollar un plan de pérdida de peso seguro y efectivo. Se pueden recomendar cambios en la dieta y el ejercicio.",
      "imagen": "assets/obesidad_imagen.png"
    }
  ];
  double calculoIMC = 0;
  int resultadoIMC = 0;
  void Calcular() {
    onMostrar = true;
    calculoIMC = peso / (altura * altura);
    if (calculoIMC < 18.5) {
      resultadoIMC = 0;
    } else if (calculoIMC < 24.9) {
      resultadoIMC = 1;
    } else if (calculoIMC < 29.9) {
      resultadoIMC = 2;
    } else {
      resultadoIMC = 3;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Calcular IMC",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff3d55b7),
          centerTitle: true,
          elevation: 10,
          shadowColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text("Altura"),
            Text(
              "${altura.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 25),
            ),
            Slider(
                min: 0,
                max: 2.5,
                value: altura,
                onChanged: (value) {
                  altura = value;
                  setState(() {});
                }),
            Text("Peso"),
            Text(
              "${peso.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 25),
            ),
            Slider(
                min: 0,
                max: 200,
                value: peso,
                onChanged: (value) {
                  peso = value;
                  setState(() {});
                }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              color: Color(0xff1790f9),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Calcular();
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Visibility(
                visible: onMostrar,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "${calculoIMC.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        detalleIMC[resultadoIMC]["evaluacion"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        detalleIMC[resultadoIMC]["recomendacion"],
                        style: TextStyle(fontSize: 11),
                        textAlign: TextAlign.center,
                      ),
                      Image.asset(
                        detalleIMC[resultadoIMC]["imagen"],
                        height: 200,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
