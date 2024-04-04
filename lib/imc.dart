import 'package:flutter/material.dart';
import 'dart:math';

class imc extends StatelessWidget {
  const imc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const imc(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _textoInfo = "Informe seus dados";

  void _limpar_Tela(){
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _textoInfo = "Informe seus dados";
    });
  }
  void _calcular_IMC(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = peso / pow( (altura/100), 2 );

      if(imc < 16.5){
        _textoInfo = "Desnutrido (${imc})";
      }
      else if(imc <=18.5){
        _textoInfo = "Abaixo do peso (${imc})";
      }
      else if(imc <=24.5){
        _textoInfo = "Peso ideal (${imc})";
      }
      else if (imc <= 29.9){
        _textoInfo = "Sobrepeso (${imc})";
      }
      else if (imc <= 34.9){
        _textoInfo = "Obesidade Grau I (${imc})";
      }
      else if (imc <= 39.9){
        _textoInfo = "Obesidade Grau II (${imc})";
      }
      else{
        _textoInfo = "Obesidade Grau III (${imc})";
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora, IMC"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
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
                color: Colors.blueGrey
            ), //Icon

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "PESO (KG)",
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
              //InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: pesoController,
            ), //TextField Peso

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.blueGrey),
              ),
              //InputDecoration
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.0),
              controller: alturaController,
            ), //TextField Altura

            //Botão para executar o calculo IMC]
            Padding(

              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _calcular_IMC,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.blueGrey),
                      ),
                      child: const Text("Calcular")
                  ) //ElevatedButton
              ), //SizedBox
            ),
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