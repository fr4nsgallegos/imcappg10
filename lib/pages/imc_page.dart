import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
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

  Widget buildResultIMC() {
    return Column(
      children: [
        Text(
          "20.1 ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        Text(
          "Normal",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Sigue tu actividad física, sigue comiendo saludable vvas por buen camino.",
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width / 1.5,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/normal.png"),
            ),
          ),
        ),

        // Image.asset(
        //   "assets/images/normal.png",
        //   width: MediaQuery.of(context).size.width / 1.5,
        // ),
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
                    // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  ),
                  child: Text("Calcular"),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              buildResultIMC(),
            ],
          ),
        ),
      ),
    );
  }
}
