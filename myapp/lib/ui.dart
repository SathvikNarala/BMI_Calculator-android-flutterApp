import "package:flutter/material.dart";
import "logic.dart";


class App extends StatefulWidget{
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App>{
  
  final _key = GlobalKey<FormState>();

  final _height = TextEditingController();
  final _weight = TextEditingController();
  Response _bmi = Response();

  String? _validate({String? value}){
    var pattern = RegExp(r"^[0-9]+(.[0-9]+)?$");
    
    if(value == null || value.isEmpty || !pattern.hasMatch(value)) return 'Numeric Value Required'; 
    
    return null;
  }

  @override
  void dispose(){
    _height.dispose();
    _weight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _key,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Height (in cms)',
                labelStyle: TextStyle(
                  fontSize: 20
                ),
              ),
              validator: ((val) => _validate(value: val)),
              cursorHeight: 25.0,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: _height,
            ),

            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Weight (in kgs)',
                labelStyle: TextStyle(
                  fontSize: 20
                ),
                
              ),
              validator: ((val) => _validate(value: val)),
              cursorHeight: 25.0,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              controller: _weight,
            ),

            ElevatedButton(
              onPressed: (){
                if(_key.currentState!.validate()){
                  setState((){  
                    _bmi = Logic.compute(
                      req: Request(
                        height: double.parse(_height.text), 
                        weight: double.parse(_weight.text)
                      )
                    );
                  });
                }
              }, 
              child: const Text('Calculate',
                textScaleFactor: 1.5,
              )
            ),
            
            Text('${_bmi.value} BMI',
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
        ),
      )
    );
  }
}

