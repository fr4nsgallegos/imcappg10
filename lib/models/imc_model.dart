import 'package:flutter/material.dart';

class ImcModel {
  String titulo;
  String recomendacion;
  String pathImage;
  Color color;

  ImcModel({
    required this.titulo,
    required this.recomendacion,
    required this.pathImage,
    required this.color,
  });
}

List<ImcModel> imcList = [
  ImcModel(
    titulo: "Bajo peso",
    recomendacion: "Se debe alimentar con nutrientes necesarios",
    pathImage: "assets/images/bajopeso.svg",
    color: Colors.yellow,
  ),
  ImcModel(
      titulo: "Normal",
      recomendacion: "El IMC es normal, manten una dieta balanceada",
      pathImage: "assets/images/normal.svg",
      color: Colors.green),
  ImcModel(
      titulo: "Sobrepeso",
      recomendacion:
          "Debes salir a correr 1 o 2 veces a la semana y tomar agua.",
      pathImage: "assets/images/sobrepeso.svg",
      color: Colors.orange),
  ImcModel(
      titulo: "Obesidad",
      recomendacion:
          "Realizar dieta balanceada y hacer ejercicios 4 o 5 veces a la semana",
      pathImage: "assets/images/obesidad.svg",
      color: Colors.red),
];
