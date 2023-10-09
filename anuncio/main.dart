import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> imagens = [
    'serum.jpg',
    'idole.jpg',
    'libre.png',
    'joico.jpg',
    'blush.png',
  ];

  final List<String> textos = [
    'La Roche-Posay Effaclar Ultra Concentrado - Sérum Antiacne 15ml',
    'Idôle Lancôme Eau de Parfum - Perfume Feminino 100ml',
    'Libre Yves Saint Lauren Le Parfum - Perfume Feminino 50ml',
    'Joico Moisture Recovery Treatment Balm Smart Release - Máscara Capilar 250ml',
    'Mariana Saad by Océane Stick Coral Kiss - Blush em Bastão 14g',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _titulo() {
    return AppBar(
      title: Text("Beleza na Web"),
      centerTitle: true,
      backgroundColor: Colors.pink,
    );
  }

  _corpo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _carrosel(),
          ],
        ),
      ),
    );
  }

  _carrosel() {
    return Container(
      margin: EdgeInsets.only(bottom: 80),
      height: 500,
      child: PageView.builder(
        itemCount: imagens.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 30), // Espaçamento entre a imagem e o AppBar
              _foto(imagens[index]),
              _texto(textos[index]),
            ],
          );
        },
      ),
    );
  }

  _foto(String nomeFoto) {
    return Image.asset(
      "lib/imagens/$nomeFoto",
      height: 260,
      width: 260,
      fit: BoxFit.contain,
    );
  }

  _texto(String texto) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.pink,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
