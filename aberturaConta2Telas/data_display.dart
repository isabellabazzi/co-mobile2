import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.pink),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo do número aleatório"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  void _descobrir() {
    setState(() {
      resultado = Random().nextInt(11);
    });
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _foto(),
          SizedBox(height: 5),
          _campo(),
          SizedBox(height: 50),
          _button(),
          SizedBox(height: 30),
          _resultado(),
        ],
      ),
    );
  }

  Widget _foto() {
    return Center(
      child: Image.network(
        'https://dezmilnomes.files.wordpress.com/2017/05/cerridwen-oraculo-da-deusa-hrana-janto.png',
        height: 280,
        width: 280,
      ),
    );
  }

  Widget _campo() {
    return Text(
      "Pense em um número de 0 a 10",
      style: TextStyle(color: Colors.purple, fontSize: 25),
    );
  }

  Widget _resultado() {
    return Text(
      resultado.toString(),
      style: TextStyle(color: Colors.purple, fontSize: 25),
    );
  }

  Widget _button() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.pink,
      ),
      onPressed: _descobrir,
      child: Text(
        "Descobrir",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}