class Data{
  double value;
  String msg;

  Data({this.value = 0.0, this.msg = 'UnderWeight'});
}

class Logic{
  static Data compute({required double height, required double weight}){
    height = height / 100;
    double v = weight / (height * height);
    String x = '';

    if(v <= 18.5){
      x = 'UnderWeight';
    }else if(v > 18.5 && v <= 25) {
      x = 'Healthy';
    } else if(v > 25 && v <= 35) {
      x = 'OverWeight';
    } else{
      x = 'Obesity';
    }

    return Data(value: v, msg: x);
  }
}