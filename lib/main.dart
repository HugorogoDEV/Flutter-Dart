import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? sinalOpercao;
  int _counter = 0, posicao = 0, expoente = 0, resultado = 0;
  var list = [0, 0];

  void recebimento(int x) {
    resultado = resultado * 10 + x;
    _incrementCounter(resultado);
  }

  void _zero() {
    setState(() {
      resultado = 0;
      setState(() {
        _counter = 0;
      });
    });
  }

  void atribui() {
    list[posicao] = _counter;
  }

  void sinal(String sinal) {
    list[posicao] = _counter;
    if (posicao == 0) {
      posicao++;
    }
    sinalOpercao = sinal;
  }

  void operacao() {
    switch (sinalOpercao) {
      case ('-'):
        {
          _incrementCounter(list[0] - list[1]);

          break;
        }
      case ('+'):
        {
          _incrementCounter(list[0] + list[1]);
          break;
        }
      case ('/'):
        {
          _incrementCounter(list[0] ~/ list[1]);
          break;
        }
      case ('*'):
        {
          _incrementCounter(list[0] * list[1]);
          break;
        }
    }
    posicao = 0;
  }

  void _incrementCounter(int x) {
    setState(() {
      _counter = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Padding(padding: EdgeInsets.all(16)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => recebimento(1), child: const Text('1')),
                  ElevatedButton(
                      onPressed: () => recebimento(3), child: const Text('3')),
                  ElevatedButton(
                      onPressed: () => recebimento(5), child: const Text('5')),
                  ElevatedButton(
                      onPressed: () => recebimento(7), child: const Text('7')),
                  ElevatedButton(
                      onPressed: () => recebimento(9), child: const Text('9')),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => recebimento(2), child: const Text('2')),
                  ElevatedButton(
                      onPressed: () => recebimento(4), child: const Text('4')),
                  ElevatedButton(
                      onPressed: () => recebimento(6), child: const Text('6')),
                  ElevatedButton(
                      onPressed: () => recebimento(8), child: const Text('8')),
                  ElevatedButton(
                      onPressed: () => recebimento(0), child: const Text('0')),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => {
                            sinal('-'),
                            _zero(),
                          },
                      child: const Text('-')),
                  ElevatedButton(
                      onPressed: () => {
                            sinal('+'),
                            _zero(),
                          },
                      child: const Text('+')),
                  ElevatedButton(
                      onPressed: () => {
                            sinal('/'),
                            _zero(),
                          },
                      child: const Text('/')),
                  ElevatedButton(
                      onPressed: () => {
                            sinal('*'),
                            _zero(),
                          },
                      child: const Text('*')),
                  ElevatedButton(
                      onPressed: () => {atribui(), operacao()},
                      child: const Text('=')),
                ],
              )
            ])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _zero(),
        tooltip: 'return',
        child: const Icon(Icons.exposure_zero),
      ),
    );
  }
}
