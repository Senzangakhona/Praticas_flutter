import 'package:flutter/material.dart';
import 'package:pratica_12/segundaTela.dart';
import 'package:pratica_12/terceiraTela.dart';
import 'package:pratica_12/quartaTela.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (_) => PrimeiraTela(),
          '/segunda': (_) => SegundaTela(),
          '/terceira': (_) => TerceiraTela(),
          '/quarta': (_) => QuartaTela(),
        },
      ),
    );

class PrimeiraTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Tela'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              padding: EdgeInsets.all(40),
              margin: EdgeInsets.all(25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.pushNamed(context, '/segunda');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
