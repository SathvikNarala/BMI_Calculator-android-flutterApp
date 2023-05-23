import "package:flutter/material.dart";
import "logic.dart";

class BMI extends State{

  final _height = TextEditingController();
  final _weight = TextEditingController();
  Data _bmi = Data();

  @override
  void dispose(){
    _height.dispose();
    _weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Center(
            child: Text("BMI Calculator"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Height (in cms)',
                    labelStyle: TextStyle(
                      fontSize: 20
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start
                  ),
                  cursorHeight: 25.0,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: _height,
                ),

                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Weight (in kgs)',
                    labelStyle: TextStyle(
                      fontSize: 20
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start
                  ),
                  cursorHeight: 25.0,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: _weight,
                ),

                ElevatedButton(
                  onPressed: (){
                    setState(()=> _bmi = Logic.compute(
                      height: double.parse(_height.text),
                      weight: double.parse(_weight.text)
                    ));
                  }, 
                  child: const Text('Calculate',
                    textScaleFactor: 1.5,
                  )
                ),
                
                Text('${_bmi.value.toStringAsFixed(1)} BMI',
                  textScaleFactor: 4.5,
                  style: const TextStyle(
                    color: Colors.red
                  ),
                ),

                Text(_bmi.msg,
                  textScaleFactor: 3.5,
                  style: const TextStyle(
                    color: Colors.blue
                  ),
                )

              ],
            ),
          )
        ),
      )
    );
  }
}

