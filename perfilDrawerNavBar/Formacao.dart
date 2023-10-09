import 'package:flutter/material.dart';

class Formacao extends StatelessWidget {
  const Formacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: Text(
      'Formação: Gradação Marketing - Completo \n Sistemas para Internet - Cursando',
      style: TextStyle(
        color: Colors.pink,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
