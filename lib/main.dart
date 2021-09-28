import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const TelaInicial(title: 'Realize o Cadastro do Aluno'),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController _controladorname = TextEditingController();
  final TextEditingController _controladoridade = TextEditingController();
  final TextEditingController _controladorloc = TextEditingController();
  getTexto(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Telaresultado(
                  nome: _controladorname.text,
                  idade: _controladoridade.text,
                  loc: _controladorloc.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controladorname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: Colors.white,
                  labelText: 'Nome',
                ),
              ),
            ),
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controladoridade,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: Colors.white,
                  labelText: 'Idade',
                ),
              ),
            ),
            Container(
              width: 280,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _controladorloc,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusColor: Colors.white,
                  labelText: 'Localizacao',
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  onPressed: () => getTexto(context),
                  child: const Text(
                    "Cadastrar Aluno",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Telaresultado extends StatelessWidget {
  final nome;
  final idade;
  final loc;

  const Telaresultado({Key? key, @required this.nome, this.idade, this.loc})
      : super(key: key);

  voltar(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Nome = ' + nome, style: const TextStyle(fontSize: 20.0)),
              Text('Idade = ' + idade, style: const TextStyle(fontSize: 20.0)),
              Text('Localizacao = ' + loc,
                  style: const TextStyle(fontSize: 20.0)),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    onPressed: () => voltar(context),
                    child: const Text(
                      "Voltar",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
