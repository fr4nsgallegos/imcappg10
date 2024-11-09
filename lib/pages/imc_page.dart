import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imcappg10/models/imc_model.dart';

class ImcPage extends StatefulWidget {
  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  double peso = 10;
  double altura = 0.5;
  double imcResult = 0;
  ImcModel? selectedImcModel;

  void seleccionImcModel() {
    if (imcResult > 0 && imcResult < 18.5) {
      selectedImcModel = imcList[0];
    } else if (imcResult >= 18.5 && imcResult <= 24.9) {
      selectedImcModel = imcList[1];
    } else if (imcResult >= 25 && imcResult <= 29.9) {
      selectedImcModel = imcList[2];
    } else {
      selectedImcModel = imcList[3];
    }
  }

  double roundedDecimal(double number) {
    return double.parse(number.toStringAsFixed(2));
  }

  void calcularIMCvoid() {
    imcResult = roundedDecimal((peso / (altura * altura)));
    print(imcResult);
  }

  double calcularIMCdouble() {
    return roundedDecimal((peso / (altura * altura)));
  }

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

  Widget buildResultIMCWidget(double valor, ImcModel imcModel) {
    return Column(
      children: [
        Text(
          valor.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        Text(
          imcModel.titulo,
          style: TextStyle(fontSize: 20),
        ),
        Text(
          imcModel.recomendacion,
          textAlign: TextAlign.center,
        ),
        Container(
          margin: EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width / 1.5,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            // image: DecorationImage(
            //   image: AssetImage("assets/images/normal.png"),
            // ),
          ),
          child: SvgPicture.asset(
            "assets/images/obesidad.svg",
            // color: Colors.yellow,
            colorFilter: ColorFilter.mode(
              Colors.green,
              BlendMode.color,
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
                  onPressed: () {
                    // calcularIMCvoid();
                    imcResult = calcularIMCdouble();
                    seleccionImcModel();

                    setState(() {});
                    print(imcResult);
                  },
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
              selectedImcModel == null
                  ? Text("Realiza el calculo para ver el resultado")
                  : buildResultIMCWidget(imcResult, selectedImcModel!),
            ],
          ),
        ),
      ),
    );
  }
}
