import 'package:flutter/material.dart';
import 'imc.dart';
import 'contador.dart';
import 'cadastroprodutos.dart';
import 'cadastrousuario.dart';


class Principal extends StatefulWidget {
  const Principal({super.key});
  @override
  State<Principal> createState()=> _PrincipalState();
}

class _PrincipalState extends State<Principal>{

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("MENU"),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.add_business_sharp,
                size: 120.0,
                color: Colors.deepOrangeAccent,
              ),
              Text(
                "Aplicação Principal",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
              ),
              Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                        child: const Text("IMC"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const imc()),
                          );
                        }),
                    ElevatedButton(
                        child: const Text("Contador"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const contador()),
                          );
                        }),
                    ElevatedButton(
                        child: const Text("Cadastro Usuario"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const cadastrousuario()),
                          );
                        }),
                    ElevatedButton(
                        child: const Text("Cadastro de produtos"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const cadastroprodutos()),
                          );
                        }),
                  ]),
            ],
          ),
        ), // Botão para executar o calculo do IMC,
      );
    }
  }

