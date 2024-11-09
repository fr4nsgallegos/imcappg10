import 'package:flutter/material.dart';

class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //INTRO RICH TEXT
              RichText(
                text: TextSpan(
                  text: "Texto básico ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: "Richtext ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 45,
                        shadows: [
                          Shadow(
                            color: Colors.red,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: "otro texto",
                      style: TextStyle(color: Colors.orange, fontSize: 25),
                    ),
                  ],
                ),
              ),

              //SIMULANDO SUBINDICES
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.cyan, fontSize: 50),
                  children: [
                    TextSpan(text: "H"),
                    TextSpan(
                      text: "2",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(text: "O"),
                  ],
                ),
              ),

              //TEXTO CON IMÁGENES
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.orange),
                  children: [
                    TextSpan(text: "Texto con imagen: "),
                    WidgetSpan(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: " Más texto",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
