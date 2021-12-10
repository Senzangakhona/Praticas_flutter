import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrimeiraRota(),
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.amber,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text("Ana"),
                accountEmail: Text("ana@ana.com.br"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "A",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.video_collection),
                title: Text("Rota 02"),
                subtitle: Text("Siga para a Rota 02."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print('Ir para a Rota 02');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RotaGenerica('Segunda Rota', Colors.blue[900]),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.analytics),
                title: Text("Rota 03"),
                subtitle: Text("Siga para a Rota 03"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RotaGenerica('Terceira Rota', Colors.purple[900]),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Rota 01"),
                subtitle: Text("Voltar para a Rota 01"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print('Voltar para a Rota 01.');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: const Text('Corpo'),
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';

  final String titulo;
  final Color? cor;

  RotaGenerica(this.titulo, this.cor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.titulo}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${this.titulo}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            Container(
              color: this.cor,
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: ElevatedButton(
                  child: Text('Voltar para a primeira rota.'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
