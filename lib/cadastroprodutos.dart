import 'package:flutter/material.dart';
import 'dart:math';

class cadastroprodutos extends StatelessWidget {
  const cadastroprodutos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const cadastroprodutos(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  TextEditingController produtoController = new TextEditingController();
  TextEditingController precoController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_Tela(){
    produtoController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }
  void _Cadastrar(){
    String produtos = produtoController.text;
    String preco = precoController.text;
    produtoController.text = "";
    precoController.text = "";
    setState(() {
      _textoInfo = "Cadastrado com sucesso!";
    });

    if (produtos.isEmpty){
      _textoInfo = "Cadastro incompleto!";
    }
    else if(preco.isEmpty){
      _textoInfo = "Cadastro incompleta!";
    }
    else{
      _textoInfo = "Sem informações!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Usuário"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(onPressed: _limpar_Tela, icon: Icon(Icons.refresh))
        ],

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            const Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.black
            ), //Icon

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Produto",
                labelStyle: TextStyle(color: Colors.black),
              ),
              //InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: produtoController,
            ), //TextField Usuario

            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.black),
              ),
              //InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: precoController,
            ), //TextField senha

            //Botão para executar o cadastramento]
            Padding(

              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _Cadastrar,

                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey),
                      ),
                      child: const Text("Cadastrar")

                  )
                //ElevatedButton
              ), //SizedBox
            ), //Padding

            Text(
              _textoInfo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0
              ),
            )
          ],
        ),
      ),
    );
  }
}
