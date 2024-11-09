import 'package:flutter/material.dart';

class imcPage extends StatefulWidget {
  @override
  State<imcPage> createState() => _imcPageState();
}

class _imcPageState extends State<imcPage> {
  double peso = 10;
  double altura = 0.5;
  double imcResult = 0;

  // double roundedOneDecimal(double number) {
  //   return number.parse(value)
  // }

  Widget buildSliderIMC(String title, bool isAltura) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          "${isAltura ? altura : peso} ${isAltura ? 'm.' : 'kg.'}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        Slider(
          min: isAltura ? 0.5 : 10,
          max: isAltura ? 2.5 : 130,
          value: isAltura ? altura : peso,
          onChanged: (value) {
            if (isAltura) {
              altura = double.parse(value.toStringAsFixed(2));
            } else {
              peso = double.parse(value.toStringAsFixed(2));
            }
            setState(() {});
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4157B2),
          title: Text(
            "Calcular IMC",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildSliderIMC("Altura", true),
              buildSliderIMC("Peso", false),
              SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, //Colors del fondo
                    foregroundColor: Colors.white, //Color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), //Reducir redondez de los bordes
                    shadowColor: Colors.red, //color de la sombra
                    elevation: 3, //altura de la sombra
                  ),
                  child: Text("Calcular"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
