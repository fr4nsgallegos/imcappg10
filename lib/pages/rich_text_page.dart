import 'package:flutter/material.dart';

class RichTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  text: "Texto básico ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: "Richtext",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
