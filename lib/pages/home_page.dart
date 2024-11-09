import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x = 0;
  double textSize = 10;
  bool? isChecked = true;
  bool? isUnderline = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Style Editor"),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer",
                  style: TextStyle(
                    fontSize: textSize,
                    // decoration: TextDecoration.overline, //linea arriba
                    // decoration: TextDecoration.underline, //linea abajo, subrayado
                    // decoration:
                    // TextDecoration.lineThrough, //línea al centro, tachado

                    // decoration: isUnderline == true
                    //     ? TextDecoration.underline
                    //     : TextDecoration.none,

                    decoration: TextDecoration.combine(
                      [
                        TextDecoration.lineThrough,
                        TextDecoration.underline,
                        TextDecoration.overline,
                      ],
                    ),
                  ),
                ),
                Divider(),
                Text("Tamaño del texto Slide"),
                Slider(
                  max: 30,
                  min: 5,
                  value: textSize,
                  activeColor: Colors.red,
                  inactiveColor: Colors.green,
                  thumbColor: Colors.yellow,
                  onChanged: (double mandarina) {
                    textSize = mandarina;
                    print(mandarina);
                    setState(() {});
                  },
                ),
                CheckboxListTile(
                  title: Text("Is underline"),
                  value: isUnderline,
                  activeColor: Colors.orange,
                  checkColor: Colors.green,
                  secondary: Icon(Icons.star),
                  onChanged: (juanito) {
                    isUnderline = juanito;
                    print(isUnderline);
                    setState(() {});
                  },
                ),
                Text("isUnderline: $isUnderline")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
