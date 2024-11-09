import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double textSize = 10;
  double red = 0, green = 0, blue = 0, opacity = 1.0;
  bool isUnderline = false;
  bool isOverline = false;
  bool isLineThrough = false;

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
                  "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor desconocido usó una galería de textos y los mezcló de tal manera que logró hacer.",
                  style: TextStyle(
                    fontSize: textSize,
                    color: Color.fromRGBO(
                        red.toInt(), green.toInt(), blue.toInt(), opacity),
                    decoration: TextDecoration.combine([
                      if (isUnderline) TextDecoration.underline,
                      if (isOverline) TextDecoration.overline,
                      if (isLineThrough) TextDecoration.lineThrough,
                    ]),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Divider(),
                Text("Tamaño del texto"),
                Slider(
                  max: 30,
                  min: 5,
                  value: textSize,
                  activeColor: Colors.red,
                  inactiveColor: Colors.green,
                  thumbColor: Colors.yellow,
                  onChanged: (double newSize) {
                    setState(() {
                      textSize = newSize;
                    });
                  },
                ),
                Divider(),
                Text("Rojo"),
                Slider(
                  max: 255,
                  min: 0,
                  value: red,
                  activeColor: Colors.red,
                  onChanged: (double value) {
                    setState(() {
                      red = value;
                    });
                  },
                ),
                Text("Verde"),
                Slider(
                  max: 255,
                  min: 0,
                  value: green,
                  activeColor: Colors.green,
                  onChanged: (double value) {
                    setState(() {
                      green = value;
                    });
                  },
                ),
                Text("Azul"),
                Slider(
                  max: 255,
                  min: 0,
                  value: blue,
                  activeColor: Colors.blue,
                  onChanged: (double value) {
                    setState(() {
                      blue = value;
                    });
                  },
                ),
                Text("Opacidad del texto"),
                Slider(
                  max: 1,
                  min: 0,
                  value: opacity,
                  activeColor: Colors.grey,
                  onChanged: (double value) {
                    setState(() {
                      opacity = value;
                    });
                  },
                ),
                Divider(),
                CheckboxListTile(
                  title: Text("Subrayado"),
                  value: isUnderline,
                  onChanged: (bool? value) {
                    setState(() {
                      isUnderline = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Línea arriba"),
                  value: isOverline,
                  onChanged: (bool? value) {
                    setState(() {
                      isOverline = value ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Tachado"),
                  value: isLineThrough,
                  onChanged: (bool? value) {
                    setState(() {
                      isLineThrough = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
