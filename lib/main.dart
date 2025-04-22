import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('IMC')),
      body: IMCApp(),
    ),
  ));
}

class IMCApp extends StatefulWidget {
  @override
  _IMCAppState createState() => _IMCAppState();
}

class _IMCAppState extends State<IMCApp> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  String mensagem = '';
  Color corMensagem = Colors.black; // cor padrão

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: pesoController,
          decoration: InputDecoration(labelText: 'Peso'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: alturaController,
          decoration: InputDecoration(labelText: 'Altura'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            double peso = double.parse(pesoController.text);
            double altura = double.parse(alturaController.text);
            double imc = peso / (altura * altura);

            String status = '';
            Color cor = Colors.black;

            if (imc < 18.5) {
              status = 'Abaixo do peso';
              cor = Colors.orange;
            } else if (imc < 25) {
              status = 'Peso ideal';
              cor = Colors.green;
            } else {
              status = 'Acima do peso';
              cor = Colors.red;
            }

            setState(() {
              mensagem = 'IMC: ${imc.toStringAsFixed(2)} - $status';
              corMensagem = cor;
            });
          },
          child: Text('Calcular'),
        ),
        ElevatedButton(
          onPressed: () {
            pesoController.clear();
            alturaController.clear();
            setState(() {
              mensagem = '';
              corMensagem = Colors.black;
            });
          },
          child: Text('Limpar'),
        ),
        Text(
          mensagem,
          style: TextStyle(color: corMensagem),
        ),
      ],
    );
  }
}
