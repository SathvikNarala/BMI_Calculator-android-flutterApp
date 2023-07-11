import 'package:myapp/logic.dart';
import 'package:test/test.dart';

void main(){
  test('BMI logic test', (){
    expect(Logic.compute(req: Request(height: 180, weight: 65)), Response(value: '20.1', msg: 'Healthy'));
    
    expect(Logic.compute(req: Request(height: 180, weight: 0)), Response(value: '0.0', msg: 'UnderWeight'));

    expect(Logic.compute(req: Request(height: 0, weight: 10)), Response(value: 'Infinity', msg: 'Obesity'));
    
    expect(Logic.compute(req: Request(height: 0, weight: 0)), Response(value: 'NaN', msg: 'Confusion'));
    
  });
}