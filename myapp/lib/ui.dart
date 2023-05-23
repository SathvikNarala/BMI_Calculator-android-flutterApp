import "package:flutter/material.dart";
import "logic.dart";

class BMI extends State{

  final _height = TextEditingController();
  final _weight = TextEditingController();
  double _bmi = 0.0;

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
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(
                  width: 400,
                  height: 400
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        hintText: "Height (in cms)"
                      ),
                      textAlign: TextAlign.center,
                      cursorHeight: 22.0,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      controller: _height,
                    ),

                    TextField(
                      decoration: const InputDecoration(
                        hintText: "Weight (in kgs)"
                      ),
                      textAlign: TextAlign.center,
                      cursorHeight: 22.0,
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
                      child: const Text('Calculate')
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(_bmi.toStringAsFixed(1),
                      textScaleFactor: 5.0,
                      style: const TextStyle(
                        color: Colors.red
                      ),
                    ),

                    const Text('BMI',
                      textScaleFactor: 3.0,
                      style: TextStyle(
                        color: Colors.blue
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}

