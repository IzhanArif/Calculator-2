import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget calcbtns(String btnval) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            result = result + btnval;
          });
        },
        child: Text(btnval,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.white,
            )),
      ),
    );
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    result,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ))),
          Row(
            children: [
              calcbtns("9"),
              calcbtns("8"),
              calcbtns("7"),
              calcbtns("+"),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              calcbtns("6"),
              calcbtns("5"),
              calcbtns("4"),
              calcbtns("-"),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              calcbtns("3"),
              calcbtns("2"),
              calcbtns("1"),
              calcbtns("*"),
            ],
          ),
          const SizedBox(height: 35),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: clear,
                    child: const Text(
                      "C",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )),
              ),
              calcbtns("0"),
              Expanded(
                child: OutlinedButton(
                    onPressed: output,
                    child: const Text(
                      "=",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )),
              ),
              calcbtns("/"),
            ],
          ),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
