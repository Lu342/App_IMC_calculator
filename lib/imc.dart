import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Imc extends StatefulWidget {
  @override
  _ImcState createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  String _mensagem = "Resultado";
  int aux = 0;

  void calculoImc() {
    setState(() {
      double altura = double.parse(_altura.text);
      double peso = double.parse(_peso.text);

      double alturas = (altura * altura);
      double imc = peso / alturas;

      if (imc < 18.5) {
        _mensagem = "Abaixo do peso";
      } else if (imc >= 18.5 && imc <= 24.9) {
        _mensagem = "Peso Normal";
      } else if (imc >= 25.0 && imc <= 29.9) {
        _mensagem = "Sobrepeso";
      } else if (imc >= 30.0 && imc <= 39.9) {
        _mensagem = "Obesidade";
      } else if (imc > 40.0) {
        _mensagem = "Obesidade Grave";
      }
    });
  }

  TextEditingController _peso = TextEditingController();

  TextEditingController _altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: EdgeInsets.all(00.2),
        padding: EdgeInsets.all(10),
        color: Colors.black,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(00.2),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: 65)),
              Text(
                "IMC",
                style: TextStyle(fontSize: 30, decoration: TextDecoration.none),
              ),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _peso,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Peso',
                    helperText: "Exemplo peso aceito 70.50 ",
                    helperStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
              Divider(
                color: Colors.transparent,
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                controller: _altura,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    hintText: 'Altura',
                    helperStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Valor inválido, campo vazio !!!";
                  } else if (double.parse(value) <= 0 ||
                      double.parse(value) > 3.00) {
                    return "Valor inválido, altura deve ser real !!!";
                  }
                  return value;
                },
                onSaved: (value) {
                  _altura.text = value!;
                },
              ),
              // TextField(
              //   keyboardType: TextInputType.numberWithOptions(decimal: true),
              //   controller: _altura,
              //   style: TextStyle(fontSize: 20),
              //   decoration: InputDecoration(
              //       hintText: 'Altura',
              //       helperText: "Exemplo altura aceita 1,75 ",
              //       helperStyle: TextStyle(color: Colors.grey),
              //       border: OutlineInputBorder()),
              // ),
              Divider(
                color: Colors.transparent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.green,
                      ),
                      onPressed: () {
                        calculoImc();
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Text("Calcular")),
                  SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.green,
                        shadowColor: Colors.green,
                      ),
                      onPressed: () {
                        _altura.clear();
                        _peso.clear();
                        setState(() {
                          _mensagem = "Resultado";
                        });
                      },
                      child: Text("Zerar Resultado")),
                ],
              ),
              Divider(
                color: Colors.transparent,
              ),
              SizedBox(
                height: 70,
                width: 350,
                child: Container(
                  color: Colors.green[300],
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "$_mensagem ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
