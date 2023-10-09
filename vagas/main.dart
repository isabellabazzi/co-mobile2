import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Vaga {
  final String nome;
  final double salario;
  final String descricao;
  final String contato;

  Vaga(this.nome, this.salario, this.descricao, this.contato);
}

class MyApp extends StatelessWidget {
  final List<Vaga> vagas = [
    Vaga(
        "Gerente de E-commerce",
        8000,
        "Estamos procurando um gerente de e-commerce para liderar nossa equipe, otimizar a experiência do cliente online e impulsionar as vendas através de estratégias digitais.",
        "isabella@gmail.com"),
    Vaga(
        "Especialista em Marketing Digital para E-commerce",
        6000,
        "Estamos em busca de um especialista em marketing digital focado em e-commerce para desenvolver campanhas online, aumentar a visibilidade da marca e impulsionar as conversões.",
        "isabella@gmail.com"),
    Vaga(
        "Analista de Customer Experience para E-commerce",
        5500,
        "Estamos contratando um analista de customer experience para monitorar a jornada do cliente, melhorar a satisfação do cliente e garantir uma experiência de compra online excepcional.",
        "isabella@gmail.com"),
    Vaga(
        "Especialista em Logística para E-commerce",
        5800,
        "Procuramos um especialista em logística para e-commerce para gerenciar o processo de entrega, otimizar o estoque e garantir uma cadeia de suprimentos eficiente.",
        "isabella@gmail.com"),
    Vaga(
        "Analista de Dados para E-commerce",
        6000,
        "Estamos em busca de um analista de dados para e-commerce para analisar padrões de compra, identificar oportunidades de crescimento e criar relatórios para aprimorar as estratégias de vendas online.",
        "isabella@gmail.com"),
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
      title: Text("Vagas"),
      centerTitle: true,
      backgroundColor: Colors.pink,
    );
  }

  _corpo() {
    return Container(
      child: ListView.builder(
        itemCount: vagas.length,
        itemBuilder: (context, index) {
          return _vagaCard(vagas[index]);
        },
      ),
    );
  }

  _vagaCard(Vaga vaga) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              vaga.nome,
              style: TextStyle(
                color: Colors.pink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Salário: \$R${vaga.salario.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Descrição: ${vaga.descricao}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Contato: ${vaga.contato}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
