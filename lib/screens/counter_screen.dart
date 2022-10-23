import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //Variable, propiedad
  int counter = 15;

  //Metodos
  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontsize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Número de clicks',
              style: fontsize30,
            ),
            Text(
              '$counter', //Convertir a string
              style: fontsize30,
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
        //Mandando la referencia a la funcion, no se está ejecutando por eso no lleva ()
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  //Valor que va a recibir , esto va a ser una función
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    //Se inicializan las funciones
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_plus_1_outlined),
            onPressed: () => increaseFn()),
        FloatingActionButton(
            child: const Icon(Icons.restart_alt),
            //Con una función anonima
            onPressed: () {
              resetFn();
            }),
        FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_outlined),
            onPressed: () => decreaseFn()),
      ],
    );
  }
}
