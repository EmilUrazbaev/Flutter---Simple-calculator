import 'package:flutter/material.dart';

enum Operations { add, subtract, divide, multiply }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  num a;
  num b;
  Operations operation;
  TextEditingController controller = TextEditingController();

  void digitPressed(digit) {
    controller.text = controller.text + digit;
  }

  void dotPressed() {
    if (controller.text.contains('.')) {
      return;
    } else {
      controller.text = controller.text + '.';
    }
  }

  void operationPressed(oper) {
    a = double.parse(controller.text);
    controller.text = '';
    operation = oper;
  }

  void equalsPressed() {
    b = double.parse(controller.text);
    switch (operation) {
      case Operations.divide:
        {
          a = a / b;
        }
        break;
      case Operations.multiply:
        {
          a = a * b;
        }
        break;
      case Operations.subtract:
        {
          a = a - b;
        }
        break;
      case Operations.add:
        {
          a = a + b;
        }
        break;
    }
    controller.text = a.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
              controller: controller,
              textAlign: TextAlign.end,
              readOnly: true,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DigitButton(7, digitPressed),
                    DigitButton(8, digitPressed),
                    DigitButton(9, digitPressed),
                    RaisedButton(
                        child: Text('÷'),
                        onPressed: () {
                          operationPressed(Operations.divide);
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DigitButton(4, digitPressed),
                    DigitButton(5, digitPressed),
                    DigitButton(6, digitPressed),
                    RaisedButton(
                        child: Text('×'),
                        onPressed: () {
                          operationPressed(Operations.multiply);
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DigitButton(1, digitPressed),
                    DigitButton(2, digitPressed),
                    DigitButton(3, digitPressed),
                    RaisedButton(
                        child: Text('-'),
                        onPressed: () {
                          operationPressed(Operations.subtract);
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DigitButton(0, digitPressed),
                    RaisedButton(
                        child: Text('.'),
                        onPressed: () {
                          dotPressed();
                        }),
                    RaisedButton(
                        child: Text('='),
                        onPressed: () {
                          equalsPressed();
                        }),
                    RaisedButton(
                        child: Text('+'),
                        onPressed: () {
                          operationPressed(Operations.add);
                        })
                  ],
                ),
                RaisedButton(
                    child: Text('C'),
                    onPressed: () {
                      controller.text = '';
                    })
              ],
            )
          ],
        ));
  }
}

class DigitButton extends StatelessWidget {
  final digit;
  final function;
  DigitButton(this.digit, this.function);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(digit.toString()),
        onPressed: () {
          function(digit.toString());
        });
  }
}
