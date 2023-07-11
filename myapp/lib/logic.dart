class Request{
  double height;
  double weight;

  Request({required this.height, required this.weight});
}

class Response{
  String value;
  String msg;

  Response({this.value = '0.0', this.msg = 'UnderWeight'});

  @override
  bool operator ==(Object other) {
    if (other is Response && other.runtimeType == runtimeType) {
      if (other.value == value && other.msg == msg) {
        return true;
      }
    }
    return false;
  }
  
  @override
  int get hashCode => Object.hash(value, msg);
  
}

class Logic{
  static Response compute({required Request req}){
    req.height = req.height / 100;
    double v = req.weight / (req.height * req.height);
    String x = '';

    if(v <= 18.5){
      x = 'UnderWeight';
    }else if(v > 18.5 && v <= 25) {
      x = 'Healthy';
    } else if(v > 25 && v <= 35) {
      x = 'OverWeight';
    } else if(v.isNaN){
      x = 'Confusion';
    }else{
      x = 'Obesity';
    }

    return Response(value: v.toStringAsFixed(1), msg: x);
  }
  
}