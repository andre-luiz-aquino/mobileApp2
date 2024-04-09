import 'package:flutter/material.dart';
import 'dart:math';

class JogoPPT extends StatefulWidget {
  const JogoPPT({super.key});

  @override
  State<JogoPPT> createState() => _JogoPPTState();
}

class _JogoPPTState extends State<JogoPPT> {
  String _imgUserPlayer = "imagens/indefinido.png";
  String _imgAppPlayer = "imagens/indefinido.png";

  int _userPoints = 0;
  int _appPoints = 0;
  int _tiePoints = 0;

  Color _bordaUserColor = Colors.transparent;
  Color _bordaAppColor = Colors.transparent;

  void _terminarJogada(String escolhaUser, String escolhaApp) {
    var resultado = "indefinido";

    switch (escolhaUser) {
      case "pedra":
        if (escolhaApp == "papel") {
          resultado = "app";
        } else if (escolhaApp == "tesoura") {
          resultado = "user";
        } else {
          resultado = "empate";
        }
        break;
      case "papel":
        if (escolhaApp == "tesoura") {
          resultado = "app";
        } else if (escolhaApp == "pedra") {
          resultado = "user";
        } else {
          resultado = "empate";
        }
        break;
      case "tesoura":
        if (escolhaApp == "pedra") {
          resultado = "app";
        } else if (escolhaApp == "papel") {
          resultado = "user";
        } else {
          resultado = "empate";
        }
        break;
    }
    setState(() {
      if (resultado == "user") {
        _userPoints++;

        _bordaUserColor = Colors.green;
        _bordaAppColor = Colors.transparent;
      } else if (resultado == "app") {
        _appPoints++;
        _bordaUserColor = Colors.transparent;
        _bordaAppColor = Colors.green;
      } else {
        _tiePoints++;
        _bordaUserColor = Colors.orange;
        _bordaAppColor = Colors.orange;
      }
    });
  }

  String _obtemEscolhaApp() {
    var opcoes = ['pedra', 'papel', 'tesoura'];
    String vlrEscolhido = opcoes[Random().nextInt(3)];

    return vlrEscolhido;
  }

  // ignore: non_constant_identifier_names
  void _jogadaInicial(String opcao) {
    setState(() {
      _imgUserPlayer = "imagens/$opcao.png";
    });

    String escolhaApp = _obtemEscolhaApp();

    setState(() {
      _imgAppPlayer = "imagens/$escolhaApp.png";
    });

    _terminarJogada(opcao, escolhaApp);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meu App Pedra Papel Tesoura"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Disputa:",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: _bordaUserColor, width: 4),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  height: 120,
                  child: Image.asset(_imgUserPlayer),
                ),
                const Text("    Vs    "),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: _bordaAppColor, width: 4),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  height: 120,
                  child: Image.asset(_imgAppPlayer),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Placar:",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Voce "),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(35),
                      child: Text(
                        "$_userPoints",
                        style: const TextStyle(fontSize: 26),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("Empate "),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(35),
                      child: Text("$_tiePoints",
                          style: const TextStyle(fontSize: 26)),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("App "),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(35),
                      child: Text("$_appPoints",
                          style: const TextStyle(fontSize: 26)),
                    )
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Opções:",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _jogadaInicial("pedra"),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('imagens/pedra.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () => _jogadaInicial("papel"),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('imagens/papel.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () => _jogadaInicial("tesoura"),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset('imagens/tesoura.png'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
