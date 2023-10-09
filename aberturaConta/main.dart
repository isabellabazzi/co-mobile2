import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountOpeningForm(),
      theme: ThemeData(primaryColor: Colors.pink),
    );
  }
}

class AccountOpeningForm extends StatefulWidget {
  @override
  _AccountOpeningFormState createState() => _AccountOpeningFormState();
}

class _AccountOpeningFormState extends State<AccountOpeningForm> {
  String? nome;
  TextEditingController idadeController = TextEditingController();
  String? sexo;
  String? escolaridade;
  double limiteDaConta = 500.0;
  String? nacionalidade;
  bool mostrarDados = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Solicitação de Conta Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText:
                          'Seu Nome'), 
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nome = value;
                  },
                ),
                TextFormField(
                  controller: idadeController,
                  decoration: InputDecoration(
                      labelText:
                          'Sua Idade'), 
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua idade';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText:
                          'Seu Sexo'),
                  items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sexo = value;
                    });
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText:
                          'Escolaridade'), 
                  items: [
                    'Ensino Fundamental',
                    'Ensino Médio',
                    'Graduação',
                    'Pós-Graduação'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      escolaridade = value;
                    });
                  },
                ),
                Slider(
                  value: limiteDaConta,
                  onChanged: (value) {
                    setState(() {
                      limiteDaConta = value;
                    });
                  },
                  min: 0,
                  max: 1000,
                  divisions: 100,
                  label: 'Limite da Conta: ${limiteDaConta.toStringAsFixed(2)}',
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText:
                          'Nacionalidade'), 
                  items: ['Brasileiro', 'Estrangeiro'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      nacionalidade = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        mostrarDados = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    primary:
                        Colors.pink, 
                  ),
                  child: Text(
                    'Enviar', 
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                if (mostrarDados)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Detalhes da Conta Bancária:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('Nome: $nome', style: TextStyle(fontSize: 16)),
                      Text('Idade: ${idadeController.text}',
                          style: TextStyle(fontSize: 16)),
                      Text('Sexo: $sexo', style: TextStyle(fontSize: 16)),
                      Text('Escolaridade: $escolaridade',
                          style: TextStyle(fontSize: 16)),
                      Text(
                          'Limite da Conta: ${limiteDaConta.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 16)),
                      Text('Nacionalidade: $nacionalidade',
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
