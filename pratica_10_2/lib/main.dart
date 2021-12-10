import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resp = "";

  imc() {
    double peso = double.parse(this.pesoController.text);
    double altura = double.parse(this.alturaController.text);
    double result = peso / pow(altura, 2);
    String resp;

    if (result < 16)
      resp = 'magreza grave';
    else if (result < 17)
      resp = 'magreza moderada';
    else if (result < 18.5)
      resp = 'magreza leve';
    else if (result < 25)
      resp = 'saudável';
    else if (result < 30)
      resp = 'sobrepeso';
    else if (result < 35)
      resp = 'obesidade grau I';
    else if (result < 40)
      resp = 'obesidade grau II (severa)';
    else
      resp = 'obesidade grau III(mórbida)';

    this.resp = 'IMC: ' + result.toStringAsFixed(2) + '\nClassificação: $resp';
    return this.resp;
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Índice de Massa Corporal'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: pesoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => pesoController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o seu peso',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: alturaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => alturaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe a sua altura',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(imc());
              setState(imc);
            },
            child: Text(
              'OK',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Text(
            this.resp,
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
